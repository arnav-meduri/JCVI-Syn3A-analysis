bg_color white
load P47647.pdb
cmd.color_deep("gray90", 'P47647', 0)

select l_368, P47647 and resi 368
color red, l_368
show spheres, l_368
label name CA+C1*+C1' and byres(l_368), "%s-%s"% (resn,resi)

select l_200, P47647 and resi 200
color green, l_200
show spheres, l_200
label name CA+C1*+C1' and byres(l_200), "%s-%s"% (resn,resi)

select l_240, P47647 and resi 240
color blue, l_240
show spheres, l_240
label name CA+C1*+C1' and byres(l_240), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_379, P47609 and resi 379
color red, r_379
show spheres, r_379
label name CA+C1*+C1' and byres(r_379), "%s-%s"% (resn,resi)

select r_308, P47609 and resi 308
color green, r_308
show spheres, r_308
label name CA+C1*+C1' and byres(r_308), "%s-%s"% (resn,resi)

select r_376, P47609 and resi 376
color blue, r_376
show spheres, r_376
label name CA+C1*+C1' and byres(r_376), "%s-%s"% (resn,resi)
