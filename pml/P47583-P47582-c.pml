bg_color white
load P47583.pdb
cmd.color_deep("gray90", 'P47583', 0)

select l_1091, P47583 and resi 1091
color red, l_1091
show spheres, l_1091
label name CA+C1*+C1' and byres(l_1091), "%s-%s"% (resn,resi)

select l_986, P47583 and resi 986
color green, l_986
show spheres, l_986
label name CA+C1*+C1' and byres(l_986), "%s-%s"% (resn,resi)

select l_1039, P47583 and resi 1039
color blue, l_1039
show spheres, l_1039
label name CA+C1*+C1' and byres(l_1039), "%s-%s"% (resn,resi)

select l_1003, P47583 and resi 1003
color yellow, l_1003
show spheres, l_1003
label name CA+C1*+C1' and byres(l_1003), "%s-%s"% (resn,resi)

select l_1199, P47583 and resi 1199
color magenta, l_1199
show spheres, l_1199
label name CA+C1*+C1' and byres(l_1199), "%s-%s"% (resn,resi)

select l_1091, P47583 and resi 1091
color red, l_1091
show spheres, l_1091
label name CA+C1*+C1' and byres(l_1091), "%s-%s"% (resn,resi)

select l_933, P47583 and resi 933
color cyan, l_933
show spheres, l_933
label name CA+C1*+C1' and byres(l_933), "%s-%s"% (resn,resi)

load P47582.pdb
cmd.color_deep("gray40", 'P47582', 0)

select r_343, P47582 and resi 343
color red, r_343
show spheres, r_343
label name CA+C1*+C1' and byres(r_343), "%s-%s"% (resn,resi)

select r_59, P47582 and resi 59
color green, r_59
show spheres, r_59
label name CA+C1*+C1' and byres(r_59), "%s-%s"% (resn,resi)

select r_384, P47582 and resi 384
color blue, r_384
show spheres, r_384
label name CA+C1*+C1' and byres(r_384), "%s-%s"% (resn,resi)

select r_314, P47582 and resi 314
color yellow, r_314
show spheres, r_314
label name CA+C1*+C1' and byres(r_314), "%s-%s"% (resn,resi)

select r_388, P47582 and resi 388
color magenta, r_388
show spheres, r_388
label name CA+C1*+C1' and byres(r_388), "%s-%s"% (resn,resi)

select r_277, P47582 and resi 277
color red, r_277
show spheres, r_277
label name CA+C1*+C1' and byres(r_277), "%s-%s"% (resn,resi)

select r_385, P47582 and resi 385
color cyan, r_385
show spheres, r_385
label name CA+C1*+C1' and byres(r_385), "%s-%s"% (resn,resi)
