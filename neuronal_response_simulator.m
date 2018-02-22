function varargout = neuronal_response_simulator(varargin)
% NEURONAL_RESPONSE_SIMULATOR MATLAB code for neuronal_response_simulator.fig
%      NEURONAL_RESPONSE_SIMULATOR, by itself, creates a new NEURONAL_RESPONSE_SIMULATOR or raises the existing
%      singleton*.
%
%      H = NEURONAL_RESPONSE_SIMULATOR returns the handle to a new NEURONAL_RESPONSE_SIMULATOR or the handle to
%      the existing singleton*.
%
%      NEURONAL_RESPONSE_SIMULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEURONAL_RESPONSE_SIMULATOR.M with the given input arguments.
%
%      NEURONAL_RESPONSE_SIMULATOR('Property','Value',...) creates a new NEURONAL_RESPONSE_SIMULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before neuronal_response_simulator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to neuronal_response_simulator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help neuronal_response_simulator

% Last Modified by GUIDE v2.5 04-Feb-2018 17:53:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @neuronal_response_simulator_OpeningFcn, ...
                   'gui_OutputFcn',  @neuronal_response_simulator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before neuronal_response_simulator is made visible.
function neuronal_response_simulator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to neuronal_response_simulator (see VARARGIN)

% Choose default command line output for neuronal_response_simulator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% If we have a file containing the last saved data dir - apply it
[P,~,~] = fileparts(which(mfilename));
if isfile([P filesep 'temp_sim_start_dir.mat'])
    D = load([P filesep 'temp_sim_start_dir.mat']);
    handles.data_dir_text.String = D.start_dir;
end


% UIWAIT makes neuronal_response_simulator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = neuronal_response_simulator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function stimulus_onset_edit_Callback(hObject, eventdata, handles)
% hObject    handle to stimulus_onset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stimulus_onset_edit as text
%        str2double(get(hObject,'String')) returns contents of stimulus_onset_edit as a double


% --- Executes during object creation, after setting all properties.
function stimulus_onset_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stimulus_onset_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function response_start_time_range_begin_edit_Callback(hObject, eventdata, handles)
% hObject    handle to response_start_time_range_begin_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of response_start_time_range_begin_edit as text
%        str2double(get(hObject,'String')) returns contents of response_start_time_range_begin_edit as a double


% --- Executes during object creation, after setting all properties.
function response_start_time_range_begin_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to response_start_time_range_begin_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function response_start_time_range_end_edit_Callback(hObject, eventdata, handles)
% hObject    handle to response_start_time_range_end_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of response_start_time_range_end_edit as text
%        str2double(get(hObject,'String')) returns contents of response_start_time_range_end_edit as a double


% --- Executes during object creation, after setting all properties.
function response_start_time_range_end_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to response_start_time_range_end_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function response_start_time_N_edit_Callback(hObject, eventdata, handles)
% hObject    handle to response_start_time_N_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of response_start_time_N_edit as text
%        str2double(get(hObject,'String')) returns contents of response_start_time_N_edit as a double


% --- Executes during object creation, after setting all properties.
function response_start_time_N_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to response_start_time_N_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function trial_duration_edit_Callback(hObject, eventdata, handles)
% hObject    handle to trial_duration_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trial_duration_edit as text
%        str2double(get(hObject,'String')) returns contents of trial_duration_edit as a double


% --- Executes during object creation, after setting all properties.
function trial_duration_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trial_duration_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function response_duration_min_edit_Callback(hObject, eventdata, handles)
% hObject    handle to response_duration_min_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of response_duration_min_edit as text
%        str2double(get(hObject,'String')) returns contents of response_duration_min_edit as a double


% --- Executes during object creation, after setting all properties.
function response_duration_min_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to response_duration_min_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function response_duration_max_edit_Callback(hObject, eventdata, handles)
% hObject    handle to response_duration_max_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of response_duration_max_edit as text
%        str2double(get(hObject,'String')) returns contents of response_duration_max_edit as a double


% --- Executes during object creation, after setting all properties.
function response_duration_max_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to response_duration_max_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function number_durations_edit_Callback(hObject, eventdata, handles)
% hObject    handle to number_durations_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_durations_edit as text
%        str2double(get(hObject,'String')) returns contents of number_durations_edit as a double


% --- Executes during object creation, after setting all properties.
function number_durations_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_durations_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_baseline_rate_range_edit_Callback(hObject, eventdata, handles)
% hObject    handle to min_baseline_rate_range_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_baseline_rate_range_edit as text
%        str2double(get(hObject,'String')) returns contents of min_baseline_rate_range_edit as a double


% --- Executes during object creation, after setting all properties.
function min_baseline_rate_range_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_baseline_rate_range_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_baseline_rate_range_edit_Callback(hObject, eventdata, handles)
% hObject    handle to max_baseline_rate_range_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_baseline_rate_range_edit as text
%        str2double(get(hObject,'String')) returns contents of max_baseline_rate_range_edit as a double


% --- Executes during object creation, after setting all properties.
function max_baseline_rate_range_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_baseline_rate_range_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_stimA_response_edit_Callback(hObject, eventdata, handles)
% hObject    handle to min_stimA_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_stimA_response_edit as text
%        str2double(get(hObject,'String')) returns contents of min_stimA_response_edit as a double


% --- Executes during object creation, after setting all properties.
function min_stimA_response_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_stimA_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_stimA_response_edit_Callback(hObject, eventdata, handles)
% hObject    handle to max_stimA_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_stimA_response_edit as text
%        str2double(get(hObject,'String')) returns contents of max_stimA_response_edit as a double


% --- Executes during object creation, after setting all properties.
function max_stimA_response_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_stimA_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min_stimB_response_edit_Callback(hObject, eventdata, handles)
% hObject    handle to min_stimB_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min_stimB_response_edit as text
%        str2double(get(hObject,'String')) returns contents of min_stimB_response_edit as a double


% --- Executes during object creation, after setting all properties.
function min_stimB_response_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min_stimB_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_stimB_response_edit_Callback(hObject, eventdata, handles)
% hObject    handle to max_stimB_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max_stimB_response_edit as text
%        str2double(get(hObject,'String')) returns contents of max_stimB_response_edit as a double


% --- Executes during object creation, after setting all properties.
function max_stimB_response_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max_stimB_response_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stimB_response_start_time_range_begin_edit_Callback(hObject, eventdata, handles)
% hObject    handle to stimB_response_start_time_range_begin_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stimB_response_start_time_range_begin_edit as text
%        str2double(get(hObject,'String')) returns contents of stimB_response_start_time_range_begin_edit as a double


% --- Executes during object creation, after setting all properties.
function stimB_response_start_time_range_begin_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stimB_response_start_time_range_begin_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stimB_response_start_time_range_end_edit_Callback(hObject, eventdata, handles)
% hObject    handle to stimB_response_start_time_range_end_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stimB_response_start_time_range_end_edit as text
%        str2double(get(hObject,'String')) returns contents of stimB_response_start_time_range_end_edit as a double


% --- Executes during object creation, after setting all properties.
function stimB_response_start_time_range_end_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stimB_response_start_time_range_end_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stimB_response_duration_range_min_edit_Callback(hObject, eventdata, handles)
% hObject    handle to stimB_response_duration_range_min_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stimB_response_duration_range_min_edit as text
%        str2double(get(hObject,'String')) returns contents of stimB_response_duration_range_min_edit as a double


% --- Executes during object creation, after setting all properties.
function stimB_response_duration_range_min_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stimB_response_duration_range_min_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stimB_response_duration_range_max_edit_Callback(hObject, eventdata, handles)
% hObject    handle to stimB_response_duration_range_max_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stimB_response_duration_range_max_edit as text
%        str2double(get(hObject,'String')) returns contents of stimB_response_duration_range_max_edit as a double


% --- Executes during object creation, after setting all properties.
function stimB_response_duration_range_max_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stimB_response_duration_range_max_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function starttime_jitter_edit_Callback(hObject, eventdata, handles)
% hObject    handle to starttime_jitter_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of starttime_jitter_edit as text
%        str2double(get(hObject,'String')) returns contents of starttime_jitter_edit as a double


% --- Executes during object creation, after setting all properties.
function starttime_jitter_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to starttime_jitter_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function duration_jitter_edit_Callback(hObject, eventdata, handles)
% hObject    handle to duration_jitter_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duration_jitter_edit as text
%        str2double(get(hObject,'String')) returns contents of duration_jitter_edit as a double


% --- Executes during object creation, after setting all properties.
function duration_jitter_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duration_jitter_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function simulation_binsize_edit_Callback(hObject, eventdata, handles)
% hObject    handle to simulation_binsize_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of simulation_binsize_edit as text
%        str2double(get(hObject,'String')) returns contents of simulation_binsize_edit as a double


% --- Executes during object creation, after setting all properties.
function simulation_binsize_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to simulation_binsize_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function number_trials_edit_Callback(hObject, eventdata, handles)
% hObject    handle to number_trials_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of number_trials_edit as text
%        str2double(get(hObject,'String')) returns contents of number_trials_edit as a double


% --- Executes during object creation, after setting all properties.
function number_trials_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to number_trials_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save_scenario_pushbutton.
function save_scenario_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to save_scenario_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sim_params = get_stimulation_params(handles);

% Get datadir
if ~isdir(handles.data_dir_text.String)
    errordlg('A valid directory must be specified before saving scenario', 'Temporal Simulation');
    return
end

prompt = {'Enter a name for the scenario:'};
dlg_title = 'Temporal Simulation';
num_lines = 1;
defaultans = {''};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
if isempty(answer)
    return
end
scenarioname = answer{1};


fulldirname = [handles.data_dir_text.String filesep scenarioname];
if isdir(fulldirname)
    answer = questdlg('Scenario name exists, overwrite?','Temporal Simulation','overwrite', 'cancel', 'cancel');    
    switch answer
        case 'cancel'
            return
    end % switch
else
    mkdir(fulldirname);
end

% if everything is OK save the scenario
fullfname = [fulldirname filesep scenarioname '_params.mat'];
save(fullfname,'sim_params');

handles.scenario_name_txt.String = scenarioname;

population = draw_population_gui(sim_params);

 
BS = sim_params.temp_res;
TD = sim_params.trial_duration;
NT = sim_params.n_trials;

[a_SPKS, b_SPKS, TV] = get_response_realization(population,BS,TD,NT); %#ok<ASGLU>

% save the spikes in a data file
spike_file_name = [fulldirname filesep scenarioname '_spikes.mat'];
save(spike_file_name,'a_SPKS','b_SPKS','TV','BS','TD','NT','population','scenarioname');




% prepare the data in spike matrices for classification 
Tres = 0.5; % maximum resolution in seconds
datadir = [fulldirname filesep ];
TotT  = sim_params.trial_duration; % Total time
BaseT = sim_params.stim_onset; % Time of sitmulus onset
generate_simulated_classifier_struct_gui(BaseT,TotT,a_SPKS,b_SPKS,TV,Tres,datadir,scenarioname)

Message = ['Scenario ' scenarioname ' saved successfuly in ' datadir ];
msgbox(Message,'Temporal Simulation')



% --- Executes on button press in load_scenario_button.
function load_scenario_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_scenario_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Ask the user for a scenario to load - from the baseline directory
% Get datadir
if ~isdir(handles.data_dir_text.String)
    errordlg('A valid directory must be specified before loading scenario', 'Temporal Simulation');
    return
end


sim_dir = uigetdir(handles.data_dir_text.String,'Select directory for simulation data');
if ~sim_dir
    return
end
    
fileseps = findstr(filesep,sim_dir);
scenarioname = sim_dir(fileseps(end)+1:end);

sim_file = [sim_dir filesep scenarioname '_params.mat'];

if ~isfile(sim_file)
    errordlg(['File ' sim_file ' not found, cannot load scenario'], 'Temporal Simulation');
    return
end
D = load(sim_file);   

set_stimulation_params(handles,D.sim_params);
handles.scenario_name_txt.String = scenarioname;






% --- Executes on button press in show_population_pushbutton.
function show_population_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to show_population_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get stimulation parameters
sim_params = get_stimulation_params(handles);

% % % 
% % % % Get datadir
% % % if ~isdir(handles.data_dir_text.String)
% % %     errordlg('A valid directory must be specified before generating a population', 'Temporal Simulation');
% % %     return
% % % end
% % % 
% % % % Get the currently saved scenario name
% % % scenarioname = handles.scenario_name_txt.String;
% % % fulldirname  = [handles.data_dir_text.String filesep scenarioname];
% % % % Get datadir
% % % if ~isdir(fulldirname)
% % %     errordlg('There is no directory for the sceanrio that is currently loaded and saved', 'Temporal Simulation');
% % %     return
% % % end
% % % % This is the name of the file
% % % fullfname = [fulldirname filesep scenarioname '_params.mat'];
% % % if ~isfile(fullfname)
% % %     errordlg(['The file ' fullfname ' which is required for genearting a population does not exist'] , 'Temporal Simulation');
% % %     return
% % % end
% % % 
% % % D = load(fullfname,'sim_params');

% population = draw_population_gui(D.sim_params);
population = draw_population_gui(sim_params);

BS = sim_params.temp_res;
TD = sim_params.trial_duration;
NT = sim_params.n_trials;

[a_SPKS, b_SPKS, TV] = get_response_realization(population,BS,TD,NT); %#ok<ASGLU>

% Get the scenario name, although this may not be the saved one
scenario = handles.scenario_name_txt.String;

% save the spikes in a data file
% spike_file_name = [fulldirname filesep scenarioname '_spikes.mat'];
% save(spike_file_name,'a_SPKS','b_SPKS','TV','BS','TD','NT','population','scenarioname')


% % % 
% % % % Get datadir
% % % if ~isdir(handles.data_dir_text.String)
% % %     errordlg('A valid directory must be specified before plotting population PSTHs', 'Temporal Simulation');
% % %     return
% % % end
% % % 
% % % % Get the currently saved scenario name
% % % scenarioname = handles.scenario_name_txt.String;
% % % fulldirname  = [handles.data_dir_text.String filesep scenarioname];
% % % % Get datadir
% % % if ~isdir(fulldirname)
% % %     errordlg('There is no directory for the sceanrio that is currently loaded and saved', 'Temporal Simulation');
% % %     return
% % % end
% % % % This is the name of the file spike file
% % % spike_file_name = [fulldirname filesep scenarioname '_spikes.mat'];
% % % if ~isfile(spike_file_name)
% % %     errordlg(['The file ' scenarioname '_spikes.mat' ' which is required for plotting population PSTHs does not exist'] , 'Temporal Simulation');
% % %     return
% % % end
% % % 
% % % D = load(spike_file_name);
%% plot_scenario_psths_gui(D)

% get temporal resolution
SWW = str2num(handles.smooth_window_edit.String);
if isempty(SWW)
    errordlg('Invalid smoothing window value', 'Temporal Simulation');
    return
end


plot_scenario_psths_gui(population,a_SPKS,b_SPKS,TV,NT,BS,scenario,SWW)






% --- Executes on button press in population_discriminability.
function population_discriminability_Callback(hObject, eventdata, handles)
% hObject    handle to population_discriminability (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get stimulation parameters
sim_params = get_stimulation_params(handles);

population = draw_population_gui(sim_params);

BS = sim_params.temp_res;
TD = sim_params.trial_duration;
NT = sim_params.n_trials;

[a_SPKS, b_SPKS, TV] = get_response_realization(population,BS,TD,NT); %#ok<ASGLU>

% Get the scenario name, although this may not be the saved one
scenario = handles.scenario_name_txt.String;


% % Dmeasure =  'absDprime'
% %         colormap hot
% %     case {'Dprime', 'meandiff'}
CLims = [];
% Get measure to use
ind = handles.discriminability_popupmenu.Value;
Dmethod = handles.discriminability_popupmenu.String{ind};
switch Dmethod
    case 'D prime'
        Dmeasure = 'Dprime';
    case 'abs D_prime'
        Dmeasure = 'absDprime';
    case 'auROC' 
        Dmeasure = 'auROC';
    case 'abs auROC' 
        Dmeasure = 'abs auROC';
    case 'Delta spike count'
        Dmeasure = 'meandiff';
end


plot_scenario_discriminability_gui(TV,a_SPKS,b_SPKS,scenario,Dmeasure,CLims);



% --- Executes on button press in select_data_directory_button.
function select_data_directory_button_Callback(hObject, eventdata, handles)
% hObject    handle to select_data_directory_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


start_dir = 'c:\';
if isdir(handles.data_dir_text.String)
    start_dir = handles.data_dir_text.String;
end

new_dir = uigetdir(start_dir,'Select directory for simulation data');

if new_dir
    handles.data_dir_text.String = new_dir;
end

return


% --- Executes on selection change in discriminability_popupmenu.
function discriminability_popupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to discriminability_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns discriminability_popupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from discriminability_popupmenu


% --- Executes during object creation, after setting all properties.
function discriminability_popupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to discriminability_popupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% save the data directory before closing 
if isdir(handles.data_dir_text.String)
    start_dir = handles.data_dir_text.String;
    [P,~,~] = fileparts(which(mfilename));
    save([P filesep 'temp_sim_start_dir.mat'],'start_dir')
end
    

    
    
% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function smooth_window_edit_Callback(hObject, eventdata, handles)
% hObject    handle to smooth_window_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of smooth_window_edit as text
%        str2double(get(hObject,'String')) returns contents of smooth_window_edit as a double


% --- Executes during object creation, after setting all properties.
function smooth_window_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to smooth_window_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in classify_button.
function classify_button_Callback(hObject, eventdata, handles)
% hObject    handle to classify_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Check that there is a folder for the currently selected name
if ~isdir(handles.data_dir_text.String)
    errordlg('A valid directory must be specified before classifying scenario', 'Temporal Simulation');
    return
end
scenarioname = handles.scenario_name_txt.String;
scenariodir = [handles.data_dir_text.String filesep scenarioname];

if ~isdir(scenariodir)
    errordlg(['Directory ' scenariodir ' not found, cannot classify scenario'], 'Temporal Simulation');
    return
end
    
% get number of trials
Ntrain = str2num(handles.ntrain_edit.String);
if isempty(Ntrain)
    errordlg('Invalid number of training trials', 'Temporal Simulation');
    return
end 
Ntest = str2num(handles.ntest_edit.String);
if isempty(Ntest)
    errordlg('Invalid number of test trials', 'Temporal Simulation');
    return
end
Nrepeats = str2num(handles.nrepeats_edit.String);
if isempty(Nrepeats)
    errordlg('Invalid number of repeats', 'Temporal Simulation');
    return
end
MaxEpochs = str2num(handles.maxepochs_edit.String);
if isempty(MaxEpochs)
    errordlg('Invalid value for MaxEpochs', 'Temporal Simulation');
    return
end
TotalDuration = str2num(handles.trial_duration_edit.String);
if isempty(TotalDuration)
    errordlg('Invalid value for total trial duration', 'Temporal Simulation');
    return
end


% get type of classification (time sensitive or time invariant)
ind = handles.listbox1.Value;
classification_type = handles.listbox1.String{ind};

% get classifier type (perceptron or SVM)
ind = handles.classifier_type_menu.Value;
classifier_type = handles.classifier_type_menu.String{ind};
switch classifier_type
    case 'perceptron'
        classifier_type = 'PERC';
    case 'SVM (quadratic)'
        classifier_type = 'SVM';
end

% get remixing option
% % % ind = handles.resmaple_menu.Value;
% % % resample_option = handles.resmaple_menu.String{ind};
% % % 
% % % switch resample_option
% % %     case 'mix'
% % %         ResampleN = 1;
% % %     case 'none'
% % %         ResampleN = 0;
% % %     case 'duplicate'
% % %         ResampleN = str2num(handles.duplicate_value_edit.String);
% % %         if isempty(ResampleN)
% % %             errordlg('Invalid value for duplication', 'Temporal Simulation');
% % %             return
% % %         end
% % % end

ResampleN = 0;

% get shuffling option
ind = handles.shuffle_opt_menu.Value;
shuffle_option = handles.shuffle_opt_menu.String{ind};

switch shuffle_option
    case 'none'                       
        shuffle_method = 'none';
    case 'shuffle time windows in all data'
        shuffle_method = 'shuffle_time_before';
    case 'shuffle time windows in test set'
        shuffle_method = 'shuffle_windows';
    case 'shuffle test set '
        shuffle_method = 'all_shuffle';
    case 'shuffle_neurons in all data' 
        shuffle_method = 'shuffle_neurons_before';
    case 'shuffle neurons in test set'
        shuffle_method = 'shuffle_neurons';
end

% This identifies which directory contains the data and this is also the
% comparison name
comparison = scenariodir;

% Call the function
analyze_temporal_classifiers_general(classification_type,classifier_type,comparison,Ntrain,Ntest,ResampleN,Nrepeats,MaxEpochs,shuffle_method)




% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in edit_classification_button.
function edit_classification_button_Callback(hObject, eventdata, handles)
% hObject    handle to edit_classification_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% get type of classification (time sensitive or time invariant)
edit('analyze_temporal_classifiers_general')




function ntrain_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ntrain_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ntrain_edit as text
%        str2double(get(hObject,'String')) returns contents of ntrain_edit as a double


% --- Executes during object creation, after setting all properties.
function ntrain_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ntrain_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ntest_edit_Callback(hObject, eventdata, handles)
% hObject    handle to ntest_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ntest_edit as text
%        str2double(get(hObject,'String')) returns contents of ntest_edit as a double


% --- Executes during object creation, after setting all properties.
function ntest_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ntest_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nrepeats_edit_Callback(hObject, eventdata, handles)
% hObject    handle to nrepeats_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nrepeats_edit as text
%        str2double(get(hObject,'String')) returns contents of nrepeats_edit as a double


% --- Executes during object creation, after setting all properties.
function nrepeats_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nrepeats_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function maxepochs_edit_Callback(hObject, eventdata, handles)
% hObject    handle to maxepochs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxepochs_edit as text
%        str2double(get(hObject,'String')) returns contents of maxepochs_edit as a double


% --- Executes during object creation, after setting all properties.
function maxepochs_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxepochs_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in resmaple_menu.
function resmaple_menu_Callback(hObject, eventdata, handles)
% hObject    handle to resmaple_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns resmaple_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from resmaple_menu


% --- Executes during object creation, after setting all properties.
function resmaple_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resmaple_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function duplicate_value_edit_Callback(hObject, eventdata, handles)
% hObject    handle to duplicate_value_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of duplicate_value_edit as text
%        str2double(get(hObject,'String')) returns contents of duplicate_value_edit as a double


% --- Executes during object creation, after setting all properties.
function duplicate_value_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to duplicate_value_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in shuffle_opt_menu.
function shuffle_opt_menu_Callback(hObject, eventdata, handles)
% hObject    handle to shuffle_opt_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns shuffle_opt_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from shuffle_opt_menu


% --- Executes during object creation, after setting all properties.
function shuffle_opt_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shuffle_opt_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in classifier_type_menu.
function classifier_type_menu_Callback(hObject, eventdata, handles)
% hObject    handle to classifier_type_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns classifier_type_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from classifier_type_menu


% --- Executes during object creation, after setting all properties.
function classifier_type_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to classifier_type_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
