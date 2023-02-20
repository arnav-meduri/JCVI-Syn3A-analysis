bg_color white
load P47316.pdb
cmd.color_deep("gray90", 'P47316', 0)

select l_203, P47316 and resi 203
color red, l_203
show spheres, l_203
label name CA+C1*+C1' and byres(l_203), "%s-%s"% (resn,resi)

select l_37, P47316 and resi 37
color green, l_37
show spheres, l_37
label name CA+C1*+C1' and byres(l_37), "%s-%s"% (resn,resi)

select l_37, P47316 and resi 37
color green, l_37
show spheres, l_37
label name CA+C1*+C1' and byres(l_37), "%s-%s"% (resn,resi)

load P47411.pdb
cmd.color_deep("gray40", 'P47411', 0)

select r_28, P47411 and resi 28
color red, r_28
show spheres, r_28
label name CA+C1*+C1' and byres(r_28), "%s-%s"% (resn,resi)

select r_30, P47411 and resi 30
color green, r_30
show spheres, r_30
label name CA+C1*+C1' and byres(r_30), "%s-%s"% (resn,resi)

select r_79, P47411 and resi 79
color green, r_79
show spheres, r_79
label name CA+C1*+C1' and byres(r_79), "%s-%s"% (resn,resi)
