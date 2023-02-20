bg_color white
load P47495.pdb
cmd.color_deep("gray90", 'P47495', 0)

select l_40, P47495 and resi 40
color red, l_40
show spheres, l_40
label name CA+C1*+C1' and byres(l_40), "%s-%s"% (resn,resi)

select l_300, P47495 and resi 300
color green, l_300
show spheres, l_300
label name CA+C1*+C1' and byres(l_300), "%s-%s"% (resn,resi)

select l_101, P47495 and resi 101
color blue, l_101
show spheres, l_101
label name CA+C1*+C1' and byres(l_101), "%s-%s"% (resn,resi)

select l_289, P47495 and resi 289
color yellow, l_289
show spheres, l_289
label name CA+C1*+C1' and byres(l_289), "%s-%s"% (resn,resi)

select l_109, P47495 and resi 109
color magenta, l_109
show spheres, l_109
label name CA+C1*+C1' and byres(l_109), "%s-%s"% (resn,resi)

select l_124, P47495 and resi 124
color cyan, l_124
show spheres, l_124
label name CA+C1*+C1' and byres(l_124), "%s-%s"% (resn,resi)

select l_297, P47495 and resi 297
color orange, l_297
show spheres, l_297
label name CA+C1*+C1' and byres(l_297), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_511, P47609 and resi 511
color red, r_511
show spheres, r_511
label name CA+C1*+C1' and byres(r_511), "%s-%s"% (resn,resi)

select r_413, P47609 and resi 413
color green, r_413
show spheres, r_413
label name CA+C1*+C1' and byres(r_413), "%s-%s"% (resn,resi)

select r_514, P47609 and resi 514
color blue, r_514
show spheres, r_514
label name CA+C1*+C1' and byres(r_514), "%s-%s"% (resn,resi)

select r_495, P47609 and resi 495
color yellow, r_495
show spheres, r_495
label name CA+C1*+C1' and byres(r_495), "%s-%s"% (resn,resi)

select r_316, P47609 and resi 316
color magenta, r_316
show spheres, r_316
label name CA+C1*+C1' and byres(r_316), "%s-%s"% (resn,resi)

select r_497, P47609 and resi 497
color cyan, r_497
show spheres, r_497
label name CA+C1*+C1' and byres(r_497), "%s-%s"% (resn,resi)

select r_512, P47609 and resi 512
color orange, r_512
show spheres, r_512
label name CA+C1*+C1' and byres(r_512), "%s-%s"% (resn,resi)
