function [R,TV] = generate_one_response_type(BS,TD,NT,BR,RR,RSRng,RDRng)
% generate the single trial data, given the following parameters:
% BS: bin size for response realization
% TD: total response duration in seconds
% NT: number of trials to realize
% BR: baseline rate of the neuron
% RR: response rate of the neuron
% RSRng: interval from which response start time will be uniformly drawn 
% RDRng: interval from which response duration   will be uniformly drawn 
% If the lower and upper values of RSRng are identical, then the start time will be a fixed number.
% likewise for the response duration interval.
%
% YBS 2017

% Time vector 
TV = [0:BS:TD];
% total length of the trial in samples 
TL = length(TV);

% baseline response probability within a bin (rate times the bin size)
BP = BR * BS;

if BP >= 1    
    errordlg('Spike probability in each baseline bin must be smaller than 1 - increase temporal resolution or decrease  rates', 'Temporal Simulation');
    return
end
    
   
% response probability
RP = RR * BS; 

if RP >= 1    
    errordlg('Spike probability in each response bin must be smaller than 1 - increase temporal resolution or decrease rates', 'Temporal Simulation');
    return
end


% across all trials
for i = 1:NT      
    % draw response start time value
    RS = unifrnd(RSRng(1),RSRng(2)); 
    % find the corresponding bin
    [~,RSB] = min(abs(TV-RS)); 
    % draw a response duration    
    RD = unifrnd(RDRng(1),RDRng(2)); 
    % length of response duration
    RL = floor(RD/BS + 1); 
    % last bin of response
    REB = RSB + RL - 1;        % response end bin    
    % vector containing baseline probabilities
    P(1:TL)    = BP; 
    
    % now check that response time does not go beyond the time range
    if REB <=TL
        % define firing probability in the response bins
        P(RSB:REB) = RP;
    elseif RSB <= TL && REB >= TL % if the response end spills over - truncate it
        % this scenario also includes a one bin response
        REB = TL;
        % define firing probability in the response bins
        P(RSB:REB) = RP;
    elseif RSB > TL
        % if the response start spills over, do nothing, it is all baseline in this case
    end
                
    % generate spiking response realization, which is simply a binomial process with a given probability 
    R(i,:) = binornd(1,P); 
end


R = logical(R);

return
