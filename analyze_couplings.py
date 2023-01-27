import sys
import os
import pandas as pd

if __name__ == '__main__':
    filepath = sys.argv[1]
    print("processing file: " + filepath)
    output_file_name = sys.argv[2]

    d, f = os.path.split(filepath)
    pfams = f.split('.')[0].strip()
    lft_pfam_id = pfams.split('-')[0].strip()
    rgt_pfam_id = pfams.split('-')[1].strip()

    couplings = pd.read_csv(filepath, sep=" ",
                            header=None,
                            names=["pos_lo", "dum1", "dum2", "pos_hi", "dum3", "coupling_score"])[
        ['pos_lo', 'pos_hi', 'coupling_score']]

    # immediately add columns for the left and right pfam ids
    couplings['pfam_lft'] = lft_pfam_id
    couplings['pfam_rgt'] = rgt_pfam_id

    # only output subset that is possibly interesting -- we will determine a cutoff -- this is just to shrink the files
    # couplings scores are bigger = more evidence of correlation
    cutoff = 0.0001  # total guess; we should look at distributions
    couplings[couplings['coupling_score'] >= cutoff].to_csv(output_file_name, header=False, index=False, mode='a')
    print("wrote into: " + output_file_name)
