# Channel-Compatibility
Matlab code for constructing the figures in [1].

Requires: cvx (http://cvxr.com), qetlab (http://www.qetlab.com/).

### Contents
Code:
 - **kselfcompatboundaries.m**: Constructs Figure 1 in [1].
 - **kselfcompatboundary.m**: Function used in kselfcompatboundaries.m.
 - **kself_compat_dephas_depol_qubit_numeric.m**: Generates numerical data that is used in kselfcompatboundaries.m
 - **depolarizing_compat.m**: Constructs Figure 2 in [1].

Figures:
 - **Xipq_ksymmext.pdf**: output of kself_compat_dephas_depol_qubit_numeric.m
 - **fig_xipq.pdf**: output of kselfcompatboundaries.m
 - **fig_omegas.pdf**: output of depolarizing_compat.m

## References

[1] Girard, M., Plávala, M. & Sikora, J. Jordan products of quantum channels and their compatibility. *Nature Communications* 12, 2129 (2021). \[links: [published version](https://doi.org/10.1038/s41467-021-22275-0), [arxiv version](https://arxiv.org/abs/2009.03279)\]




