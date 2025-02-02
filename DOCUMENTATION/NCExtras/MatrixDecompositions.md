## MatrixDecompositions: linear algebra templates {#PackageMatrixDecompositions}

`MatrixDecompositions` is a package that implements various linear
algebra algorithms, such as *LU Decomposition* with *partial* and
*complete pivoting*, and *LDL Decomposition*. The algorithms have been
written with correctness and ease of customization rather than
efficiency as the main goals. They were originally developed to serve
as the core of the noncommutative linear algebra algorithms for
[NCAlgebra](http://math.ucsd.edu/~ncalg). 

See the package
[NCMatrixDecompositions](#PackageNCMatrixDecompositions) for
noncommutative versions of these algorithms.

Members are:

* Decompositions
    * [LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting)
    * [LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting)
    * [LDLDecomposition](#LDLDecomposition)
    * [LURowReduce](#LURowReduce)
    * [LURowReduceIncremental](#LURowReduceIncremental)
* Solvers
    * [LowerTriangularSolve](#LowerTriangularSolve)
    * [UpperTriangularSolve](#UpperTriangularSolve)
    * [LUInverse](#LUInverse)
* Utilities
    * [GetLUMatrices](#GetLUMatrices)
    * [GetFullLUMatrices](#GetFullLUMatrices)
    * [GetLDUMatrices](#GetLDUMatrices)
    * [GetFullLDUMatrices](#GetFullLDUMatrices)
    * [GetDiagonal](#GetDiagonal)
    * [LUPartialPivoting](#LUPartialPivoting)
    * [LUCompletePivoting](#LUCompletePivoting)

### LUDecompositionWithPartialPivoting {#LUDecompositionWithPartialPivoting}

`LUDecompositionWithPartialPivoting[m]` generates a representation of the LU decomposition of the rectangular matrix `m`.

`LUDecompositionWithPartialPivoting[m, options]` uses `options`.

`LUDecompositionWithPartialPivoting` returns a list of two elements:

- the first element is a combination of upper- and lower-triangular matrices;
- the second element is a vector specifying rows used for pivoting.

`LUDecompositionWithPartialPivoting` is similar in functionality with the built-in `LUDecomposition`. It implements a *partial pivoting* strategy in which the sorting can be configured using the options listed below. It also applies to general rectangular matrices as well as square matrices.

The triangular factors are recovered using [GetLUMatrices](#GetLUMatrices) or [GetFullLUMatrices](#GetFullLUMatrices).

The following `options` can be given:

- `ZeroTest` (`PossibleZeroQ`): function used to decide if a pivot is zero;
- `RightDivide` (`Divide`): function used to divide a vector by an entry;
- `Dot` (`Dot`): function used to multiply vectors and matrices;
- `Pivoting` ([LUPartialPivoting](#LUPartialPivoting)): function used to sort rows for pivoting;
- `SuppressPivoting` (`False`): whether to perform pivoting or not.

See also:
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting), [LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting), [GetLUMatrices](#GetLUMatrices), [GetFullLUMatrices](#GetFullLUMatrices), [LUPartialPivoting](#LUPartialPivoting).

### LUDecompositionWithCompletePivoting {#LUDecompositionWithCompletePivoting}

`LUDecompositionWithCompletePivoting[m]` generates a representation of the LU decomposition of the rectangular matrix `m`.

`LUDecompositionWithCompletePivoting[m, options]` uses `options`.

`LUDecompositionWithCompletePivoting` returns a list of four elements:

- the first element is a combination of upper- and lower-triangular matrices;
- the second element is a vector specifying rows used for pivoting;
- the third element is a vector specifying columns used for pivoting;
- the fourth element is the rank of the matrix.

`LUDecompositionWithCompletePivoting` implements a *complete pivoting* strategy in which the sorting can be configured using the options listed below. It also applies to general rectangular matrices as well as square matrices.

The triangular factors are recovered using [GetLUMatrices](#GetLUMatrices) or [GetFullLUMatrices](#GetFullLUMatrices).

The following `options` can be given:

- `ZeroTest` (`PossibleZeroQ`): function used to decide if a pivot is zero;
- `Divide` (`Divide`): function used to divide a vector by an entry;
- `Dot` (`Dot`): function used to multiply vectors and matrices;
- `Pivoting` ([LUCompletePivoting](#LUCompletePivoting)): function used to sort rows for pivoting;

See also:
LUDecomposition, [GetLUMatrices](#GetLUMatrices), [GetFullLUMatrices](#GetFullLUMatrices), [LUCompletePivoting](#LUCompletePivoting), [LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting).

### LDLDecomposition {#LDLDecomposition}

`LDLDecomposition[m]` generates a representation of the LDL decomposition of the symmetric or self-adjoint matrix `m`.

`LDLDecomposition[m, options]` uses `options`.

`LDLDecomposition` returns a list of four elements:

- the first element is a combination of upper- and lower-triangular matrices;
- the second element is a vector specifying rows and columns used for pivoting;
- the third element is a vector specifying the size of the diagonal blocks (entries can be either 1 or 2);
- the fourth element is the rank of the matrix.

`LUDecompositionWithCompletePivoting` implements a *Bunch-Parlett pivoting* strategy in which the sorting can be configured using the options listed below. It applies only to square symmetric or self-adjoint matrices.

The triangular factors are recovered using [GetLDUMatrices](#GetLDUMatrices) or [GetFullLDUMatrices](#GetFullLDUMatrices).

The following `options` can be given:

- `ZeroTest` (`PossibleZeroQ`): function used to decide if a pivot is zero;
- `RightDivide` (`Divide`): function used to divide a vector by an entry on the right;
- `LeftDivide` (`Divide`): function used to divide a vector by an entry on the left;
- `Dot` (`Dot`): function used to multiply vectors and matrices;
- `CompletePivoting` ([LUCompletePivoting](#LUCompletePivoting)): function used to sort rows for complete pivoting;
- `PartialPivoting` ([LUPartialPivoting](#LUPartialPivoting)): function used to sort matrices for complete pivoting;
- `Inverse` (`Inverse`): function used to invert 2x2 diagonal blocks;
- `SelfAdjointMatrixQ` (HermitianQ): function to test if matrix is self-adjoint;
- `SuppressPivoting` (`False`): whether to perform pivoting or not.

See also:
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting), [LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting), [GetLUMatrices](#GetLUMatrices), [GetFullLDUMatrices](#GetFullLDUMatrices), [LUCompletePivoting](#LUCompletePivoting), [LUPartialPivoting](#LUPartialPivoting).

### UpperTriangularSolve {#UpperTriangularSolve}

`UpperTriangularSolve[u, b]` solves the upper-triangular system of
equations $u x = b$ using back-substitution.

For example:

    x = UpperTriangularSolve[u, b];

returns the solution `x`.

See also:
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting), [LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting), [LDLDecomposition](#LDLDecomposition).

### LowerTriangularSolve {#LowerTriangularSolve}

`LowerTriangularSolve[l, b]` solves the lower-triangular system of
equations $l x = b$ using forward-substitution.

For example:

    x = LowerTriangularSolve[l, b];

returns the solution `x`.

See also:
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting), [LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting), [LDLDecomposition](#LDLDecomposition).

### LUInverse {#LUInverse}

`LUInverse[a]` calculates the inverse of matrix `a`.

`LUInverse` uses the [LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting) and the triangular solvers [LowerTriangularSolve](#LowerTriangularSolve) and [UpperTriangularSolve](#UpperTriangularSolve).

See also:
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting).

### GetLUMatrices {#GetLUMatrices}

`GetLUMatrices[lu]` extracts lower- and upper-triangular blocks produced by `LDUDecompositionWithPartialPivoting` and `LDUDecompositionWithCompletePivoting`.

`GetLUMatrices[lu, p, q, rank]` extracts compact lower- and upper-triangular blocks produced by `LDUDecompositionWithPartialPivoting` and `LDUDecompositionWithCompletePivoting` taking into account permutations and the matrix rank.

For example:

    {lu, p} = LUDecompositionWithPartialPivoting[mat];
    {l, u} = GetLUMatrices[lu];

and

    {lu, p, q, rank} = LUDecompositionWithCompletePivoting[mat];
    {l, u} = GetLUMatrices[lu, p, q, rank];

returns the lower-triangular factor `l` and upper-triangular factor `u` as `SparseArray`s.

See also:
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting), [LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting), [GetFullLUMatrices](#GetFullLUMatrices).
	
### GetFullLUMatrices {#GetFullLUMatrices}

`GetFullLUMatrices[m]` extracts lower- and upper-triangular blocks produced by `LDUDecompositionWithPartialPivoting` and `LDUDecompositionWithCompletePivoting`.

`GetFullLUMatrices[lu, p, q, rank]` extracts compact lower- and upper-triangular blocks produced by `LDUDecompositionWithPartialPivoting` and `LDUDecompositionWithCompletePivoting` taking into account permutations and the matrix rank.

`GetFullLUMatrices` is equivalent to `Normal @@ GetLUMatrices`

See also:
[GetLUMatrices](#GetLUMatrices),
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting), [LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting).

### GetLDUMatrices {#GetLDUMatrices}

`GetLDUMatrices[ldu, s]` extracts lower-, upper-triangular and diagonal blocks produced by `LDLDecomposition`.

`GetLDUMatrices[ldu, p, s, rank]` extracts compact lower- and upper-triangular blocks produced by `LDLDecomposition` taking into account permutations and the matrix rank.

For example:

    {ldl, p, s, rank} = LDLDecomposition[mat];
    {l,d,u} = GetLDUMatrices[ldl,s];

and

    {l, d, u} = GetLDUMatrices[ldl, p, s, rank];

returns the lower-triangular factor `l`, the upper-triangular factor `u`, and the block-diagonal factor `d` as `SparseArray`s.

See also:
[LDLDecomposition](#LDLDecomposition), [GetFullLDUMatrices](#GetFullLDUMatrices).

### GetFullLDUMatrices {#GetFullLDUMatrices}

`GetLDUMatrices[ldl, s]` extracts lower-, upper-triangular and diagonal blocks produced by `LDLDecomposition`.

`GetLDUMatrices[ldu, p, s, rank]` extracts compact lower- and upper-triangular blocks produced by `LDLDecomposition` taking into account permutations and the matrix rank.

`GetFullLDUMatrices` is equivalent to `Normal @@ GetLDUMatrices`

See also:
[LDLDecomposition](#LDLDecomposition), [GetLDUMatrices](#GetLDUMatrices).

### GetDiagonal {#GetDiagonal}

`GetDiagonal[m]` extracts the diagonal entries of matrix `m`.

`GetDiagonal[m, s]` extracts the block-diagonal entries of matrix `m` with block size `s`.

For example:

    d = GetDiagonal[{{1,-1,0},{-1,2,0},{0,0,3}}];

returns

    d = {1,2,3}

and
	
    d = GetDiagonal[{{1,-1,0},{-1,2,0},{0,0,3}}, {2,1}];

returns

    d = {{{1,-1},{-1,2}},3}

See also:
[LDLDecomposition](#LDLDecomposition).

### LUPartialPivoting {#LUPartialPivoting}

`LUPartialPivoting[v]` returns the index of the element with largest absolute value in the vector `v`. If `v` is a matrix, it returns the index of the element with largest absolute value in the first column.

`LUPartialPivoting[v, f]` sorts with respect to the function `f` instead of the absolute value.

See also:
[LUDecompositionWithPartialPivoting](#LUDecompositionWithPartialPivoting), [LUCompletePivoting](#LUCompletePivoting).

### LUCompletePivoting {#LUCompletePivoting}

`LUCompletePivoting[m]` returns the row and column index of the element with largest absolute value in the matrix `m`.

`LUCompletePivoting[v, f]` sorts with respect to the function `f` instead of the absolute value.

See also:
[LUDecompositionWithCompletePivoting](#LUDecompositionWithCompletePivoting), [LUPartialPivoting](#LUPartialPivoting).

### LURowReduce {#LURowReduce}

### LURowReduceIncremental {#LURowReduceIncremental}
