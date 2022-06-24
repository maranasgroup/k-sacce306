function [res] = kineticestimate(model,res,debug,DFtoggle)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tic
nst = model.options.multistarts;
fmin = Inf;
model.options.dfbase = 1e-6;
rng_counter = 0;
restart = true;
rctr = 0; 
for i = 1:nst
    while restart
        if model.options.reinit
            [x0,A,b,actcon] = initialize(model,rng_counter);
            save('init_x0.mat');

        else
            [~,A,b] = initialize(model,rng_counter);
            x0 = res.reinit_data;
            actcon = find(A*x0<=b);
            rctr = 3;
        end

        [x,f,~,actcon,~,~,~,restart] = lsqsolve(x0,model,A,b,actcon,debug,DFtoggle);
        
        if rctr > 3
            fprintf('Failed.. terminating...\n');
            return
        end
        rctr = rctr + 1;
    end
    if f<fmin
        fmin = f;
        xint = x;
    end
end

model.options.dfbase = eps;
iter = 0;
fail = true;
x = xint;
xopt = x;
ac = actcon;
while fail || iter<=1
    [x,f,fail,ac] = lsqsolve(x,model,A,b,ac,debug,DFtoggle);
    if f<fmin
        fmin = f;
        xopt = x;
        actcon = ac;
    end
    iter = iter+1;
end

res = compileresult(xopt,model,debug);
toc
end

