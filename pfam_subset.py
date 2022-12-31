import gzip
file_name = "/Users/arnavmeduri/Downloads/Pfam-A.full.uniprot.gz"
fsm_state = "skipping"
buffer = [""]

acc_file = open("accessions.txt", "rt")
interest_acc = acc_file.read().splitlines()
acc_file.close()
print(interest_acc)


def write_file(b):
    f_out = open("Pfam-reduced.txt", "a")
    f_out.writelines(b)
    f_out.close()


with gzip.open(file_name, 'rt', encoding="ISO-8859-1") as f:
    for line in f:

        if line.startswith("# STOCKHOLM"):
            fsm_state = "scanning"
            buffer = ["\n"]  # reset the buffer

        if line.startswith("#=GF AC"):
            ac = line[7:].strip()
            if ac in interest_acc:
                print("Interest AC found: %s" % ac)
                fsm_state = "writing"
            else:
                fsm_state = "skipping"

        if line.startswith("//") and fsm_state == "writing":
            buffer.append(line)
            print("buffer size: %s" % len(buffer))
            write_file(buffer)
            buffer = ["\n"]
            fsm_state = "reading"

        if fsm_state == "scanning" or fsm_state == "writing":
            buffer.append(line)















