## NCTr {#PackageNCTr}

Members are:

* [tr](#tr)
* [SortCyclicPermutation](#SortCyclicPermutation)
* [SortedCyclicPermutationQ](#SortedCyclicPermutationQ)

### tr {#tr}

`tr[expr]` is an linear operator with the following properties:

* `tr` automatically distributes over sums;
* when `expr` is a noncommutative product, then product is sorted;
  for example `tr[b ** a]` evaluates into `tr[a ** b]`

See also:
[SortCyclicPermutation](#SortCyclicPermutation),
[SortedCyclicPermutationQ](#SortedCyclicPermutationQ).

### SortCyclicPermutation {#SortCyclicPermutation}

`SortedCyclicPermutation[list]` returns a cyclic permutation of list sorted in
ascending order.

See also:
[SortedCyclicPermutationQ](#SortedCyclicPermutationQ).

### SortedCyclicPermutationQ {#SortedCyclicPermutationQ}

`SortCyclicPermutationQ[list]` returns `True` if `list` is a sorted cyclic permutation.

See also:
[SortCyclicPermutation](#SortCyclicPermutation).