% code for managing the results of a series of optimization for comparisons sake
function out = datapro(fm11,fm12,fm13,fm14,fm21,fm22,fm23,fm24,fc11,fc12,fc13,fc14,fc21,fc22,fc23,fc24,fd11,fd12,fd13,fd14,fd21,fd22,fd23,fd24,fv11,fv12,fv13,fv14,fv21,fv22,fv23,fv24,w)
out=0;

x = [1,2,3,6];

y1=[fv11,fv12,fv13,fv14]; %fvals to array
y2=[fv21,fv22,fv23,fv24];


figure;bar(x,y1);hold on;bar(x,y2) % fval comp for moo and nmoo
fmon1=[fm11,fm12,fm13,fm14]; %fmons to array
fmon2=[fm21,fm22,fm23,fm24];
fdep1=[fd11,fd12,fd13,fd14]; % fdep to arrray
fdep2=[fd21,fd22,fd23,fd24];
fval1=y1;
fval2=y2;

fco1=fmon1-fdep1; % real cost
fco2=fmon2-fdep2;



% figure;bar(x,y1);hold on;bar(x,y2)



fcar1 = [fc11,fc12,fc13,fc14]; % fcar to array
fcar2 = [fc21,fc22,fc23,fc24];

stack1 = [fmon1(1) fcar1(1)*w fdep1(1);fmon1(2) fcar1(2)*w fdep1(2);fmon1(3) fcar1(3)*w fdep1(3);fmon1(4) fcar1(4)*w fdep1(4)]; % concatonate arrays and weigh in carbon
stack2 = [fmon2(1) fdep2(1);fmon2(2) fdep2(2);fmon2(3) fdep2(3);fmon2(4) fdep2(4)];
figure;bar(x,stack1,'stacked');legend('fmon','fcar','fdep')
figure;bar(x,stack2,'stacked');legend('fmon','fdep')
fcarm1=fcar1*w; % weighted carbon emissions
fcarm2=fcar2*0;


% grouped and stacked bar graph 
NumStacksPerGroup = 2;
NumGroupsPerAxis = 4;
NumStackElements = 3;

% labels to use on tick marks for groups
groupLabels = { 1; 2; 3; 'all'};
stackData = rand(NumGroupsPerAxis,NumStacksPerGroup,NumStackElements);
for i=1:length(fval1)
    stackData(i,1,1) = fmon1(i)/100;
    stackData(i,2,1) = fmon2(i)/100;
    stackData(i,1,2) = fdep1(i)/100;
    stackData(i,2,2) = fdep2(i)/100;
    stackData(i,1,3) = fcarm1(i)/100;
    stackData(i,2,3) = fcarm2(i)/100;
end
% stackData(1,1,1) = 2;
% stackData(1,2,1) = 3;
plotBarStackGroups(stackData, groupLabels); % Mathwords file exchange function https://uk.mathworks.com/matlabcentral/fileexchange/32884-plot-groups-of-stacked-bars
set(gca,'FontSize',12)
set(gcf,'Position',[100 100 720 650])

set(gca,'Layer','top') % put grid lines on top of stacks
legend('fmon moo','fdep moo ','fcar moo','fmon 0','fdep 0 ','fcar 0' )
title({'Decomposed Cost Profile for the Investigation of Increasing Cooperation',['For Systems with 0 and ' num2str(w) ' Weight Factors for Emissions in a Six User System']})
xlabel('Size of cooperating units')
ylabel('Cost')
ytickformat('usd') % y axis units to dollar format
out=1;
end
