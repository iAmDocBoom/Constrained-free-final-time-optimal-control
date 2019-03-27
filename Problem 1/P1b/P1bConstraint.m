function [cineq, ceq] = P1bConstraint(p)
cineq = [];
assignin('base', 'tF', p(end));
t=[0:0.05:1]';
u=[p(1:end-1)];
[tout,yout]=sim('P1bsimu',1,[],[t u]);
ceq(1) = -1 + yout(end,1) ;
end