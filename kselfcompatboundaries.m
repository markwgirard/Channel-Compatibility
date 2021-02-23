%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% This code plots the boundaries of the k-self-compatibility regions for 
% channels in the convex hull of Id, Omega, and Delta. The boundaires were
% determined numerically, but were found to match the curves analytically
% determined by equation (183) in [1]. 
%
% The figure constructed is Figure 1 in [1].
%
% Requires: kselfcompatboundary.m
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
hold off
p = linspace(0, 1, 101);

for k = 2:10
    y{k} = zeros(1,101);
    for i = 1:101
        y{k}(i) = kselfcompatboundary(k,p(i));
    end
end

ps = [p, fliplr(p)];
fill_1 = [y{2}, fliplr(2/3*(1-p))];
fill_2 = [2/3*(1-p), fliplr(1-p)];
fill_self = fill(ps, fill_1 , [0,0,0]+.95,'DisplayName','Self-compatible region');
hold on
fill_sep = fill(ps, fill_2 , [0,0,0]+.75,'DisplayName','Separable region');
%plot(p,2/3*(1-p))
plot(p,1-p,'color',[0,0,0])

plot(p,y{2},'k')

lbl_ksep = 'Boundaries of k-self-compatibility regions for k\in\{3,...,10\}';
for k = 3:10
   plot_ksep = plot(p,y{k},'Color',[0.4940, 0.1840, 0.5560],'LineStyle','-','DisplayName',lbl_ksep);
end
ylabel('q','Rotation',0)
xlabel('p')

[p,q] = meshgrid(linspace(0,1),linspace(0,.5));
Z = p.^2 + 2*p.*q + 3/2*q.^2 - 2*p - 3*q +1;
[~,p1] = contour(p,q,Z,[0,0], 'r-', 'DisplayName','Boundary of (standard) Jordan-self-compatibility region'); 

ax = gca;
%ax.TickLabelInterpreter = 'latex';

legend([fill_sep,fill_self,plot_ksep,p1])

pbaspect([1 1 1])

set(gcf, 'Position',  [0, 0, 500, 500])

print(gcf, 'Fig1.pdf', '-dpdf', '-fillpage')
