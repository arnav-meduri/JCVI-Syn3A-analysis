bg_color white
load P47471.pdb
cmd.color_deep("gray90", 'P47471', 0)

select l_173, P47471 and resi 173
color red, l_173
show spheres, l_173
label name CA+C1*+C1' and byres(l_173), "%s-%s"% (resn,resi)

select l_57, P47471 and resi 57
color green, l_57
show spheres, l_57
label name CA+C1*+C1' and byres(l_57), "%s-%s"% (resn,resi)

select l_56, P47471 and resi 56
color blue, l_56
show spheres, l_56
label name CA+C1*+C1' and byres(l_56), "%s-%s"% (resn,resi)

select l_157, P47471 and resi 157
color yellow, l_157
show spheres, l_157
label name CA+C1*+C1' and byres(l_157), "%s-%s"% (resn,resi)

select l_245, P47471 and resi 245
color magenta, l_245
show spheres, l_245
label name CA+C1*+C1' and byres(l_245), "%s-%s"% (resn,resi)

select l_61, P47471 and resi 61
color cyan, l_61
show spheres, l_61
label name CA+C1*+C1' and byres(l_61), "%s-%s"% (resn,resi)

select l_36, P47471 and resi 36
color orange, l_36
show spheres, l_36
label name CA+C1*+C1' and byres(l_36), "%s-%s"% (resn,resi)

load P47473.pdb
cmd.color_deep("gray40", 'P47473', 0)

select r_466, P47473 and resi 466
color red, r_466
show spheres, r_466
label name CA+C1*+C1' and byres(r_466), "%s-%s"% (resn,resi)

select r_301, P47473 and resi 301
color green, r_301
show spheres, r_301
label name CA+C1*+C1' and byres(r_301), "%s-%s"% (resn,resi)

select r_273, P47473 and resi 273
color blue, r_273
show spheres, r_273
label name CA+C1*+C1' and byres(r_273), "%s-%s"% (resn,resi)

select r_576, P47473 and resi 576
color yellow, r_576
show spheres, r_576
label name CA+C1*+C1' and byres(r_576), "%s-%s"% (resn,resi)

select r_573, P47473 and resi 573
color magenta, r_573
show spheres, r_573
label name CA+C1*+C1' and byres(r_573), "%s-%s"% (resn,resi)

select r_250, P47473 and resi 250
color cyan, r_250
show spheres, r_250
label name CA+C1*+C1' and byres(r_250), "%s-%s"% (resn,resi)

select r_271, P47473 and resi 271
color orange, r_271
show spheres, r_271
label name CA+C1*+C1' and byres(r_271), "%s-%s"% (resn,resi)
