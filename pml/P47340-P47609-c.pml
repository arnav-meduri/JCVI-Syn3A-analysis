bg_color white
load P47340.pdb
cmd.color_deep("gray90", 'P47340', 0)

select l_441, P47340 and resi 441
color red, l_441
show spheres, l_441
label name CA+C1*+C1' and byres(l_441), "%s-%s"% (resn,resi)

select l_347, P47340 and resi 347
color green, l_347
show spheres, l_347
label name CA+C1*+C1' and byres(l_347), "%s-%s"% (resn,resi)

select l_218, P47340 and resi 218
color blue, l_218
show spheres, l_218
label name CA+C1*+C1' and byres(l_218), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_498, P47609 and resi 498
color red, r_498
show spheres, r_498
label name CA+C1*+C1' and byres(r_498), "%s-%s"% (resn,resi)

select r_358, P47609 and resi 358
color green, r_358
show spheres, r_358
label name CA+C1*+C1' and byres(r_358), "%s-%s"% (resn,resi)

select r_543, P47609 and resi 543
color blue, r_543
show spheres, r_543
label name CA+C1*+C1' and byres(r_543), "%s-%s"% (resn,resi)
