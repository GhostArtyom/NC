SetNonCommutative[a,b,c,d,e,f,g];
ClearMonomialOrder[];
SetMonomialOrder[{a,b,c,d,e,f,g},1];
Iterations=5;

rels={
	a**b**c**d-g,
	a**b**c**d**e - a**a**b
     };
