%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% This code plots the boundaries of the compatibility region and
% Jordan-compatibility region of pairs of depolarizing channels.
%
% The output figure is Figure 2 in [1].
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
figure

q = linspace(0, 1, 101);
qs = [q, fliplr(q)];
q1 = 1/2*(2-q-sqrt(4*q-3*q.^2));
q1s = [q1, 0*q+1];
fill(qs, q1s , [0,0,0]+.95,'DisplayName','Compatible region');

hold on

plot([0,1/3,1],[1,1/3,0],'b--', 'DisplayName','Boundary of convex hull of (0,1), (1/3,1/3), (1,0), (1,1)')

[q0,q1] = meshgrid(linspace(0,1),linspace(0,1));
Z_jord = 3*q0.*q1.*(4-q0).*(4-q1)+12*(1-q0-q1).^2-40*q0.*q1 ;
Z_comp = (1-q0).^2 + (1-q1).^2 + q0.*q1-1;
[~,p_jord] = contour(q0,q1,Z_jord,[0,0], 'r-', 'DisplayName','Boundary of (standard) Jordan-compatibility region'); 
[~,p_comp] = contour(q0,q1,Z_comp,[0,0], 'k-', 'DisplayName','Boundary of compatibility region'); 

pbaspect([1 1 1])

set(gcf, 'Position',  [0, 0, 500, 500])
ylabel('q_1','Rotation',0)
xlabel('q_0')

legend
print(gcf, 'Fig2.pdf', '-dpdf', '-fillpage')