bg_color white
load P47416.pdb
cmd.color_deep("gray90", 'P47416', 0)

select l_268, P47416 and resi 268
color red, l_268
show spheres, l_268
label name CA+C1*+C1' and byres(l_268), "%s-%s"% (resn,resi)

select l_347, P47416 and resi 347
color green, l_347
show spheres, l_347
label name CA+C1*+C1' and byres(l_347), "%s-%s"% (resn,resi)

select l_207, P47416 and resi 207
color blue, l_207
show spheres, l_207
label name CA+C1*+C1' and byres(l_207), "%s-%s"% (resn,resi)

select l_105, P47416 and resi 105
color yellow, l_105
show spheres, l_105
label name CA+C1*+C1' and byres(l_105), "%s-%s"% (resn,resi)

load P47583.pdb
cmd.color_deep("gray40", 'P47583', 0)

select r_875, P47583 and resi 875
color red, r_875
show spheres, r_875
label name CA+C1*+C1' and byres(r_875), "%s-%s"% (resn,resi)

select r_873, P47583 and resi 873
color green, r_873
show spheres, r_873
label name CA+C1*+C1' and byres(r_873), "%s-%s"% (resn,resi)

select r_1240, P47583 and resi 1240
color blue, r_1240
show spheres, r_1240
label name CA+C1*+C1' and byres(r_1240), "%s-%s"% (resn,resi)

select r_980, P47583 and resi 980
color yellow, r_980
show spheres, r_980
label name CA+C1*+C1' and byres(r_980), "%s-%s"% (resn,resi)
