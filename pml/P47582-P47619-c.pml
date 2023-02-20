bg_color white
load P47582.pdb
cmd.color_deep("gray90", 'P47582', 0)

select l_59, P47582 and resi 59
color red, l_59
show spheres, l_59
label name CA+C1*+C1' and byres(l_59), "%s-%s"% (resn,resi)

select l_71, P47582 and resi 71
color green, l_71
show spheres, l_71
label name CA+C1*+C1' and byres(l_71), "%s-%s"% (resn,resi)

select l_144, P47582 and resi 144
color blue, l_144
show spheres, l_144
label name CA+C1*+C1' and byres(l_144), "%s-%s"% (resn,resi)

select l_356, P47582 and resi 356
color yellow, l_356
show spheres, l_356
label name CA+C1*+C1' and byres(l_356), "%s-%s"% (resn,resi)

select l_68, P47582 and resi 68
color magenta, l_68
show spheres, l_68
label name CA+C1*+C1' and byres(l_68), "%s-%s"% (resn,resi)

load P47619.pdb
cmd.color_deep("gray40", 'P47619', 0)

select r_600, P47619 and resi 600
color red, r_600
show spheres, r_600
label name CA+C1*+C1' and byres(r_600), "%s-%s"% (resn,resi)

select r_600, P47619 and resi 600
color green, r_600
show spheres, r_600
label name CA+C1*+C1' and byres(r_600), "%s-%s"% (resn,resi)

select r_426, P47619 and resi 426
color blue, r_426
show spheres, r_426
label name CA+C1*+C1' and byres(r_426), "%s-%s"% (resn,resi)

select r_438, P47619 and resi 438
color yellow, r_438
show spheres, r_438
label name CA+C1*+C1' and byres(r_438), "%s-%s"% (resn,resi)

select r_418, P47619 and resi 418
color magenta, r_418
show spheres, r_418
label name CA+C1*+C1' and byres(r_418), "%s-%s"% (resn,resi)
