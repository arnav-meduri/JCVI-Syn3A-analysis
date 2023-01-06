import csv
import os
import sys


if __name__ == '__main__':
    in_genome_master_f = sys.argv[1]
    in_dir = sys.argv[2]
    pfam2prot_f = sys.argv[3]
    prot2gen_f = sys.argv[4]

    sequences = set()

    pfam2prot_file = open(pfam2prot_f, "a")
    filenames = next(os.walk(in_dir), (None, None, []))[2]  # [] if no file
    for fn in filenames:
        print("processing " + fn)
        with open(os.path.join(in_dir, fn), 'rt') as f:
            for line in f:
                s = set(line.split(','))
                sequences.update(s)
                for prot in s:
                    pfam2prot_file.write("%s,%s\n" % (fn, prot))
    pfam2prot_file.close()

    print("set size: %d" % len(sequences))

    with open(in_genome_master_f) as f:
        reader = csv.reader(f, skipinitialspace=True)
        d = dict(reader)

    prot2gen_file = open(prot2gen_f, "w")
    for protein in sequences:
        genome = d.get(protein)
        prot2gen_file.write("%s,%s\n" % (protein, genome))
    prot2gen_file.close()
