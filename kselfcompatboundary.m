%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% kselfcompatboundary(k,x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Compute (analyitically) the lower bound of the k-self-compatibility
% region  for channels in the convex hull of Id, Omega, and Delta. 
% See details in [1].
%
% Used in kselfcompatboundaries.m
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Written by: Mark Girard (mark.girard@uwaterloo.ca)
% Last updated: 2021 February 23
%
% References: 
% [1] "Jordan products of quantum channels and their compatibility"
%    Mark Girard, Jamie Sikora, Martin Plavala
%    https://arxiv.org/abs/2009.03279
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function q = kselfcompatboundary(k,x)
x0 = (k-2)*(k-1)/(k*(k+1));
if x <= x0
    q = 2/3*((k-1)/k - x);
elseif x0 < x <= 1
    q = (k-1)/(k^2-k+1) * (k - (k-1)*x - sqrt(k*(1-x^2)-1+2*x));
else
    q = 0;
end

end