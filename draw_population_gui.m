function population = draw_population_gui(s)
% STr: start time range (which will be spanned)
% Dr:  duration range response duration (identical for all) 
% user is respnsible to make sure dur + last element of range are not
% longer than the entire time period


STr  = [s.stim_onset + s.stimA_response_start_min, s.stim_onset + s.stimA_response_start_max];
N_ST = s.n_start_times;
Dr   = [s.stimA_response_duration_min s.stimA_response_duration_max];
N_D  = s.n_durations;
BR   = [s.lower_baseline_range s.upper_baseline_range];       % baseline rate for stim a. e.g BR        = [2 2]; 
a_RR = [s.stimA_response_min s.stimA_response_max]; % response range e.g. a_RR        = [10  10];
b_RR_offset  = [s.stimB_response_min s.stimB_response_max];  % response rate offset b_RR_offset = [-10 10];
b_ST_offset  = [s.stimB_response_start_min s.stimB_response_start_max]; % start time offset for stim b e.g. [0 0];
b_dur_offset = [s.stimB_response_duration_min s.stimB_response_duration_max]; % duration offset for stim b e.g. [0 0 ]
% The range of the start times and the durations - a constant value
% applicavle to both a and b - this value is added to the initial start
% time
ST_range = s.start_jitter;
D_range = s.duration_jitter;

% Determine response start times and durations for stim a
dST = range(STr)/(N_ST-1); % delta start times
tmp_ST = [STr(1):dST:STr(end)];
% This should cover the case of a zero range
if ~range(STr)
    tmp_ST = STr(1) * ones(1,N_ST);
end    
% and this for an imperfect coverage, or a single value for
if length(tmp_ST)< N_ST
    tmp_ST = [tmp_ST STr(end)];
end
% Durations
dR  = range(Dr)/(N_D-1); % delta durations
tmp_durs   = [Dr(1):dR:Dr(end)];
% This should cover the case of a zero range
if ~range(Dr)
    tmp_durs = Dr(1) * ones(1,N_D);
end    
% And this an imperfect coverage
if length(tmp_durs)< N_D
    tmp_durs = [tmp_durs Dr(end)];
end

k = 1;
for STi = 1:N_ST
    for Di = 1:N_D
        a_ST(k) = tmp_ST(STi);
        a_durs(k)        = tmp_durs(Di);
        k = k + 1;
    end
end

% Draw characteristics for each of the neurons
for i = 1:(N_ST*N_D)
    % draw baseline rate for the neuron for sitmulus A
    a_BRs(i) = unifrnd(BR(1),BR(2));
    % the baseline rate for stimulus B are the same as for A
    b_BRs(i) = a_BRs(i); 
    % draw response rate for stimulus A
    a_RRs(i) = unifrnd(a_RR(1),a_RR(2));
    % the response to stimulus B is that for A + a random value defined by
    % the RR_offset range
    b_RRs(i) = a_RRs(i) + unifrnd(b_RR_offset(1),b_RR_offset(2));
    
    % response start time range for stim A
    a_RSrngs(i,1) = a_ST(i); 
    a_RSrngs(i,2) = a_ST(i) + ST_range; 
    % response start range for stim b - which would be the first 
    b_RSrngs(i,1) = a_RSrngs(i,1) + unifrnd(b_ST_offset(1),b_ST_offset(2));
    b_RSrngs(i,2) = b_RSrngs(i,1) + ST_range;
     
    % response duration for stim a
    a_RDrngs(i,1) = a_durs(i);
    a_RDrngs(i,2) = a_durs(i) + D_range;
    % response duration for stim b 
    b_RDrngs(i,1) =  a_RDrngs(i,1) + unifrnd(b_dur_offset(1),b_dur_offset(2));
    b_RDrngs(i,2) =  b_RDrngs(i,1) + D_range;
    
end

population.a_BRs = a_BRs;
population.a_RRs = a_RRs;
population.a_RSrngs = a_RSrngs;
population.a_RDrngs = a_RDrngs;
population.b_BRs = b_BRs;
population.b_RRs = b_RRs;
population.b_RSrngs = b_RSrngs;
population.b_RDrngs = b_RDrngs;


return