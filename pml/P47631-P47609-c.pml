bg_color white
load P47631.pdb
cmd.color_deep("gray90", 'P47631', 0)

select l_205, P47631 and resi 205
color red, l_205
show spheres, l_205
label name CA+C1*+C1' and byres(l_205), "%s-%s"% (resn,resi)

select l_311, P47631 and resi 311
color green, l_311
show spheres, l_311
label name CA+C1*+C1' and byres(l_311), "%s-%s"% (resn,resi)

select l_136, P47631 and resi 136
color blue, l_136
show spheres, l_136
label name CA+C1*+C1' and byres(l_136), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_316, P47609 and resi 316
color red, r_316
show spheres, r_316
label name CA+C1*+C1' and byres(r_316), "%s-%s"% (resn,resi)

select r_481, P47609 and resi 481
color green, r_481
show spheres, r_481
label name CA+C1*+C1' and byres(r_481), "%s-%s"% (resn,resi)

select r_505, P47609 and resi 505
color blue, r_505
show spheres, r_505
label name CA+C1*+C1' and byres(r_505), "%s-%s"% (resn,resi)
