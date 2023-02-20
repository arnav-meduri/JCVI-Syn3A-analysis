bg_color white
load P47356.pdb
cmd.color_deep("gray90", 'P47356', 0)

select l_77, P47356 and resi 77
color red, l_77
show spheres, l_77
label name CA+C1*+C1' and byres(l_77), "%s-%s"% (resn,resi)

select l_209, P47356 and resi 209
color green, l_209
show spheres, l_209
label name CA+C1*+C1' and byres(l_209), "%s-%s"% (resn,resi)

select l_199, P47356 and resi 199
color blue, l_199
show spheres, l_199
label name CA+C1*+C1' and byres(l_199), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_301, P47609 and resi 301
color red, r_301
show spheres, r_301
label name CA+C1*+C1' and byres(r_301), "%s-%s"% (resn,resi)

select r_498, P47609 and resi 498
color green, r_498
show spheres, r_498
label name CA+C1*+C1' and byres(r_498), "%s-%s"% (resn,resi)

select r_279, P47609 and resi 279
color blue, r_279
show spheres, r_279
label name CA+C1*+C1' and byres(r_279), "%s-%s"% (resn,resi)
