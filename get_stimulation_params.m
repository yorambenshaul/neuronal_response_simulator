function sim_params = get_stimulation_params(handles)
% Get parameters from simulation GUI

% get temporal resolution
temp_res = str2num(handles.simulation_binsize_edit.String);
if isempty(temp_res)
    errordlg('Invalid temporal resolution', 'Temporal Simulation');
    return
end
% get number of trials
n_trials = str2num(handles.number_trials_edit.String);
if isempty(n_trials)
    errordlg('Invalid number of trials', 'Temporal Simulation');
    return
end 
% get trial duration
trial_duration = str2num(handles.trial_duration_edit.String);
if isempty(trial_duration)
    errordlg('Invalid trial duration', 'Temporal Simulation');
    return
end 
% get stimulus onset time
stim_onset = str2num(handles.stimulus_onset_edit.String);
if isempty(stim_onset)
    errordlg('Invalid stimulus onset', 'Temporal Simulation');
    return
end 
% Get baseline range
lower_baseline_range = str2num(handles.min_baseline_rate_range_edit.String);
if isempty(lower_baseline_range)
    errordlg('Invalid lower baseline range', 'Temporal Simulation');
    return
end 
upper_baseline_range = str2num(handles.max_baseline_rate_range_edit.String);
if isempty(upper_baseline_range)
    errordlg('Invalid upper baseline range', 'Temporal Simulation');
    return
end 
% Get trial to trial start jitter
start_jitter = str2num(handles.starttime_jitter_edit.String);
if isempty(start_jitter)
    errordlg('Invalid trial to trial start time jitter value', 'Temporal Simulation');
    return
end 
duration_jitter = str2num(handles.duration_jitter_edit.String);
if isempty(duration_jitter)
    errordlg('Invalid trial to trial duration jitter value', 'Temporal Simulation');
    return
end
% stim A features
stimA_response_start_min = str2num(handles.response_start_time_range_begin_edit.String);
if isempty(stimA_response_start_min)
    errordlg('Invalid min response start time for stim A', 'Temporal Simulation');
    return
end 
stimA_response_start_max = str2num(handles.response_start_time_range_end_edit.String);
if isempty(stimA_response_start_max)
    errordlg('Invalid max response start time for stim A', 'Temporal Simulation');
    return
end 
% Get number of starting times
n_start_times = str2num(handles.response_start_time_N_edit.String);
if isempty(n_start_times)
    errordlg('Invalid number of start times', 'Temporal Simulation');
    return
end 
n_durations = str2num(handles.number_durations_edit.String);
if isempty(n_durations)
    errordlg('Invalid number of durations', 'Temporal Simulation');
    return
end 

stimA_response_duration_min = str2num(handles.response_duration_min_edit.String);
if isempty(stimA_response_duration_min)
    errordlg('Invalid min response duration for stim A', 'Temporal Simulation');
    return
end 
stimA_response_duration_max = str2num(handles.response_duration_max_edit.String);
if isempty(stimA_response_duration_max)
    errordlg('Invalid max response duration for stim A', 'Temporal Simulation');
    return
end 
stimA_response_min = str2num(handles.min_stimA_response_edit.String);
if isempty(stimA_response_min)
    errordlg('Invalid min response for stim A', 'Temporal Simulation');
    return
end 
stimA_response_max = str2num(handles.max_stimA_response_edit.String);
if isempty(stimA_response_max)
    errordlg('Invalid max response for stim A', 'Temporal Simulation');
    return
end 
% Get stim B response values
stimB_response_start_min = str2num(handles.stimB_response_start_time_range_begin_edit.String);
if isempty(stimB_response_start_min)
    errordlg('Invalid min response start offset for stim B', 'Temporal Simulation');
    return
end 
stimB_response_start_max = str2num(handles.stimB_response_start_time_range_end_edit.String);
if isempty(stimB_response_start_max)
    errordlg('Invalid max response start offset for stim B', 'Temporal Simulation');
    return
end 
stimB_response_duration_min = str2num(handles.stimB_response_duration_range_min_edit.String);
if isempty(stimB_response_duration_min)
    errordlg('Invalid min response duration offset for stim B', 'Temporal Simulation');
    return
end 
stimB_response_duration_max = str2num(handles.stimB_response_duration_range_max_edit.String);
if isempty(stimB_response_duration_max)
    errordlg('Invalid max response duration offset for stim B', 'Temporal Simulation');
    return
end 
stimB_response_min = str2num(handles.min_stimB_response_edit.String);
if isempty(stimB_response_min)
    errordlg('Invalid min response offset for stim B', 'Temporal Simulation');
    return
end 
stimB_response_max = str2num(handles.max_stimB_response_edit.String);
if isempty(stimB_response_max)
    errordlg('Invalid miaxn response offset for stim B', 'Temporal Simulation');
    return
end 

% save values in struct
sim_params.n_trials = n_trials;
sim_params.trial_duration = trial_duration;
sim_params.temp_res = temp_res/1000; % convert from ms to seconds
sim_params.stim_onset = stim_onset;
sim_params.lower_baseline_range = lower_baseline_range;
sim_params.upper_baseline_range = upper_baseline_range;
sim_params.start_jitter = start_jitter;
sim_params.duration_jitter = duration_jitter;
sim_params.stimA_response_start_min = stimA_response_start_min;
sim_params.stimA_response_start_max = stimA_response_start_max;
sim_params.stimA_response_duration_min = stimA_response_duration_min;
sim_params.stimA_response_duration_max = stimA_response_duration_max;
sim_params.stimA_response_min = stimA_response_min;
sim_params.stimA_response_max = stimA_response_max;
sim_params.stimB_response_start_min = stimB_response_start_min;
sim_params.stimB_response_start_max = stimB_response_start_max;
sim_params.stimB_response_duration_min = stimB_response_duration_min;
sim_params.stimB_response_duration_max = stimB_response_duration_max;
sim_params.stimB_response_min = stimB_response_min;
sim_params.stimB_response_max = stimB_response_max;
sim_params.n_start_times = n_start_times;
sim_params.n_durations = n_durations;

