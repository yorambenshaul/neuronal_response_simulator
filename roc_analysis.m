function [auroc] = roc_analysis(x,y,toplot)
% x and y are assumed to be row vectors
% Michal Yoles Frenkel  and Yoram BS December 2016
auroc = [];

samples = [x y];
% classes = [zeros(1,length(x)) ones(1,length(y))];

% now we increase the treshold and derrive the FPR and FNR at each
% Threshod
mindiff = min(diff(sort(samples)));
threshvalues = [-inf sort(samples)+mindiff inf];

% allocate memroy
TPR = zeros(1,length(threshvalues));
FPR = TPR;

for i = 1:length(threshvalues)
    t = threshvalues(i);
    TPR(i) = sum(y >= t);
    FPR(i) = sum(x >= t);
end
ly = length(y);
lx = length(x);
TPR = TPR./ly;
FPR = FPR./lx;

area = abs(diff(FPR))*TPR(1:end-1)';
auroc = abs(area - 0.5);

if toplot 
    figure
    plot(FPR,TPR,'k');
    hold on
    plot(FPR,TPR,'b+');
    xlabel('false positive rate')
    ylabel('true positive rate')
    set(gca,'xlim',[0 1],'ylim',[0 1])
    hold on
    lh = line('linestyle',':','color','r');
    axis equal
    title(['ROC. area under curve: ' num2str(auroc)])
end
    




