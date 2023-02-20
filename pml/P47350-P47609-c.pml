bg_color white
load P47350.pdb
cmd.color_deep("gray90", 'P47350', 0)

select l_323, P47350 and resi 323
color red, l_323
show spheres, l_323
label name CA+C1*+C1' and byres(l_323), "%s-%s"% (resn,resi)

select l_494, P47350 and resi 494
color green, l_494
show spheres, l_494
label name CA+C1*+C1' and byres(l_494), "%s-%s"% (resn,resi)

select l_368, P47350 and resi 368
color blue, l_368
show spheres, l_368
label name CA+C1*+C1' and byres(l_368), "%s-%s"% (resn,resi)

select l_312, P47350 and resi 312
color yellow, l_312
show spheres, l_312
label name CA+C1*+C1' and byres(l_312), "%s-%s"% (resn,resi)

select l_569, P47350 and resi 569
color magenta, l_569
show spheres, l_569
label name CA+C1*+C1' and byres(l_569), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_271, P47609 and resi 271
color red, r_271
show spheres, r_271
label name CA+C1*+C1' and byres(r_271), "%s-%s"% (resn,resi)

select r_512, P47609 and resi 512
color green, r_512
show spheres, r_512
label name CA+C1*+C1' and byres(r_512), "%s-%s"% (resn,resi)

select r_265, P47609 and resi 265
color blue, r_265
show spheres, r_265
label name CA+C1*+C1' and byres(r_265), "%s-%s"% (resn,resi)

select r_457, P47609 and resi 457
color yellow, r_457
show spheres, r_457
label name CA+C1*+C1' and byres(r_457), "%s-%s"% (resn,resi)

select r_358, P47609 and resi 358
color magenta, r_358
show spheres, r_358
label name CA+C1*+C1' and byres(r_358), "%s-%s"% (resn,resi)
