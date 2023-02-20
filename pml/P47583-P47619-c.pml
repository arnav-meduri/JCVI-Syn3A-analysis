bg_color white
load P47583.pdb
cmd.color_deep("gray90", 'P47583', 0)

select l_986, P47583 and resi 986
color red, l_986
show spheres, l_986
label name CA+C1*+C1' and byres(l_986), "%s-%s"% (resn,resi)

select l_995, P47583 and resi 995
color green, l_995
show spheres, l_995
label name CA+C1*+C1' and byres(l_995), "%s-%s"% (resn,resi)

select l_907, P47583 and resi 907
color blue, l_907
show spheres, l_907
label name CA+C1*+C1' and byres(l_907), "%s-%s"% (resn,resi)

select l_960, P47583 and resi 960
color yellow, l_960
show spheres, l_960
label name CA+C1*+C1' and byres(l_960), "%s-%s"% (resn,resi)

select l_984, P47583 and resi 984
color magenta, l_984
show spheres, l_984
label name CA+C1*+C1' and byres(l_984), "%s-%s"% (resn,resi)

select l_1016, P47583 and resi 1016
color cyan, l_1016
show spheres, l_1016
label name CA+C1*+C1' and byres(l_1016), "%s-%s"% (resn,resi)

select l_1033, P47583 and resi 1033
color orange, l_1033
show spheres, l_1033
label name CA+C1*+C1' and byres(l_1033), "%s-%s"% (resn,resi)

load P47619.pdb
cmd.color_deep("gray40", 'P47619', 0)

select r_600, P47619 and resi 600
color red, r_600
show spheres, r_600
label name CA+C1*+C1' and byres(r_600), "%s-%s"% (resn,resi)

select r_425, P47619 and resi 425
color green, r_425
show spheres, r_425
label name CA+C1*+C1' and byres(r_425), "%s-%s"% (resn,resi)

select r_438, P47619 and resi 438
color blue, r_438
show spheres, r_438
label name CA+C1*+C1' and byres(r_438), "%s-%s"% (resn,resi)

select r_600, P47619 and resi 600
color yellow, r_600
show spheres, r_600
label name CA+C1*+C1' and byres(r_600), "%s-%s"% (resn,resi)

select r_425, P47619 and resi 425
color magenta, r_425
show spheres, r_425
label name CA+C1*+C1' and byres(r_425), "%s-%s"% (resn,resi)

select r_426, P47619 and resi 426
color cyan, r_426
show spheres, r_426
label name CA+C1*+C1' and byres(r_426), "%s-%s"% (resn,resi)

select r_417, P47619 and resi 417
color orange, r_417
show spheres, r_417
label name CA+C1*+C1' and byres(r_417), "%s-%s"% (resn,resi)
