from Bio import SeqIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
import gzip

# read uniq_protein_alignments.txt into a variable called interest_acc
acc_file = open("uniq_protein_alignments.txt", "r")
interest_acc = acc_file.read().splitlines()
acc_file.close()
# print(interest_acc)

f_out = open("protein-accession-ox-mapping.txt", "w")

with gzip.open("/Users/abhinavmeduri/Downloads/uniprot_trembl.fasta.gz", "rt", encoding="ISO-8859-1") as handle:
    for record in SeqIO.parse(handle, "fasta"):
        acc = record.id.split('|')[1]
        if acc in interest_acc:
            attrs = record.description.split(" ")  # split description into string array
            print(record.description)
            attr_arr = [x for x in attrs if x.startswith("OX=")]
            assert len(attr_arr) == 1
            ox_attr_val = attr_arr[0][3:].strip()
            print("%s, %s" % (acc, ox_attr_val))
            f_out.write("%s, %s\n" % (acc, ox_attr_val))

f_out.close()
