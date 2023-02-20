import click

colors = ["red", "green", "blue", "yellow", "magenta", "cyan", "orange", "salmon", "palegreen", "lightblue",
          "wheat", "lightpink", "lightteal", "lightorange", "brown", "limon", "purpleblue", "paleyellow",
          "hotpink", "palecyan", "olive"]

template_1 = """bg_color white
load L_SP.pdb
cmd.color_deep("gray90", 'L_SP', 0)
"""

template_2 = """
load R_SP.pdb
cmd.color_deep("gray40", 'R_SP', 0)
"""


template_resi = """
select KEEPER, SP and resi POS
color COLOR, KEEPER
show spheres, KEEPER
label name CA+C1*+C1' and byres(KEEPER), "%s-%s"% (resn,resi)
"""


@click.command()
@click.option('--hits_file', default='./surfaces.csv')
def scan_args(hits_file):
    with open(hits_file, 'r') as f:
        for line in f.readlines():
            l_pos, l_sp, r_pos, r_sp = line.strip().split(',')
            l_pos_list = l_pos.split('+')
            r_pos_list = r_pos.split('+')
            assert(len(l_pos_list) == len(r_pos_list))
            l_dict = dict()
            i = 0
            with open(f'{l_sp}-{r_sp}-c.pml', 'w') as f_out:
                f_out.write(template_1.replace("L_SP", l_sp))

                # Left protein alignment
                for acid in l_pos_list:
                    if acid in l_dict.keys():
                        color = l_dict[acid]
                    else:
                        color = colors[i]
                        i = i + 1
                        l_dict[acid] = color
                    # f_out.write("color %s, %s and resi %s\n" % (color, l_sp, acid))
                    # f_out.write("show spheres, %s and resi %s\n" % (l_sp, acid))
                    f_out.write(template_resi.replace("SP", l_sp).replace("KEEPER", "l_"+acid).
                                replace("COLOR", color).replace("POS", acid))

                f_out.write(template_2.replace("R_SP", r_sp))

                # Right protein alignment
                for x, acid in enumerate(r_pos_list):
                    color = l_dict[l_pos_list[x]]
                    f_out.write(template_resi.replace("SP", r_sp).replace("KEEPER", "r_"+acid).
                                replace("COLOR", color).replace("POS", acid))

                f_out.close()


scan_args()
