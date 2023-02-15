import pandas as pd
import click
import scipy.stats as stats
import os
from collections import defaultdict

@click.command()
@click.option('--overwrite',default=False)
@click.option('--aln_widths',default='./pfam_align_lengths.csv')
@click.argument('coupling_files',nargs=-1)
def scan_args(overwrite,aln_widths,coupling_files):
    # widths of the PFAM alignments - used to locate where boundary between PFAMs is in glue file
    aln_widths=pd.read_csv(aln_widths,header=None,names=['pfam_id','pfam_len'])

    # existing set of alignments 
    aln=pd.read_csv(f'aln.csv')
    
    for fn in coupling_files:

        pfam_id_lft,pfam_id_rgt=fn.split('/')[-1].split('.')[0].split('-')

        pfam_lft_len=aln_widths[aln_widths['pfam_id']==pfam_id_lft].iloc[0]['pfam_len']
        pfam_rgt_len=aln_widths[aln_widths['pfam_id']==pfam_id_rgt].iloc[0]['pfam_len']


        print(fn,pfam_id_lft,pfam_id_rgt,pfam_lft_len,sep="\t")
        couplings=pd.read_csv(fn,sep=" ",header=None,
                              names=['lft_pos','lft_aa','rgt_pos','rgt_aa','dum3','raw'])
        couplings['lft_pfam_id']=pfam_id_lft
        couplings['rgt_pfam_id']=pfam_id_rgt

        # condense couplings into unique set of positions and amino acids
        pre_seq=pd.concat([ couplings[['lft_pos','lft_aa']].rename(columns={'lft_pos':'pos','lft_aa':'aa'}),
                    couplings[['rgt_pos','rgt_aa']].rename(columns={'rgt_pos':'pos','rgt_aa':'aa'})]).drop_duplicates().sort_values('pos')

        # select the two alignments of interest (Mycoplasma genitalium proteins)
        selected=aln[  (aln['lft_pfam_id']==pfam_id_lft)
                     & (aln['rgt_pfam_id']==pfam_id_rgt)
        ].sort_values('order')
        
        print(pfam_id_lft,pfam_id_rgt,aln.shape,selected.shape)
        #print(pfam_id_lft,pfam_id_rgt,aln.shape,selected.shape,list(aln['rgt_pfam_id']))

        # if selected has other than 2 rows, we're missing data
        if selected.shape[0]==2:
            sp_pos,sp_aa,sp_id=[],[],[]
            for ridx,row in selected.iterrows():  # each row is one alignment
                # changed this to list comprehension with filter - old code had wrong positions
                # Arnav - the number of rows was not matching unless we skip over lower case letters in the sequence
                #
                for n,aa in enumerate( [ c for c in row['glue_seq'] if c != '-' and c.isupper()]):
                       sp_pos.append(n+row['sp_lo'])
                       sp_aa.append(row['glue_seq'][n])
                       sp_id.append(row['sp_id'])                     

            # flagging cases where there is a length mismatch
            if len(sp_id)!=pre_seq.shape[0]:
                print(f"pre_seq has {pre_seq.shape[0]} rows but sp_id has {len(sp_id)} entries! skipping!")
                continue
            # if throwing exception here, then number of rows not matching - align.csv entry not correct for at least one           
            pre_seq['sp_id']=sp_id
            pre_seq['sp_aa']=sp_aa
            pre_seq['sp_pos']=sp_pos
        else:
            print("[%s-%s] shape is %s\n" % (pfam_id_lft, pfam_id_rgt, selected.shape[0]) )
            for cl in ('sp_id','sp_aa','sp_pos'):
                pre_seq[cl]=None
            
        pre_seq['pfam_id']=pre_seq.apply(lambda row:  pfam_id_lft if row['pos']<=pfam_lft_len else pfam_id_rgt,axis=1)


        norm=pd.read_csv(f'{fn}.norm.csv')
        norm=norm[(norm['zscore']>=4) & (norm['inter_pfam']==True)].copy()

        # ,pos,aa,sp_id,sp_aa,sp_pos,pfam_id
        norm2=pd.merge(left=norm,
                 right=pre_seq[['pos','sp_id','sp_pos']].rename(columns={'pos':'lft_pos','sp_id':'lft_sp_id','sp_pos':'lft_sp_pos'}),
                 on='lft_pos',how='left')
        norm3=pd.merge(left=norm2,
                 right=pre_seq[['pos','sp_id','sp_pos']].rename(columns={'pos':'rgt_pos','sp_id':'rgt_sp_id','sp_pos':'rgt_sp_pos'}),
                 on='rgt_pos',how='left')
        norm3.to_csv(f'{fn}.annot.csv')
        
        pre_seq.to_csv(f'{fn}.seq.csv');


        # if missing alignment rows, then they must be computed -- so print out sequences
        if selected.shape[0]!=2:
           print(selected.shape[0],"rows for",pfam_id_lft,pfam_id_rgt)
           seqs=defaultdict(lambda:[])
           for ridx,row in pre_seq.iterrows():
               seqs[row['pfam_id']].append(row['aa'])

           for pfam_id,aa_list in seqs.items():
               print(f">{pfam_id}")
               print(''.join(aa_list))
        # want both a mapping CSV and the sequences themselves?


scan_args()
