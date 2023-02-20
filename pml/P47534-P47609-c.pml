bg_color white
load P47534.pdb
cmd.color_deep("gray90", 'P47534', 0)

select l_432, P47534 and resi 432
color red, l_432
show spheres, l_432
label name CA+C1*+C1' and byres(l_432), "%s-%s"% (resn,resi)

select l_342, P47534 and resi 342
color green, l_342
show spheres, l_342
label name CA+C1*+C1' and byres(l_342), "%s-%s"% (resn,resi)

select l_139, P47534 and resi 139
color blue, l_139
show spheres, l_139
label name CA+C1*+C1' and byres(l_139), "%s-%s"% (resn,resi)

select l_422, P47534 and resi 422
color yellow, l_422
show spheres, l_422
label name CA+C1*+C1' and byres(l_422), "%s-%s"% (resn,resi)

select l_315, P47534 and resi 315
color magenta, l_315
show spheres, l_315
label name CA+C1*+C1' and byres(l_315), "%s-%s"% (resn,resi)

select l_415, P47534 and resi 415
color cyan, l_415
show spheres, l_415
label name CA+C1*+C1' and byres(l_415), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_537, P47609 and resi 537
color red, r_537
show spheres, r_537
label name CA+C1*+C1' and byres(r_537), "%s-%s"% (resn,resi)

select r_511, P47609 and resi 511
color green, r_511
show spheres, r_511
label name CA+C1*+C1' and byres(r_511), "%s-%s"% (resn,resi)

select r_419, P47609 and resi 419
color blue, r_419
show spheres, r_419
label name CA+C1*+C1' and byres(r_419), "%s-%s"% (resn,resi)

select r_439, P47609 and resi 439
color yellow, r_439
show spheres, r_439
label name CA+C1*+C1' and byres(r_439), "%s-%s"% (resn,resi)

select r_389, P47609 and resi 389
color magenta, r_389
show spheres, r_389
label name CA+C1*+C1' and byres(r_389), "%s-%s"% (resn,resi)

select r_540, P47609 and resi 540
color cyan, r_540
show spheres, r_540
label name CA+C1*+C1' and byres(r_540), "%s-%s"% (resn,resi)
