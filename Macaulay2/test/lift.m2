R = ZZ/101[a,r..z]
f = a  * id_(R^1)
g = a^2* id_(R^1)
assert( degree f == {1} )
assert isHomogeneous f
assert( degree g == {2} )
assert isHomogeneous g
h = g // f
assert( degree h == {1} )
assert isHomogeneous h

chk = (f,g) -> assert( target f == target g and (h := f//g; target h == source g and source h == source f and f % g + g * h == f ))
M = R^2
N = R^3
chk(map(M,N,0),map(M,M,1))
chk(map(M,M,1),map(M,N,0))
chk(map(M,M,{{r,s},{t,u}}),map(M,N,{{r,s,t},{u,v,w}}))

-- Local Variables:
-- compile-command: "make lift.okay "
-- End:
