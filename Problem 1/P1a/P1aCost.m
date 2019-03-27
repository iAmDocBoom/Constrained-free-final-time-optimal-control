function cost = P1aCost(p)
t = 0:0.05:1;
tF = p(end);
assignin('base', 'tF', tF);
u = [p(1:end-1)];
[tE,yE] = sim('P1asimu',1,[],[t' u]);
cost = p(end) + (0.05 * p(end)*trapz(u.*u - yE));