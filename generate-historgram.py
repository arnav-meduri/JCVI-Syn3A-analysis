import pandas as pd
from matplotlib import pyplot as plt


# note that column nsnes are matched EXACTLY & case matters - I was careless on this in prior emsil 

# read_csv has many useful optionss - read other formats, skip lines, read comoressed files, and much more

# two columns: pfam_id,protein_id
# fixed typo in filename, protein_id

#adding drop_duplicates()
# keeps only one row of each set of identical rows
pfam_to_protein=pd.read_csv("pfam2protein.csv").drop_duplicates()

#two columns: protein_id,species_id
protein_to_genome=pd.read_csv("protein2genome.csv").drop_duplicates()

# merge the two on the common column protein_id
big_table=pd.merge(left=pfam_to_protein,
                   right=protein_to_genome,
                   on='protein_id')
                   
# you can read the results in Gsheets or Excel

# another typo in filename
big_table.to_csv('big_table.csv')
protein_per_genome_count=big_table.groupby(['genome_id',
                                          'pfam_id'],
                                          as_index=False).count().rename(columns={'protein_id':'protein_count'})


                   
# put this in next cell
plt.figure(figsize=(20, 10))
print("max of protein_per_genome_count=%s" % max(protein_per_genome_count['protein_count']))
plt.hist(protein_per_genome_count['protein_count'],
         bins=range(0, 200))
    #1+max(protein_per_genome_count['protein_count'])))
plt.xlabel('proteins per model+genome')

# new cell
# plot distribution of number of models per genome
c, f=['genome_id'],'pfam_id'
model_per_genome_count=protein_per_genome_count.groupby(c+[f],as_index=False).count().rename(columns={f:'model_count'})

#new cell
plt.figure(figsize=(20, 10))
mx=model_per_genome_count['model_count']
print(mx)
print("printing max of mx\n")
n = int(max(mx)[2:])
print(n)
plt.hist(model_per_genome_count['model_count'],
         bins=range(0, 200))
         #max(mx)))
plt.xlabel('PFAM models per genome')
plt.show()

