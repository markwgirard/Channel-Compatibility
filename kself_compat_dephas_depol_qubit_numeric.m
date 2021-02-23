%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% This code numerically constructs the boundaries of regions of channels
% in the convex hull of Id, Omega, and Delta (where Id is identity channel,
% Omega is completely depolarizing channel, and Delta is completely 
% dephasing channel) that are k-symmetric-extendible for different values 
% of k.
%
% Requires: cvx (http://cvxr.com), qetlab (http://www.qetlab.com/).
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Detailed description:
% Consider channels of the form
%      Phi = (1-p-q)*Id + p*Delta + q*Omega
% for p,q in [0,1] with p+q <= 1. Here
%   - Id is identity channel
%   - Delta is completely dephasing channel
%   - Omega is completely depolarizing channel
%
% For different values of k, which of these channels are k-symmetric 
% extendible? We numerically determine the boundaries of these % regions as
% follows: 
%   - Fix a value of k.
%   - For fixed values of p in [0,1], use SDPs to find minimum value of q
%     such that (1-p-q)*Id + p*Delta + q*Omega is k-self-compatible.
%   - Plot the curve of corresponsing (p,q) pairs.
%   - Do this for each value of k in range from kmin to kmax.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by: Mark Girard (mark.girard@uwaterloo.ca)
% Last updated: 2021 February 23
%
% References: 
%    "Jordan products of quantum channels and their compatibility"
%    Mark Girard, Jamie Sikora, Martin Plavala
%    https://arxiv.org/abs/2009.03279
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Set dimension of systems in bipartite system. (d=2 for two qubits)
d=2;

% Set kmin and kmax for determining k-symm-extendible
kmin = 2;
kmax = 10;

% Construct Choi matrix of Delta (measuring in computation basis)
Delta = zeros(d^2,d^2);
for i=1:d
    Z = zeros(d,d);
    Z(i,i)=1;
    Delta = Delta + Tensor(Z,Z);
end

% Construct Choi matrix of Omega (completely dephasing channel)
Omega = eye(d^2)/d;

% Choi matrix of identity channel
psi = MaxEntangled(d);
Id = d*psi*psi';

% Sparsify for easier numerics
Id = sparse(Id);
Omega = sparse(Omega);
Delta = sparse(Delta);

hold off
%%%%%%%%%%%%%%%%%%%

num_steps = 101;

for k=kmin:kmax;
    %Different solvers may perform better for higher values of k
    %if k>=8
    %    cvx_solver sedumi
    %else
    %    cvx_solver SDPT3
    %end
    plist{k} = linspace(0,1,num_steps);
    qlist{k} = zeros(num_steps,1);
    for i = 1:num_steps
        p = plist{k}(i);
        cvx_begin sdp quiet
        variable q
        expression Phi
        Phi = (1-p-q)*Id + p*Delta + q*Omega;
        minimize q
        subject to
            SymmetricExtension(Phi, k, [d, d], 0, 1) == 1;
            q   >= 0;
            p+q <= 1;
        cvx_end
        qlist{k}(i) = q;
        disp([k, p, q])
    end
    plot(plist{k},qlist{k})
    hold on
end