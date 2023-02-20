bg_color white
load P47318.pdb
cmd.color_deep("gray90", 'P47318', 0)

select l_84, P47318 and resi 84
color red, l_84
show spheres, l_84
label name CA+C1*+C1' and byres(l_84), "%s-%s"% (resn,resi)

select l_63, P47318 and resi 63
color green, l_63
show spheres, l_63
label name CA+C1*+C1' and byres(l_63), "%s-%s"% (resn,resi)

select l_32, P47318 and resi 32
color blue, l_32
show spheres, l_32
label name CA+C1*+C1' and byres(l_32), "%s-%s"% (resn,resi)

select l_103, P47318 and resi 103
color yellow, l_103
show spheres, l_103
label name CA+C1*+C1' and byres(l_103), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_271, P47609 and resi 271
color red, r_271
show spheres, r_271
label name CA+C1*+C1' and byres(r_271), "%s-%s"% (resn,resi)

select r_341, P47609 and resi 341
color green, r_341
show spheres, r_341
label name CA+C1*+C1' and byres(r_341), "%s-%s"% (resn,resi)

select r_389, P47609 and resi 389
color blue, r_389
show spheres, r_389
label name CA+C1*+C1' and byres(r_389), "%s-%s"% (resn,resi)

select r_433, P47609 and resi 433
color yellow, r_433
show spheres, r_433
label name CA+C1*+C1' and byres(r_433), "%s-%s"% (resn,resi)
