from Bio import AlignIO

file_name = "Pfam-reduced.txt"
fmt = "stockholm"

count = 0
for alignIt in AlignIO.parse(file_name, fmt):
    for align in alignIt:
        print(align.annotations["accession"])
