bg_color white
load P47334.pdb
cmd.color_deep("gray90", 'P47334', 0)

select l_130, P47334 and resi 130
color red, l_130
show spheres, l_130
label name CA+C1*+C1' and byres(l_130), "%s-%s"% (resn,resi)

select l_130, P47334 and resi 130
color red, l_130
show spheres, l_130
label name CA+C1*+C1' and byres(l_130), "%s-%s"% (resn,resi)

select l_130, P47334 and resi 130
color red, l_130
show spheres, l_130
label name CA+C1*+C1' and byres(l_130), "%s-%s"% (resn,resi)

load P47619.pdb
cmd.color_deep("gray40", 'P47619', 0)

select r_600, P47619 and resi 600
color red, r_600
show spheres, r_600
label name CA+C1*+C1' and byres(r_600), "%s-%s"% (resn,resi)

select r_438, P47619 and resi 438
color red, r_438
show spheres, r_438
label name CA+C1*+C1' and byres(r_438), "%s-%s"% (resn,resi)

select r_597, P47619 and resi 597
color red, r_597
show spheres, r_597
label name CA+C1*+C1' and byres(r_597), "%s-%s"% (resn,resi)
