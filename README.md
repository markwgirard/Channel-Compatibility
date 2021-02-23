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

[1] Mark Girard, Jamie Sikora, Martin Plavala. "Jordan products of quantum channels and their compatibility."  https://arxiv.org/abs/2009.03279 (2020).




