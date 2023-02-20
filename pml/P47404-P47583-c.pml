bg_color white
load P47404.pdb
cmd.color_deep("gray90", 'P47404', 0)

select l_14, P47404 and resi 14
color red, l_14
show spheres, l_14
label name CA+C1*+C1' and byres(l_14), "%s-%s"% (resn,resi)

select l_89, P47404 and resi 89
color green, l_89
show spheres, l_89
label name CA+C1*+C1' and byres(l_89), "%s-%s"% (resn,resi)

select l_82, P47404 and resi 82
color blue, l_82
show spheres, l_82
label name CA+C1*+C1' and byres(l_82), "%s-%s"% (resn,resi)

select l_97, P47404 and resi 97
color yellow, l_97
show spheres, l_97
label name CA+C1*+C1' and byres(l_97), "%s-%s"% (resn,resi)

load P47583.pdb
cmd.color_deep("gray40", 'P47583', 0)

select r_1224, P47583 and resi 1224
color red, r_1224
show spheres, r_1224
label name CA+C1*+C1' and byres(r_1224), "%s-%s"% (resn,resi)

select r_904, P47583 and resi 904
color green, r_904
show spheres, r_904
label name CA+C1*+C1' and byres(r_904), "%s-%s"% (resn,resi)

select r_1096, P47583 and resi 1096
color blue, r_1096
show spheres, r_1096
label name CA+C1*+C1' and byres(r_1096), "%s-%s"% (resn,resi)

select r_894, P47583 and resi 894
color yellow, r_894
show spheres, r_894
label name CA+C1*+C1' and byres(r_894), "%s-%s"% (resn,resi)
