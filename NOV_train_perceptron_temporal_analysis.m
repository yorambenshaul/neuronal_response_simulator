function [net,PC,TR,INFL] = NOV_train_perceptron_temporal_analysis(xtr,xtst,ttr,ttst,MaxEpochs,trainfunction,net)
% based on train_perceptron_temporal_analysis_shuffle, but designed to use
% distinct training and testing sets

% training is only performed if there is no network
% is given as input
if isempty(net)    
    % create a perceptron network
    net = perceptron;   
    % assign the training function    
    net.trainFcn = trainfunction ; 
    % define the number of epochs
    net.trainParam.epochs = MaxEpochs; 
    
    
    % YBS 16/1/2018
    % uncomment to prevent classifier display during run
    %net.trainParam.showWindow = false;
    
    
    % train the network
    [net TR] = train(net,xtr,ttr);
else    
    TR = [];
end

% test the performance of the network on the test set 
y = net(xtst);
% quantify the performance of the network on the test data
CM(1,1) = sum(~y & ~ttst);
CM(1,2) = sum(~y & ttst);
CM(2,1) = sum(y & ~ttst);
CM(2,2) = sum(y & ttst);
% summarize the correct classifications as a single number (percentage)
PC = 100*(CM(1,1) + CM(2,2)) / (CM(1,1) + CM(2,2) + CM(1,2) + CM(2,1));
% derive the weighs and assign them to the INFL variable
% weights = abs(net.IW{1,1});
% note that we do not take the absolute value here
weights = (net.IW{1,1});
INFL = weights;

return
