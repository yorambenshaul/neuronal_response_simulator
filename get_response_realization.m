function [a_SPKS, b_SPKS, TV] = get_response_realization(population,BS,TD,NT)
% return a realization of responses of one population 
% population is a structure with fields specifying the population
% BS is the bin size - i.e. the temporal resolution
% TD is the total duration of the response (in seconds)
% NT is the number of trials
% 
% Returns: 
% a_SPKS: a cell array with responses for stimulus A for each of the of the units across each
% of the trials
% b_SPKS: same but for stimulus B
% TV a vector of bin times corresponding to the responses in a_SPKS and
% b_SPKS.
% 
% YBS 2017

a_BRs = population.a_BRs;
a_RRs = population.a_RRs;
a_RSrngs = population.a_RSrngs;
a_RDrngs = population.a_RDrngs;
b_BRs = population.b_BRs;
b_RRs = population.b_RRs;
b_RSrngs = population.b_RSrngs;
b_RDrngs = population.b_RDrngs;

% number of units
N = length(a_BRs);

for i = 1:N    
    [a_SPKS{i},~]  = generate_one_response_type(BS,TD,NT,a_BRs(i),a_RRs(i),a_RSrngs(i,:),a_RDrngs(i,:));     
    if a_SPKS{i} == 0
        return
    end
    [b_SPKS{i},TV] = generate_one_response_type(BS,TD,NT,b_BRs(i),b_RRs(i),b_RSrngs(i,:),b_RDrngs(i,:));        
    if b_SPKS{i} == 0
        return
    end
end






