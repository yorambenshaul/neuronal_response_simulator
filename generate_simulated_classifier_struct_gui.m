function generate_simulated_classifier_struct_gui(BaseT,TotT,a_SPKS,b_SPKS,TV,Tres,datadir,scenario)
% will generate a structure that mimics the one made by Michal for the
% temporal data.


% How many sample trials to take from each file
% num_trials = 1000;


% % 
% % 
% % 
% % datadir = [basedir filesep scenario filesep];
% % fname = [basedir filesep scenario filesep scenario '.mat'];
% % load(fname)

% This is the minimal time by which a response can take place
% It is a constant defined in return_sim_scenario.m
%% BaseT = 5; 
% This is the duration of the response (the total duration minus the baseline period)
MaxTime        = TotT - BaseT;
% temporal resolution
%% Tres = 0.5; % in seconds

Nneurons = length(a_SPKS);
NTs      = size(a_SPKS{1},1); % Number of trials should be identical for both stimuli and all neurons 
TimeVec = TV;



%% generate spike times
for neuron_ind = 1:Nneurons
    for trial_ind = 1:NTs        
        % find indices of spikes (the next two steps can be merged, but it is easier to follow when they are separate)
        A_these_spike_inds  = find(a_SPKS{neuron_ind}(trial_ind,:));
        % find times of spikes and subtract the response start time
        A_these_spike_times = TimeVec(A_these_spike_inds) - BaseT;        
        % and leave only those that follow the baseline period                
        A_poststim_spike_times{neuron_ind}{trial_ind} = A_these_spike_times(A_these_spike_times>0);
        
        
        
        B_these_spike_inds  = find(b_SPKS{neuron_ind}(trial_ind,:));
        % find times of spikes and subtract the response start time
        B_these_spike_times = TimeVec(B_these_spike_inds) - BaseT;
        % and leave only those that follow the baseline period
        B_poststim_spike_times{neuron_ind}{trial_ind} = B_these_spike_times(B_these_spike_times>0);
        
        
    end
end



%%
scenario = scenario;
% define the set of start time and durations which will be considered
% Tres is temporal resolution, defined above
START_TIMES =  [0:Tres:MaxTime-Tres];
DURATIONS   =  [Tres 1:MaxTime];

k = 1;
for i = 1:length(DURATIONS)
    for j = 1:length(START_TIMES)
        if sum([DURATIONS(i), START_TIMES(j)]) <= MaxTime
            windows(k,:) = [DURATIONS(i), START_TIMES(j)];
            k = k + 1;
        end
    end
end
stim_names    = {'stimA','stimB'};

% for stim A
for window_ind= 1:length(windows)
    this_min = windows(window_ind,2);
    this_max = windows(window_ind,2) + windows(window_ind,1);
    for neuron_ind = 1:Nneurons
        stim_A_trial_counts = [];
        stim_B_trial_counts = [];
        for trial_ind = 1:NTs            
            stim_A_all_trial_spikes = A_poststim_spike_times{neuron_ind}{trial_ind};
            stim_A_rel_spikes       = stim_A_all_trial_spikes >= this_min & stim_A_all_trial_spikes <= this_max;
            stim_A_trial_counts(trial_ind) = sum(stim_A_rel_spikes);
            
            stim_B_all_trial_spikes = B_poststim_spike_times{neuron_ind}{trial_ind};
            stim_B_rel_spikes       = stim_B_all_trial_spikes >= this_min & stim_B_all_trial_spikes <= this_max;
            stim_B_trial_counts(trial_ind) = sum(stim_B_rel_spikes);            
        end
        data{1}{neuron_ind}{window_ind} = stim_A_trial_counts;
        data{2}{neuron_ind}{window_ind} = stim_B_trial_counts;
    end
end

% Some of this may seem silly, but is there to maintain compatability
% between older and newer code (for simulations)
num_stims    = length(stim_names);
num_units    = Nneurons;
num_windows  = length(windows);


%%%
% over stimuli
for stim_ind = 1:num_stims
    % over windows
    for window_ind = 1:num_windows
        % over units
        start_time = windows(window_ind,2);
        duration   = windows(window_ind,1);
        
        if ismember(start_time,START_TIMES) && ismember(duration,DURATIONS)
            % Give a name for the file   
            % Note that start and duration values are multipled by 10,
            % because otherwise we would have 0.5 which is not part of a
            % valid file name
            % NO stands for no overlap
            file_name = [stim_names{stim_ind} '_START' num2str(10*start_time)  '_DUR' num2str(10*duration) '_'];
            num_trials = length(data{stim_ind}{1}{window_ind});
            resp_mat  = zeros(num_units,num_trials);
            for neuron_ind = 1:num_units
                % Get the trials here
                trial_vals   = data{stim_ind}{neuron_ind}{window_ind};
                % get a sample of these trials
                % n_these_trials = length(trial_vals);
                % rand_inds     = unidrnd(n_these_trials*(ones(1,num_trials)));
                % resp_mat(neuron_ind,:)     = trial_vals(rand_inds);
                resp_mat(neuron_ind,:)     = trial_vals;
            end
            save([datadir file_name] ,'resp_mat');
            clear resp_mat
            disp(['saved data in file: ' file_name]);
        end
    end
end
                    


