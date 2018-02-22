function set_stimulation_params(handles,sim_params)
% Set saved parameters to the interface
% This is the reverse operation of get_stimulation_params


% get temporal resolution
% we have to multpliy by 1000 to get to ms from seconds
handles.simulation_binsize_edit.String = num2str(sim_params.temp_res*1000);
handles.number_trials_edit.String = num2str(sim_params.n_trials);
handles.trial_duration_edit.String = num2str(sim_params.trial_duration);
handles.stimulus_onset_edit.String = num2str(sim_params.stim_onset);
handles.min_baseline_rate_range_edit.String = num2str(sim_params.lower_baseline_range);
handles.max_baseline_rate_range_edit.String = num2str(sim_params.upper_baseline_range);
handles.starttime_jitter_edit.String = num2str(sim_params.start_jitter);
handles.duration_jitter_edit.String = num2str(sim_params.duration_jitter);
handles.response_start_time_range_begin_edit.String = num2str(sim_params.stimA_response_start_min);
handles.response_start_time_range_end_edit.String = num2str(sim_params.stimA_response_start_max);
handles.response_start_time_N_edit.String = num2str(sim_params.n_start_times);
handles.number_durations_edit.String = num2str(sim_params.n_durations);
handles.response_duration_min_edit.String = num2str(sim_params.stimA_response_duration_min);
handles.response_duration_max_edit.String = num2str(sim_params.stimA_response_duration_max);
handles.min_stimA_response_edit.String = num2str(sim_params.stimA_response_min);
handles.max_stimA_response_edit.String = num2str(sim_params.stimA_response_max);
handles.stimB_response_start_time_range_begin_edit.String = num2str(sim_params.stimB_response_start_min);
handles.stimB_response_start_time_range_end_edit.String = num2str(sim_params.stimB_response_start_max);
handles.stimB_response_duration_range_min_edit.String = num2str(sim_params.stimB_response_duration_min);
handles.stimB_response_duration_range_max_edit.String = num2str(sim_params.stimB_response_duration_max);
handles.min_stimB_response_edit.String = num2str(sim_params.stimB_response_min);
handles.max_stimB_response_edit.String = num2str(sim_params.stimB_response_max);


