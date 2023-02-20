bg_color white
load P47436.pdb
cmd.color_deep("gray90", 'P47436', 0)

select l_199, P47436 and resi 199
color red, l_199
show spheres, l_199
label name CA+C1*+C1' and byres(l_199), "%s-%s"% (resn,resi)

select l_120, P47436 and resi 120
color green, l_120
show spheres, l_120
label name CA+C1*+C1' and byres(l_120), "%s-%s"% (resn,resi)

select l_120, P47436 and resi 120
color green, l_120
show spheres, l_120
label name CA+C1*+C1' and byres(l_120), "%s-%s"% (resn,resi)

select l_207, P47436 and resi 207
color blue, l_207
show spheres, l_207
label name CA+C1*+C1' and byres(l_207), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_394, P47609 and resi 394
color red, r_394
show spheres, r_394
label name CA+C1*+C1' and byres(r_394), "%s-%s"% (resn,resi)

select r_299, P47609 and resi 299
color green, r_299
show spheres, r_299
label name CA+C1*+C1' and byres(r_299), "%s-%s"% (resn,resi)

select r_314, P47609 and resi 314
color green, r_314
show spheres, r_314
label name CA+C1*+C1' and byres(r_314), "%s-%s"% (resn,resi)

select r_262, P47609 and resi 262
color blue, r_262
show spheres, r_262
label name CA+C1*+C1' and byres(r_262), "%s-%s"% (resn,resi)
