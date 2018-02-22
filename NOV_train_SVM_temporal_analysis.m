function [SVMstruct,PC] = NOV_train_SVM_temporal_analysis(xtr,xtst,ttr,ttst,KernelFunc)


SVMstruct = svmtrain(xtr',ttr,'kernel_function',KernelFunc);   
y = svmclassify(SVMstruct,xtst');

CM(1,1) = sum(~y & ~ttst');
CM(1,2) = sum(~y & ttst');
CM(2,1) = sum(y & ~ttst');
CM(2,2) = sum(y & ttst');
PC = 100*(CM(1,1) + CM(2,2)) / (CM(1,1) + CM(2,2) + CM(1,2) + CM(2,1));

return
