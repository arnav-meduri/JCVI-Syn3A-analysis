import gzip
import sys
import os
# The program will take a massive Protein Family (PFAM) file as input
# and splits it into multiple PFAM files, one per family.
# Usage: python split_pfams_to_files.py Pfam-reduced.gz project/split_pfam_files


def split_pfam(file_name, dir_path):
    buffer = []
    fsm_state = "undefined"

    with gzip.open(file_name, "rt", encoding="ISO-8859-1") as f:
        for line in f:
            if line.startswith("# STOCKHOLM"):
                assert(fsm_state == "undefined")
                fsm_state = "scanning"
                print("==> New entry begins")
                buffer.append(line)
            elif line.startswith("#=GF AC"):
                ac = line[7:].strip().split(".", 1)[0]
                print("PFAM AC: %s" % ac)
                assert(fsm_state == "scanning")
                fsm_state = "found_ac"
                buffer.append(line)
            elif line.startswith("//"):
                assert(fsm_state == "found_ac")
                buffer.append(line)
                out_file_name = os.path.join(dir_path, ac)
                print("writing output file: %s" % out_file_name)
                out_file = open(out_file_name, "a")
                for b in buffer:
                    out_file.write(b)
                out_file.close()
                buffer = []  # reset buffer
                fsm_state = "undefined"
            else:
                buffer.append(line)


if __name__ == '__main__':
    input_pfam_file = sys.argv[1]   # Input file to split
    out_dir = sys.argv[2]  # Directory path where files will be written as <PFAM-ID>.txt

    split_pfam(input_pfam_file, out_dir)
