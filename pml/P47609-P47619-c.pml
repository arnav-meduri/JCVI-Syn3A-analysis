bg_color white
load P47609.pdb
cmd.color_deep("gray90", 'P47609', 0)

select l_281, P47609 and resi 281
color red, l_281
show spheres, l_281
label name CA+C1*+C1' and byres(l_281), "%s-%s"% (resn,resi)

select l_322, P47609 and resi 322
color green, l_322
show spheres, l_322
label name CA+C1*+C1' and byres(l_322), "%s-%s"% (resn,resi)

select l_262, P47609 and resi 262
color blue, l_262
show spheres, l_262
label name CA+C1*+C1' and byres(l_262), "%s-%s"% (resn,resi)

select l_296, P47609 and resi 296
color yellow, l_296
show spheres, l_296
label name CA+C1*+C1' and byres(l_296), "%s-%s"% (resn,resi)

select l_363, P47609 and resi 363
color magenta, l_363
show spheres, l_363
label name CA+C1*+C1' and byres(l_363), "%s-%s"% (resn,resi)

load P47619.pdb
cmd.color_deep("gray40", 'P47619', 0)

select r_588, P47619 and resi 588
color red, r_588
show spheres, r_588
label name CA+C1*+C1' and byres(r_588), "%s-%s"% (resn,resi)

select r_418, P47619 and resi 418
color green, r_418
show spheres, r_418
label name CA+C1*+C1' and byres(r_418), "%s-%s"% (resn,resi)

select r_426, P47619 and resi 426
color blue, r_426
show spheres, r_426
label name CA+C1*+C1' and byres(r_426), "%s-%s"% (resn,resi)

select r_551, P47619 and resi 551
color yellow, r_551
show spheres, r_551
label name CA+C1*+C1' and byres(r_551), "%s-%s"% (resn,resi)

select r_504, P47619 and resi 504
color magenta, r_504
show spheres, r_504
label name CA+C1*+C1' and byres(r_504), "%s-%s"% (resn,resi)
