# k-sacce306
Kinetic models parameterized using the Kinetic Fluxomics Integration Tool (K-FIT). The original files can be found at https://github.com/maranasgroup/K-FIT (https://doi.org/10.1016/j.ymben.2020.03.001). 
K-FIT kinetic models for Saccharomyces cerevisiae CEN.PK and BY4

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
- predictions: structure contains predictions for fluxes and relative metabolite concentrations to WT
