%% Constrained free final time optimal control
clear all;
close all;
clc
tF = 1;
x0 = 0;
t = 0:0.05:1;
u = 0.1* ones(length(t),1);
u(end+1) = tF;
%% Optimization
lb = -1 * ones(length(t),1);
ub = 1 * ones(length(t),1);
lb(end+1) = 0.1;
ub(end+1) = 10;
options = optimset('Display', 'iter', 'TolCon', 1e-4,'TolFun', 1e-4, 'PlotFcns','optimplotx', 'MaxFunEvals', 4400);
[yE,cost] = fmincon('P1aCost',u,[],[],[],[],lb,ub,'P1aConstraint',options)
%% Plotting
tF = yE(end);
[tE,yout] = sim('P1asimu',1,[],[t' yE(1:end-1)]);
figure;
plot(t*tF,(yout(:,1)));
legend('x1','x2','x3'); title('State time history');
grid;
figure;
plot(t*tF,yE(1:end-1))
title('Control time history')