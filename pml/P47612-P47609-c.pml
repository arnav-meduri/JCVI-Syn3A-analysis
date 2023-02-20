bg_color white
load P47612.pdb
cmd.color_deep("gray90", 'P47612', 0)

select l_327, P47612 and resi 327
color red, l_327
show spheres, l_327
label name CA+C1*+C1' and byres(l_327), "%s-%s"% (resn,resi)

select l_276, P47612 and resi 276
color green, l_276
show spheres, l_276
label name CA+C1*+C1' and byres(l_276), "%s-%s"% (resn,resi)

select l_233, P47612 and resi 233
color blue, l_233
show spheres, l_233
label name CA+C1*+C1' and byres(l_233), "%s-%s"% (resn,resi)

select l_181, P47612 and resi 181
color yellow, l_181
show spheres, l_181
label name CA+C1*+C1' and byres(l_181), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_433, P47609 and resi 433
color red, r_433
show spheres, r_433
label name CA+C1*+C1' and byres(r_433), "%s-%s"% (resn,resi)

select r_499, P47609 and resi 499
color green, r_499
show spheres, r_499
label name CA+C1*+C1' and byres(r_499), "%s-%s"% (resn,resi)

select r_479, P47609 and resi 479
color blue, r_479
show spheres, r_479
label name CA+C1*+C1' and byres(r_479), "%s-%s"% (resn,resi)

select r_543, P47609 and resi 543
color yellow, r_543
show spheres, r_543
label name CA+C1*+C1' and byres(r_543), "%s-%s"% (resn,resi)
