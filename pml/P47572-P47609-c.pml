bg_color white
load P47572.pdb
cmd.color_deep("gray90", 'P47572', 0)

select l_30, P47572 and resi 30
color red, l_30
show spheres, l_30
label name CA+C1*+C1' and byres(l_30), "%s-%s"% (resn,resi)

select l_137, P47572 and resi 137
color green, l_137
show spheres, l_137
label name CA+C1*+C1' and byres(l_137), "%s-%s"% (resn,resi)

select l_116, P47572 and resi 116
color blue, l_116
show spheres, l_116
label name CA+C1*+C1' and byres(l_116), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_323, P47609 and resi 323
color red, r_323
show spheres, r_323
label name CA+C1*+C1' and byres(r_323), "%s-%s"% (resn,resi)

select r_474, P47609 and resi 474
color green, r_474
show spheres, r_474
label name CA+C1*+C1' and byres(r_474), "%s-%s"% (resn,resi)

select r_245, P47609 and resi 245
color blue, r_245
show spheres, r_245
label name CA+C1*+C1' and byres(r_245), "%s-%s"% (resn,resi)
