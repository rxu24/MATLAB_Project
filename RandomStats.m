% Random Stats Plots
% by Ruidi Xu

clear all;
%% T-distribution plot
% x = [-30:0.1:30];
% y = tpdf(x,2);
% 
% plot(x,y);
% title("T distribution with d.f. of 2");
% xlabel('Observation'), ylabel('Probability');
% 
% cutoff = tinv(0.025,2);
% cutoff2 = tinv(0.975,2);
% xline(cutoff,'-', {'Two-tailed rejection cutoff',' t = -4.30'});
% xline(cutoff2,'-', {'Two-tailed rejection cutoff',' t = +4.30'});
% 
% xline(25.98,'-', {'Test statistic', ' t = 25.98'});

%% Boxplot
control = [0.75; 0.80; 0.70];
exp = [0; 0; 0];
x = [control;exp];

g1 = repmat({'Control'},3,1);
g2 = repmat({'Experimental'},3,1);
g = [g1; g2];

figure(1)
boxplot(control,g1);

figure(2)
boxplot(exp,g2);

figure(3);
boxplot([control;exp],[g1;g2]);
title('Saliva Spillage(mL) for Control and Experimental Groups')
ylabel('Saliva Spillage(mL)');
