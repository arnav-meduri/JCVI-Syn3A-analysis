import pandas as pd
from Bio import SeqIO, AlignIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
import time
import sys
import functools
import os


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

        # KR 2023-01-26 needed to change this to str(indiv.seq) or throws error later -- BioPython fixed this in later version you have???
        for k, v in {'protein_id': protein_id, 'protein_name': indiv.id, 'alignment': str(indiv.seq)}.items():
            pre[k].append(v)

    # df0 = pd.merge(left=pd.DataFrame(pre))
    df0 = pd.DataFrame(pre)
    df0['pfam_id'] = pfam_id

    # create a dataframe that combines the parsed information with the species_id
    # this is an "inner join" that creates the Cartesian product
    # and then returns only rows where the key protein_id was present in both tables

    # KR mods 2023-01-26
    full_df = pd.merge(left=df0,
                       right=protein_to_species[['protein_id', 'genome_id']],
                       on=['protein_id'])

    # compute counts by genome
    c, f = ['genome_id'], 'protein_id'
    genome_counts = full_df[c + [f]].groupby(c, as_index=False).count().rename(columns={f: 'count_for_genome'})

    # use inner join as a filter for proteins that are unique to a genome
    filtered_df = pd.merge(left=genome_counts[genome_counts['count_for_genome'] == 1][['genome_id']],
                           # select genome_id where count_for_genome==1
                           right=full_df, on='genome_id')

    return filtered_df


if __name__ == '__main__':
    project_dir = '.'
    stockholm_files_dir = sys.argv[1]  # '/Volumes/Arnav_SSD/BioComputingProject/generated/split_pfam_files'
    out_dir = sys.argv[2]  # '/Volumes/Arnav_SSD/BioComputingProject/generated/'
    protein_to_species_f = sys.argv[3]
    protein_to_species = pd.read_csv(protein_to_species_f,
                                     header=None,
                                     names=['protein_id', 'genome_id'])

    pfam_id_a = sys.argv[4]

    pfam_set = set(line.strip() for line in open(f'{stockholm_files_dir}/accessions.csv'))
    if (pfam_id_a in pfam_set):
        pfam_set.remove(pfam_id_a)
        assert (len(pfam_set) == 109)
    else:
        print("PFAM %s not in set!" % pfam_id_a)
        exit(0)

    align_df_a = stockholm_to_dataframe(pfam_id_a, protein_to_species)
    for pfam_id_b in pfam_set:
        align_df_b = stockholm_to_dataframe(pfam_id_b, protein_to_species)
        p_df = pd.merge(left=align_df_a,
                        right=align_df_b,
                        on=['genome_id'],
                        suffixes=['.lft', '.rgt'])

        mycge = p_df[p_df['genome_id'] == 243273]
        if mycge.shape[0] == 0:
            print("Did not find proteins related to 243273, skipping")
            continue

        os.makedirs(f'{out_dir}/glued-{pfam_id_a}', exist_ok=True)
        mycge.to_csv(f'{out_dir}/glued-{pfam_id_a}/{pfam_id_a}-{pfam_id_b}.mycge.csv')
        seq_records = []

        for ridx, row in p_df.iterrows():
            seq_records.append(
                SeqRecord(
                    Seq(row['alignment.lft'] + row['alignment.rgt']),
                    id=row['protein_name.lft'] + '+' + row['protein_name.rgt']))

        l = len(seq_records)
        if l > 8192:
            print("\twriting %s sequences" % l)
            with open(f'{out_dir}/glued-{pfam_id_a}/{pfam_id_a}-{pfam_id_b}.faln', 'w') as wrt:
                SeqIO.write(seq_records, wrt, 'fasta')
        else:
            print("glued alignments [%s %s] have only %d sequences, skipping" % (pfam_id_a, pfam_id_b, l))
