bg_color white
load P47331.pdb
cmd.color_deep("gray90", 'P47331', 0)

select l_162, P47331 and resi 162
color red, l_162
show spheres, l_162
label name CA+C1*+C1' and byres(l_162), "%s-%s"% (resn,resi)

select l_282, P47331 and resi 282
color green, l_282
show spheres, l_282
label name CA+C1*+C1' and byres(l_282), "%s-%s"% (resn,resi)

select l_172, P47331 and resi 172
color blue, l_172
show spheres, l_172
label name CA+C1*+C1' and byres(l_172), "%s-%s"% (resn,resi)

load P47619.pdb
cmd.color_deep("gray40", 'P47619', 0)

select r_536, P47619 and resi 536
color red, r_536
show spheres, r_536
label name CA+C1*+C1' and byres(r_536), "%s-%s"% (resn,resi)

select r_600, P47619 and resi 600
color green, r_600
show spheres, r_600
label name CA+C1*+C1' and byres(r_600), "%s-%s"% (resn,resi)

select r_539, P47619 and resi 539
color blue, r_539
show spheres, r_539
label name CA+C1*+C1' and byres(r_539), "%s-%s"% (resn,resi)
