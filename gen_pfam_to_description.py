import gzip
import click


@click.command()
@click.option('--uniprot-db', required=True)
@click.option('--out-file', required=True)
def scan_db(uniprot_db, out_file):
    f_out = open(out_file, "w")

    with gzip.open(uniprot_db, 'rt', encoding='ISO-8859-1') as f:
        for line in f:

            if line.startswith("# STOCKHOLM"):
                # reset accession and decsription strings
                pfam_id = desc = ""

            if line.startswith("#=GF AC"):
                if (pfam_id != ""):
                    print("pfam_id %s set before?" % pfam_id)
                pfam_id = line[7:].strip().split('.')[0]

            if line.startswith("#=GF DE"):
                if (desc != ""):
                    print("description %s set before?" % desc)
                desc = line[7:].strip()

            if line.startswith("//"):
                assert (pfam_id != "" and desc != "")
                f_out.write("%s,%s\n" % (pfam_id, desc))

        f_out.close()


scan_db()
