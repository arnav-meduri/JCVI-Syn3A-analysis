bg_color white
load P47334.pdb
cmd.color_deep("gray90", 'P47334', 0)

select l_79, P47334 and resi 79
color red, l_79
show spheres, l_79
label name CA+C1*+C1' and byres(l_79), "%s-%s"% (resn,resi)

select l_148, P47334 and resi 148
color green, l_148
show spheres, l_148
label name CA+C1*+C1' and byres(l_148), "%s-%s"% (resn,resi)

select l_100, P47334 and resi 100
color blue, l_100
show spheres, l_100
label name CA+C1*+C1' and byres(l_100), "%s-%s"% (resn,resi)

load P47583.pdb
cmd.color_deep("gray40", 'P47583', 0)

select r_1006, P47583 and resi 1006
color red, r_1006
show spheres, r_1006
label name CA+C1*+C1' and byres(r_1006), "%s-%s"% (resn,resi)

select r_854, P47583 and resi 854
color green, r_854
show spheres, r_854
label name CA+C1*+C1' and byres(r_854), "%s-%s"% (resn,resi)

select r_1258, P47583 and resi 1258
color blue, r_1258
show spheres, r_1258
label name CA+C1*+C1' and byres(r_1258), "%s-%s"% (resn,resi)
