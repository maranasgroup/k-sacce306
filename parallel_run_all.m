%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global fpi integration newton tstart
tstart = tic;
res={};
addpath('./K-FIT-master/');

modelfile = '502_model.xlsx';
mechfile = '502_mech.xlsx';
datafile = '502_data_CENPK.xlsx';

File1 = strcat(pwd,'/',modelfile);
File2 = strcat(pwd,'/',mechfile);
File3 = strcat(pwd,'/',datafile);
try
    load model_502.mat
catch
    model=modcompile(File1,File2,File3);
    save('model_502.mat','model')
end
totf = 0;
toti = 0;
totn = 0;
fpi = 0;
integration = 0;
newton = 0;

model.fstore = Inf;

res=kineticestimate(model,res,true,0);

fprintf('\n')
tout = toc(tstart);
fprintf('FPI - %g\nIntegration - %g\nNewton step - %g\n',fpi,integration,newton);
save('optimal.mat','res','model','tout');

totf = totf + fpi;
toti = toti + integration;
totn = totn + newton;
save('optimal.mat','res','model','tout');


fprintf('Final time\n')
tout = toc(tstart)
fprintf('TOTAL\nFPI - %g\nIntegration - %g\nNewton step - %g\n',totf,toti,totn);
