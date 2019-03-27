function cost = P1cCost(p)
t = 0:0.05:1;
tF = p(end);
assignin('base', 'tF', p(end));
u = [p(1:end-1)];
[tE,yE] = sim('P1csimu',1,[],[t' u]);
cost = p(end) + (0.05 * p(end)*trapz(u.*u - 2*yE));