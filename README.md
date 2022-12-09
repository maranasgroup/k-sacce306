# k-sacce306
Kinetic models parameterized using the Kinetic Fluxomics Integration Tool (K-FIT). The original files can be found at https://github.com/maranasgroup/K-FIT (https://doi.org/10.1016/j.ymben.2020.03.001). 


# Run instructions 
Input files required are:
- K-FIT-master folder
- 502_data_BY4741.xlsx or 502_data_CENPK.xlsx ( this is your fluxomics data)
- 502_model.xlsx ( this is your stoichiometric model file)
- 502_mech.xlsx ( this is your regulation mechanism file)
- parallel_run_all_BY4741.m or parallel_run_all_CENPK.m ( matlab run file to start kinetic parameterization)

Output files:
- optimal.mat ( this file will contain the res structure, the model used, and time value of the parameterization process)

results structure (res)
the MATLAB res structure contains information for the kinetic parameterization:
- fmin: SSR value
- kinetic_params: kf, kr, ki predicted parameters 
- predictions: structure contains predictions for fluxes and relative metabolite concentrations to wild-type (WT)

K-FIT kinetic models for Saccharomyces cerevisiae CEN.PK and BY4 are found in the 'CEN solutions' and 'BY4741 solutions' folders

Note about input fluxomics data
- Fluxomics data requires the WT flux distribution and at least one single-gene deletion flux distribution. 
- K-FIT can converge to a stable solution more frequently if the flux distribution data is scaled to 100 WT glucose uptake rate
- It is possible to use data with more than one single-gene deletion and over- or under-expression (levels of expression needs to be specified, and assuming level of over- or under- expression as a proxy for enzyme levels) but would require manual code additions to the matlab run file (i.e., parallel_run_all*.m). User would need to modify the model.v.pert(x,y) matrix to specify relative enzyme concentrations, where x is the reaction index number and y is the pertrubed dataset column number. For an example, please see the run_kctherm138.m file at https://github.com/maranasgroup/k-ctherm138 (https://doi.org/10.1016/j.ymben.2021.12.012)
