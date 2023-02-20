from matplotlib import pyplot as plt
import pandas as pd
import seaborn as sns
hit1_subset=pd.read_csv(f'{project_dir}/PF01425-PF02934.couplings.norm.annot.csv')
hit1_subset=hit1_annot[(hit1_annot['zscore']>=4) & (hit1_annot['lft_sp_id']!=hit1_annot['rgt_sp_id'])][['zscore','lft_sp_id','rgt_sp_id',
                                     'lft_aa','lft_sp_pos','rgt_aa','rgt_sp_pos']]
print(len(hit1_subset['lft_sp_pos'].unique()),
      len(hit1_subset['rgt_sp_pos'].unique()),hit1_subset.shape
     )

pt=hit1_subset.pivot_table(index=['lft_sp_pos'],
                       columns=['rgt_sp_pos'],
                       values='zscore',aggfunc=len)

plt.figure(figsize=(20,10))
sns.heatmap(pt)
