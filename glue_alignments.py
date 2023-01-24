import pandas as pd
from Bio import SeqIO, AlignIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
import time
import sys
import functools

def timer(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        start_time = time.perf_counter()
        value = func(*args, **kwargs)
        end_time = time.perf_counter()
        run_time = end_time - start_time
        print("Finished {} in {} secs".format(repr(func.__name__), round(run_time, 3)))
        return value

    return wrapper


def parse_protein_name(alignid):
    return alignid.split('.')[0]


# first argument is a PFAM accession
# second argument is a protein_to_species or big_table dataframe
# we're going to build a dataframe that has as one column the actual sequences
@timer
def stockholm_to_dataframe(pfam_id, protein_to_species):
    mult = AlignIO.read(f'{stockholm_files_dir}/{pfam_id}', 'stockholm')
    pre = {k: [] for k in ('protein_id', 'protein_name', 'alignment')}
    for indiv in mult:
        # Each alignment in PFAM file is derived from one protein
        # Each protein is derived from one genome -
        # so as you iterate over the PFAM alignment you are establishing that
        # alignment -> protein relationship by parsing the id for that row of the alignment
        # so you can then look up the genome id you parsed from OX attributes
        protein_id = parse_protein_name(indiv.id)  # you've written this already to extract protein_id from protein_name
        for k, v in {'protein_id': protein_id, 'protein_name': indiv.id, 'alignment': indiv.seq}.items():
            pre[k].append(v)

    # df0 = pd.merge(left=pd.DataFrame(pre))
    df0 = pd.DataFrame(pre)
    df0['pfam_id'] = pfam_id

    # create a dataframe that combines the parsed information with the species_id
    # this is an "inner join" that creates the Cartesian product
    # and then returns only rows where the key protein_id was present in both tables
    return pd.merge(left=df0,
                    right=protein_to_species[['protein_id', 'genome_id']],
                    on=['protein_id'])


@timer
def pair_alignments(pfam_id_a, pfam_id_b, protein_to_species):
    align_df_a = stockholm_to_dataframe(pfam_id_a, protein_to_species)
    align_df_b = stockholm_to_dataframe(pfam_id_b, protein_to_species)

    # since both tables have identically named columns that aren't keys
    # we provide suffixes which will be added to differentiate them
    paired_df = pd.merge(left=align_df_a,
                         right=align_df_b,
                         on=['genome_id'],
                         suffixes=['.lft', '.rgt'])
    paired_df.to_csv(f'{out_dir}/pairs/{pfam_id_a}+{pfam_id_b}.info.csv')
    return paired_df


if __name__ == '__main__':
    project_dir = '.'
    stockholm_files_dir = sys.argv[1]  # '/Volumes/Arnav_SSD/BioComputingProject/generated/split_pfam_files'
    out_dir = sys.argv[2]  # '/Volumes/Arnav_SSD/BioComputingProject/generated/'
    protein_to_genome = pd.read_csv(f'{project_dir}/protein2genome.csv.gz', compression='gzip',
                                    header=None,
                                    names=['protein_id', 'genome_id']).drop_duplicates()

    with open('accessions_sorted.txt') as pfam_f:
        pfams = pfam_f.readlines()

    for i in range(len(pfams) - 1):
        for j in (range(1, len(pfams))):
            pfam_id_a = pfams[i].strip()
            pfam_id_b = pfams[j].strip()
            print("pairing alignments [%s %s]" % (pfam_id_a, pfam_id_b))
            p_df = pair_alignments(pfam_id_a, pfam_id_b, protein_to_genome)
            with open(f'{project_dir}/glued/{pfam_id_a}.{pfam_id_b}.sth', 'w') as wrt:
                for ridx, row in p_df.iterrows():
                    SeqIO.write(
                        SeqRecord(
                            Seq(row['alignment.lft'] + row['alignment.rgt']),
                            id=row['protein_id.lft'] + '+' + row['protein_id.rgt']),
                        wrt, 'stockholm')
