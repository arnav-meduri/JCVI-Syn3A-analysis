# Steps


####  Download JCVI-Syn3A in Genbank format  https://www.ncbi.nlm.nih.gov/nuccore/CP016816.2
* Extract all the annotated proteins to a FASTA file using BioPython - “proteome”

####  Identify the subset of protein families to investigate for multiple sequence alignment
* Search proteome with PFAM-A library of HMMs using HMMER (http://hmmer.org/)
* Downloaded the Pfam-A.hmm file from https://www.ebi.ac.uk/interpro/download/pfam/ 
* Run  hmmsearch using the following command 
```
hmmsearch --domtblout results Pfam-A.hmm JCVI-Syn3A.fasta
```
* import the results into the spreadsheet
https://docs.google.com/spreadsheets/d/1HmQqsr1AkJJAbIr0uFgV-ODc8-vDzQNc/edit?usp=share_link&ouid=112612624735524398876&rtpof=true&sd=true

* Sorted the sheet by 'E-value' column  and marked all accessions  > 1e-60
* Graph: histogram of PFAM scores
* Graph: histogram of number of PFAM hits per protein
* Graph: histogram of number of proteins per PFAM model with hits
* The final result was a list of 110 protein families listed in file JCVI-Syn3A-pfam-accessions

#### Generating multiple Sequence alignment files
* Download the following database files
https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz  0.6G
https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_trembl.fasta.gz 53G
https://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.full.uniprot.gz  32G

