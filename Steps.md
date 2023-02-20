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
* Download the sequence alignment databases
https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz  0.6G
https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_trembl.fasta.gz 53G
https://ftp.ebi.ac.uk/pub/databases/Pfam/current_release/Pfam-A.full.uniprot.gz  32G

* From Pfam-A.full.uniprot.gz, extract PFAM alignments for the 110 families identifed in previous step, one file per family
* Each PFAM file has a number of alignments, each with a alignment ID and a alignment sequence. The alignment ID consists of protein ID, and a sequence range. From the Alignment IDs, parse the list of protein IDs, and create a unique list of proteins across all 110 families into a unique_proteins.csv file 
* Both uniprot_trembl.fasta.gz and uniprot_sprot.fasta.gz files contain protein data, such as the species they belong to via "OX=" attribute, as well as sequence data for the protein. Using unique_proteins.csv as a guide, parse these files to extract {Protein, Species} mappings as csv file
* Create a list of proteins that are belong to Mycoplasma genus
* Taking two PFAM entries at a time, create a  glue sequence file by concatenating sequences.

#### Run EVCouplings analysis using plmc
* On the glued sequence file, use mycoplasma sequence as focus sequence, run plmc tool to geneate coupling scores across pair amino acids
* Ignore amino acid scores that belong to intra-proteins, subset te number of couplings that havea  z-score > 4
* Normalize the couplings files to map back the indexes in glued sequence back to indexes in protein sequences
* This resulted in a total of 33 possible interactions across pair proteins

#### Geenrate interaction surfaces using Pymol
* Download Alphafold PDB files for each protein in the interaction
* Create a Pymol automation script to draw residues (amino acid) positions between the two interacting proteins
* Orient the protiens to see if the interaction surface can be easily identified
* Save the images and projects in pymol
* For the interactions that provide a clear surfaece, create a heatmap of hydrophillic and hydrophobic interactions 
