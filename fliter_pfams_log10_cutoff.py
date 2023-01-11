# Export the gsheet to CSV format; it will be named 'PFAM-results.xlsx - original.csv'
import pandas as pd
from matplotlib import pyplot as plt

project_dir = '.'

cnames = names = ''.join(['', 'target_name,prot_accession,tlen,pfam_name,pfam_id_versioned,qlen,full_e_value,',
                          'full_score,full_bias,domain_n,domain_of,domain_c_evalue,',
                          'domain_i_evalue,domain_score,domain_bias,',
                          'hmm_from,coord_to_1,ali_from,coord_to_2,env_from,coord_to_3,acc,', 'target_description',
                          ]).split(',')

gsheet = pd.read_csv(f'{project_dir}/PFAM-results.xlsx - original.csv',
                     skiprows=2,  # skip first two rows -- we want to ignore current headers
                     comment='#',  # ignore lines starting with # -- these are comments at bottom of file
                     header=None,
                     names=cnames  # new column names
                     )

# shape of a dataframe is in form rows,columns -- number of each
print(gsheet.shape)

# start a new cell
# this will show the top & bottom of the new dataframe, but only the columns we specify -- note the double brackets
print(gsheet[['target_name', 'tlen', 'pfam_name', 'pfam_id_versioned', 'qlen', 'full_e_value', 'target_description']])

# a new cell
# let's strip the version number off of the pfam_id_versioned and create a new column with it
# apply runs a function on each row (axis=1 says rows; axis=0 would be columns
# we use a lambda function -- an anonymous function
# it is given a single argument we've named row
# those are strings, so we can apply standard string function on it
gsheet['pfam_id'] = gsheet.apply(lambda row: row['pfam_id_versioned'].split('.')[0],
                                 axis=1)

# a new cell
# now we can filter on evalue easily!!

gsheet_filtered = gsheet[gsheet['full_e_value'] < 1e-02]
print(gsheet_filtered.shape)  # note number of columns increased by one
gsheet_filtered[['pfam_id']].to_csv("/tmp/a.csv", index=False)

# a new cell

print("Number of unique PFAM IDs: %s" % len(gsheet_filtered['pfam_id'].unique()))

c, f = ['pfam_id'], 'target_name'
cutoff = 1e-02

# note the two different uses of square brackets here
#      the first is being used to select rows
#      the second to select columns for further analysis
#      there is an underlying logic, but I can't explain it -- the syntax was really developed in the language S
#      which was the progenitor of R
myco_protein_counts = gsheet[gsheet['full_e_value'] <= cutoff][c + [f]].groupby(c, as_index=False).count().rename(
    columns={f: 'protein_count'})

# how many models match only once in Mycoplasma proteome?
print("Number of models matched only once in Mycoplasma protemoe = %s" %
    myco_protein_counts[myco_protein_counts['protein_count'] == 1].shape[0])

# a new cell
# we can see effect of different cutoffs
plt.figure(figsize=(20, 4))
x, y = [], []
for exponent in range(-2, -90, -1):
    x.append(exponent)
    df = gsheet[gsheet['full_e_value'] <= 10 ** exponent]
    y.append(len(df['pfam_id'].unique()))
plt.plot(x, y)
plt.xlabel('log10 cutoff')
plt.ylabel('number of PFAM models with >=1 hit')
plt.show()
