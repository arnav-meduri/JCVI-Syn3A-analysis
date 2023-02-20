bg_color white
load P47318.pdb
cmd.color_deep("gray90", 'P47318', 0)

select l_376, P47318 and resi 376
color red, l_376
show spheres, l_376
label name CA+C1*+C1' and byres(l_376), "%s-%s"% (resn,resi)

select l_379, P47318 and resi 379
color green, l_379
show spheres, l_379
label name CA+C1*+C1' and byres(l_379), "%s-%s"% (resn,resi)

select l_11, P47318 and resi 11
color blue, l_11
show spheres, l_11
label name CA+C1*+C1' and byres(l_11), "%s-%s"% (resn,resi)

load P47619.pdb
cmd.color_deep("gray40", 'P47619', 0)

select r_426, P47619 and resi 426
color red, r_426
show spheres, r_426
label name CA+C1*+C1' and byres(r_426), "%s-%s"% (resn,resi)

select r_426, P47619 and resi 426
color green, r_426
show spheres, r_426
label name CA+C1*+C1' and byres(r_426), "%s-%s"% (resn,resi)

select r_426, P47619 and resi 426
color blue, r_426
show spheres, r_426
label name CA+C1*+C1' and byres(r_426), "%s-%s"% (resn,resi)
