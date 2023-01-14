MATLAB & R environment.

One sample dataset:

LUAD input data:
PPI network: adj_edges_all.txt
microarray data: selectLUAD_case.csv, selectLUAD_control.csv
gene name: gene.mat, ESCA_case.xlsx
clinical data: LUAD surv.csv in biomarker folder

Running for generating direct interaction network:  MFE_network.m
input data & file: granger.m, lasso_regress.m, selectLUAD_case.csv, selectLUAD_control.csv, adj_edges_all.txt
output data: LUAD_network_TA.txt

Running for sMFE:  sMFE_LUAD.m
output data: LUAD_sMFE.csv, LUAD gene.xlsx, LIHC identity.csv, LIHC surv.csv

Running for finding O-sMFE & P-sMFE biomarkers: sMFE_LUAD_biomarkers.m, survival analysis.R
LUAD identity.csv, LUAD surv.csv were need to find biomarkers, and had bene in biomarker folder. 
You also can run  sMFE_LUAD_biomarkers.m, there will create  LUAD identity.csv, LUAD surv.csv in biomarker folder.
Next, you run survival analysis.R in Rstudio, these biomarkers will be found in biomarker folder.
output data: PDF file in biomarker folder
Remark: You should take the sMFE folder to your desktop

