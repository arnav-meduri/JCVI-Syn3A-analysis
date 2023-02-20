bg_color white
load P47316.pdb
cmd.color_deep("gray90", 'P47316', 0)

select l_120, P47316 and resi 120
color red, l_120
show spheres, l_120
label name CA+C1*+C1' and byres(l_120), "%s-%s"% (resn,resi)

select l_123, P47316 and resi 123
color green, l_123
show spheres, l_123
label name CA+C1*+C1' and byres(l_123), "%s-%s"% (resn,resi)

select l_54, P47316 and resi 54
color blue, l_54
show spheres, l_54
label name CA+C1*+C1' and byres(l_54), "%s-%s"% (resn,resi)

load P47583.pdb
cmd.color_deep("gray40", 'P47583', 0)

select r_1042, P47583 and resi 1042
color red, r_1042
show spheres, r_1042
label name CA+C1*+C1' and byres(r_1042), "%s-%s"% (resn,resi)

select r_1006, P47583 and resi 1006
color green, r_1006
show spheres, r_1006
label name CA+C1*+C1' and byres(r_1006), "%s-%s"% (resn,resi)

select r_880, P47583 and resi 880
color blue, r_880
show spheres, r_880
label name CA+C1*+C1' and byres(r_880), "%s-%s"% (resn,resi)
