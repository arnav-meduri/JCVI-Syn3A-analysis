bg_color white
load P47542.pdb
cmd.color_deep("gray90", 'P47542', 0)

select l_319, P47542 and resi 319
color red, l_319
show spheres, l_319
label name CA+C1*+C1' and byres(l_319), "%s-%s"% (resn,resi)

select l_155, P47542 and resi 155
color green, l_155
show spheres, l_155
label name CA+C1*+C1' and byres(l_155), "%s-%s"% (resn,resi)

select l_106, P47542 and resi 106
color blue, l_106
show spheres, l_106
label name CA+C1*+C1' and byres(l_106), "%s-%s"% (resn,resi)

select l_34, P47542 and resi 34
color yellow, l_34
show spheres, l_34
label name CA+C1*+C1' and byres(l_34), "%s-%s"% (resn,resi)

load P47609.pdb
cmd.color_deep("gray40", 'P47609', 0)

select r_437, P47609 and resi 437
color red, r_437
show spheres, r_437
label name CA+C1*+C1' and byres(r_437), "%s-%s"% (resn,resi)

select r_464, P47609 and resi 464
color green, r_464
show spheres, r_464
label name CA+C1*+C1' and byres(r_464), "%s-%s"% (resn,resi)

select r_512, P47609 and resi 512
color blue, r_512
show spheres, r_512
label name CA+C1*+C1' and byres(r_512), "%s-%s"% (resn,resi)

select r_293, P47609 and resi 293
color yellow, r_293
show spheres, r_293
label name CA+C1*+C1' and byres(r_293), "%s-%s"% (resn,resi)
