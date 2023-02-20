bg_color white
load P47368.pdb
cmd.color_deep("gray90", 'P47368', 0)

select l_172, P47368 and resi 172
color red, l_172
show spheres, l_172
label name CA+C1*+C1' and byres(l_172), "%s-%s"% (resn,resi)

select l_303, P47368 and resi 303
color green, l_303
show spheres, l_303
label name CA+C1*+C1' and byres(l_303), "%s-%s"% (resn,resi)

select l_301, P47368 and resi 301
color blue, l_301
show spheres, l_301
label name CA+C1*+C1' and byres(l_301), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_556, P47609 and resi 556
color red, r_556
show spheres, r_556
label name CA+C1*+C1' and byres(r_556), "%s-%s"% (resn,resi)

select r_348, P47609 and resi 348
color green, r_348
show spheres, r_348
label name CA+C1*+C1' and byres(r_348), "%s-%s"% (resn,resi)

select r_295, P47609 and resi 295
color blue, r_295
show spheres, r_295
label name CA+C1*+C1' and byres(r_295), "%s-%s"% (resn,resi)
