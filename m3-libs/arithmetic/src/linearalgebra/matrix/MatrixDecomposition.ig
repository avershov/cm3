GENERIC INTERFACE MatrixDecomposition(R, V, M);
(* Arithmetic for Modula-3, see doc for details

   Abstract: Simultaneous Linear Equations. *)
FROM Arithmetic IMPORT Error;

TYPE IndexArray = ARRAY OF CARDINAL;

(* Triangular Matrices *)

(* A triangular matrix A is of the form:
| a11 a12 a13 a14
| 0   a22 a23 a24
| 0   0   a33 a34
| 0   0   0   a44

   A x = b can be solved for x by back substitution *)
PROCEDURE BackSubst (A: M.T; x, b: V.T) RAISES {Error};



(* Tridiagonal Matrices *)

(* A tridiagonal matrix A has diagonals a,b,c:
|  b1 c1  0    ...
|  a2 b2 c2    ...
|   0 a3 b3 c3 ...
|              ...
|                 aN-1 bN-1 cN-1
|                      aN   bN
   *)

PROCEDURE HouseHolderD (A: M.T) RAISES {Error}; (*nxn*)
(*Convert A to tridiagonal form (destroying original A)*)

TYPE Tridiagonals = RECORD a, b, c: V.T;  END;

PROCEDURE SplitTridiagonal (A: M.T;  (* matrix that contains only three
                                        central diagonals, not checked *)
  ): Tridiagonals RAISES {Error};


PROCEDURE SolveTridiagonal (t: Tridiagonals; r: V.T; VAR u: V.T)
  RAISES {Error};
(*Solve for u in A*u=r, where A is given as a,b,c*)



(* nxn Matrices *)

(*A general nxn real matrix A is of the form
| a11 a12 a13
| a21 a22 a23
| a31 a32 a33XS

   A x = b can be solved for x by Gaussian Elimination and
   backsubstitution *)
(*
PROCEDURE GaussElim(A:  M.T;
                    x,b:V.T;
                    pivot:BOOLEAN:=TRUE
                    ) RAISES {Error};
(*Generally, we need to pivot to assure division by the largest
coeff.  However, sometimes we already know the matrix is in
the correct form and can avoid pivoting.  In that case, set
pivot:=FALSE
*)
*)


(* LU Factoring *)

TYPE
  LUFactors = RECORD
                L, U : M.T;
                index: REF IndexArray;
                d    : [-1 .. 1];
              END;

PROCEDURE LUFactor (A: M.T; ): LUFactors RAISES {Error};

PROCEDURE LUBackSubst (LU: LUFactors; b: V.T; ): V.T RAISES {Error};


PROCEDURE LUFactorD (A: M.T;     (* in: matrix to factorize, out: merged
                                    lower and upper triangular factor
                                    matrixes *)
                     VAR index: IndexArray;  (* line permutations *)
                     VAR d: [-1 .. 1];  (* parity of permutations, needed
                                           for determinant computation *))
  RAISES {Error};
(* Factor A into Lower/Upper portions Destroys A's values. *)

PROCEDURE LUBackSubstD (A: M.T; B: V.T; READONLY index: IndexArray)
  RAISES {Error};
(*After LUfactor on A, solves A dot X = B.  X is returned in B.  B's values
   are destroyed.  A is real nxn B is real nx1 index is integer nx1 *)

PROCEDURE LUInverseD (A: M.T; READONLY index: IndexArray): M.T
  RAISES {Error};
(*
Inverse of A goes to B
Must have done LUFactor on A first
Destroys A's values.
A is real nxn
B is real nxn
index is integer nx1
*)

PROCEDURE LUDet (A: M.T; d: [-1 .. 1]): R.T RAISES {Error};
(*after LUFactor on A and no backsubs, returns determinant "d" is the
   parity marker from LUDecomp *)



(* QR Factoring *)

(* Singular Value Decomposition*)

(*In the problem A*x=b, we can decompose to A = U*W*V^T.  Then
   x=V*diag(W)*U^T*b.  There are also others things which can be solved
   once we have U,V,W. *)

(*
PROCEDURE SVDGolub(
           A:M.T;         (*mxn matrix*)
           b:V.T;         (*nx1 col matrix*)
           rhs:CARDINAL;       (*number of right hand sides*)
           matU:BOOLEAN;       (*make U in the decomposition*)
           matV:BOOLEAN;       (*make V in the decomposition*)
           VAR U,V,W:M.T  (*decomposition products*)
           ) RAISES {Error};
(*Do SVD via Golub and Reinsch *)

PROCEDURE SVDChan(
           A:M.T;         (*mxn matrix*)
           b:V.T;         (*nx1 col matrix*)
           rhs:CARDINAL;       (*number of right hand sides*)
           matU:BOOLEAN;       (*make U in the decomposition*)
           matV:BOOLEAN;       (*make V in the decomposition*)
           VAR U,V,W:M.T  (*decomposition products*)
           ) RAISES {Error};
(*Do SVD via T. Chan's ACM algorithm 581*)

PROCEDURE SVDSolve(U,V,W:M.T; (*decomposition*)
                    b:V.T;     (*rightside*)
                    VAR x:V.T    (*result*)
                   ) RAISES {Error};
*)

END MatrixDecomposition.
