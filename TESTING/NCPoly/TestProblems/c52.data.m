SetNonCommutative[a,b,c,d,x,y,z,w,ia,ib,ic,id];
ClearMonomialOrder[];
SetMonomialOrder[{a,b,c,d,ia,ib,ic,id},1];
SetMonomialOrder[{z},2];
SetMonomialOrder[{x,y,w},3];
Iterations=11;

rels={
	y ** c -> 1 - b ** z,
	z ** y -> -d ** a,
	w**x -> z**a,
	x ** z -> -a ** c
     }; 

invrel={
	a**ia ->1,
	ia**a ->1,
	b**ib ->1,
	ib**b ->1,
	c**ic ->1,
	ic**c ->1,
	d**id ->1,
	id**d ->1
       };

rels=Join[rels,invrel] /. Rule -> Subtract;
