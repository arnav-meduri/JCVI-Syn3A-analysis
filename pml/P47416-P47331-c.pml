bg_color white
load P47416.pdb
cmd.color_deep("gray90", 'P47416', 0)

select l_330, P47416 and resi 330
color red, l_330
show spheres, l_330
label name CA+C1*+C1' and byres(l_330), "%s-%s"% (resn,resi)

select l_277, P47416 and resi 277
color green, l_277
show spheres, l_277
label name CA+C1*+C1' and byres(l_277), "%s-%s"% (resn,resi)

select l_165, P47416 and resi 165
color blue, l_165
show spheres, l_165
label name CA+C1*+C1' and byres(l_165), "%s-%s"% (resn,resi)

select l_376, P47416 and resi 376
color yellow, l_376
show spheres, l_376
label name CA+C1*+C1' and byres(l_376), "%s-%s"% (resn,resi)

load P47331.pdb
cmd.color_deep("gray40", 'P47331', 0)

select r_168, P47331 and resi 168
color red, r_168
show spheres, r_168
label name CA+C1*+C1' and byres(r_168), "%s-%s"% (resn,resi)

select r_194, P47331 and resi 194
color green, r_194
show spheres, r_194
label name CA+C1*+C1' and byres(r_194), "%s-%s"% (resn,resi)

select r_230, P47331 and resi 230
color blue, r_230
show spheres, r_230
label name CA+C1*+C1' and byres(r_230), "%s-%s"% (resn,resi)

select r_203, P47331 and resi 203
color yellow, r_203
show spheres, r_203
label name CA+C1*+C1' and byres(r_203), "%s-%s"% (resn,resi)
