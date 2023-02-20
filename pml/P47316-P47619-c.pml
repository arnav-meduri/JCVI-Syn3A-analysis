bg_color white
load P47316.pdb
cmd.color_deep("gray90", 'P47316', 0)

select l_41, P47316 and resi 41
color red, l_41
show spheres, l_41
label name CA+C1*+C1' and byres(l_41), "%s-%s"% (resn,resi)

select l_120, P47316 and resi 120
color green, l_120
show spheres, l_120
label name CA+C1*+C1' and byres(l_120), "%s-%s"% (resn,resi)

select l_41, P47316 and resi 41
color red, l_41
show spheres, l_41
label name CA+C1*+C1' and byres(l_41), "%s-%s"% (resn,resi)

load P47619.pdb
cmd.color_deep("gray40", 'P47619', 0)

select r_600, P47619 and resi 600
color red, r_600
show spheres, r_600
label name CA+C1*+C1' and byres(r_600), "%s-%s"% (resn,resi)

select r_426, P47619 and resi 426
color green, r_426
show spheres, r_426
label name CA+C1*+C1' and byres(r_426), "%s-%s"% (resn,resi)

select r_597, P47619 and resi 597
color red, r_597
show spheres, r_597
label name CA+C1*+C1' and byres(r_597), "%s-%s"% (resn,resi)
