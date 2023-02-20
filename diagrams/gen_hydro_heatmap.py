from collections import defaultdict

pre=defaultdict(lambda:[])
for aa_l,status in ( ('EDNHQSTKR','hydrophilic'),('ILVMFYPGW','hydrophobic'),
                                              ):
    for aa in aa_l:
        for k,v in {'aa':aa,'type':status}.items():
            pre[k].append(v)
aa_properties=pd.DataFrame(pre)
aa_properties

c,f=['lft_aa','rgt_aa'],'dum3'
df=annot_positives[(annot_positives['lft_sp_acc']=='P47345') &
               (annot_positives['rgt_sp_acc']=='P47346')][c+[f]].groupby(c,as_index=False).count()

df=df.rename(columns={
    'lft_aa':'P47345',
    'rgt_aa':'P47346',f:'count'
})
d1=aa_properties.rename(columns={'aa':'P47345','type':'P37345_type'})
d2=aa_properties.rename(columns={'aa':'P47346','type':'P37346_type'})
df=pd.merge(left=df,how='left',on='P47345',right=d1)
df=pd.merge(left=df,how='left',on='P47346',right=d2)
pt=df.pivot_table(index='P37346_type',columns='P37345_type',values='count',
                           aggfunc=sum,fill_value=0)
print(pt)
