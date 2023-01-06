import pandas as pd
from matplotlib import pyplot as plt

project_dir = '.'

# two columns: pfam_id, protein_id
pfam_to_protein = pd.read_csv(f'{project_dir}/pfam2protein.csv',
                              header=None,
                              names=['pfam_id', 'protein_id']).drop_duplicates()

# two columns: protein_id, genome_id
protein_to_genome = pd.read_csv(f'{project_dir}/protein2genome.csv',
                                header=None,
                                names=['protein_id', 'genome_id']).drop_duplicates()

# two columns: genome_id, species
# genome_id_to_species = pd.read_csv(f'{project_dir}/scinames.tsv',
#                                    header=None,  # there's no line with column names
#                                    names=['genome_id', 'species']).drop_duplicates()

# protein_to_species = pd.merge(left=protein_to_genome,
#                               right=genome_id_to_species,
#                               on='genome_id')

big_table = pd.merge(left=pfam_to_protein,
                     right=protein_to_genome,
                     on='protein_id')

big_table.to_csv('big_table.csv')
print("created big_table.csv")

protein_per_genome_count = big_table.groupby(['genome_id',
                                              'pfam_id'],
                                             as_index=False).count().rename(columns={'protein_id': 'protein_count'})

# put this in next cell
plt.figure(figsize=(20, 10))
print("max of protein_per_genome_count=%s" % max(protein_per_genome_count['protein_count']))
plt.hist(protein_per_genome_count['protein_count'],
         bins=range(0, 200))
# 1+max(protein_per_genome_count['protein_count'])))
plt.xlabel('proteins per model+genome')

# new cell
# plot distribution of number of models per genome
c, f = ['genome_id'], 'pfam_id'

model_per_genome_count = protein_per_genome_count[c + [f]].groupby(c, as_index=False).count().rename(
    columns={f: 'model_count'})

# new cell
plt.figure(figsize=(20, 10))
mx = model_per_genome_count['model_count']
print(len(mx))
print("printing max of mx\n")
n = int(max(mx))
print(n)

cutoff = 10
# filter the dataset for only those with >=cutoff
df = model_per_genome_count[model_per_genome_count['model_count'] >= cutoff]
h = plt.hist(df['model_count'], bins=100)
plt.xlabel('PFAM models per genome')
plt.show()
