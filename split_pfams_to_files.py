#
# usage: python split_pfams_to_files.py Pfam-A.full.uniprot.gz JCVI-Syn3A-pfam-accessions <target-dir>
# 
import sys
import os
import gzip


def split_pfam(file_name, acc_f, dir_path):

    acc_file = open(acc_f, "rt")
    interest_acc = acc_file.read().splitlines()
    acc_file.close()

    count = len(interest_acc)
    print("Total number of PFAM accessios to process: %s" % count)

    buffer = []
    fsm_state = "undefined"

    with gzip.open(file_name, "rt", encoding="ISO-8859-1") as f:
        for line in f:
            if line.startswith("# STOCKHOLM"):
                fsm_state = "scanning"
                buffer = [line]  # reset buffer
                sequences = set() # reset

            elif line.startswith("#=GF AC"):
                ac = line[7:].strip().split(".", 1)[0]
                if ac in interest_acc:
                    assert(fsm_state == "scanning")
                    fsm_state = "writing"
                    buffer.append(line)
                    print("Scanning PFAM: %s" % ac)
                else:
                    fsm_state = "skipping"

            elif line[0] != "#" and not line.startswith("//") and fsm_state == "writing":
                buffer.append(line)
                # Sequence
                # format: seq-name sequence
                parts = [x.strip() for x in line.split(" ", 1)]
                if len(parts) != 2:
                    # zero length sequence?
                    raise ValueError(
                        "Could not split line into identifier"
                        "and sequence\n" + line
                    )
                seq_id = parts[0].split('/')[0].split('.')[0]
                sequences.add(seq_id)

            elif line.startswith("//") and fsm_state == "writing":
                buffer.append(line)
                out_file_name = os.path.join(dir_path, ac)
                out_file = open(out_file_name, "w")
                for b in buffer:
                    out_file.write(b)
                out_file.close()
                out_file_meta = open(os.path.join(dir_path + "/meta", ac), "w")
                out_file_meta.write(','.join(sequences))
                out_file_meta.close()
                buffer = []  # reset buffer
                sequences = set() # reset
                fsm_state = "undefined"
                count = count - 1
                print ("wrote PFAM %s, %s more to go" % (ac, count))
                if count <= 0:
                    print("Done!")
                    exit(0)
            elif fsm_state == "found_ac":
                buffer.append(line)


if __name__ == '__main__':
    input_pfam_file = sys.argv[1]   # Fully qualified path to Pfam-A.full.uniprot.gz file
    input_acc_file = sys.argv[2]
    out_dir = sys.argv[3]  # Directory path where files will be written as <PFAM-ID>.txt

    split_pfam(input_pfam_file, input_acc_file, out_dir)
