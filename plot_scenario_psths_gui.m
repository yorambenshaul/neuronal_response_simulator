function plot_scenario_psths_gui(population,a_SPKS,b_SPKS,TV,NT,BS,scenario,SWW)
% Show the PSTHs associated with a given scenario
% The function loads the file and the structure containg the stimulated
% scenario and plots it - it is entirely determinstic

% population = D.population;
% scenario = D.scenarioname;
% a_SPKS = D.a_SPKS;
% b_SPKS = D.b_SPKS;
% TV = D.TV;
% NT = D.NT;
% BS = D.BS;
% SWW = []; % though it is not used currently 0.2; % but must be passed via user


a_BRs = population.a_BRs;
a_RRs = population.a_RRs;
a_RSrngs = population.a_RSrngs;
a_RDrngs = population.a_RDrngs;
b_BRs = population.b_BRs;
b_RRs = population.b_RRs;
b_RSrngs = population.b_RSrngs;
b_RDrngs = population.b_RDrngs;

%% define data directories

% number of units
N = size(a_SPKS,2);
if N > 15 
    SAVE_SPACE = 1;
else
    SAVE_SPACE = 0;
end

%% plot the result
fh = figure;
set(fh,'name',['PSTHs_' scenario ],'numbertitle','off')
for i = 1:N
    % get and plot response for stim a
    % [a_SPKS{i},a_TV{i}] = generate_one_response_type(BS,TD,NT,a_BRs(i),a_RRs(i),a_RSrngs(i,:),a_RDrngs(i,:));
    % info string (for title)    
    INFO_STR = ['Start: ' num2str(a_RSrngs(i,1)) '-' num2str(a_RSrngs(i,2)) ' Dur: ' num2str(a_RDrngs(i,1)) '-' num2str(a_RDrngs(i,2)) ' Base Rate: ' num2str(a_BRs(i)) ' Resp Rate: ' num2str(a_RRs(i))];    
    ah1_a = subplot(N,2,(i-1)*2+1);
    ah2_a = plot_single_sim_case(a_SPKS{i},TV,NT,BS,SWW,INFO_STR,ah1_a,SAVE_SPACE);
    
    
    ah2_a.Title.FontSize = 8;
    ah2_a.YLabel.String  = [];
        
    if ~SAVE_SPACE
        sstr{1} = ['N ' num2str(i)];
        sstr{2} = [' Stim A'];
        ah1_a.YLabel.String = sstr;
    end
    
    % get and plot response for stim b
    % [b_SPKS{i},b_TV{i}] = generate_one_response_type(BS,TD,NT,b_BRs(i),b_RRs(i),b_RSrngs(i,:),b_RDrngs(i,:));
    % info string (for title)
    INFO_STR = ['Start: ' num2str(b_RSrngs(i,1)) '-' num2str(b_RSrngs(i,2)) ' Dur: ' num2str(b_RDrngs(i,1)) '-' num2str(b_RDrngs(i,2)) ' Base Hz: ' num2str(b_BRs(i)) ' Resp Hz: ' num2str(b_RRs(i))];
    ah1_b = subplot(N,2,(i-1)*2+2);
    ah2_b = plot_single_sim_case(b_SPKS{i},TV,NT,BS,SWW,INFO_STR,ah1_b,SAVE_SPACE); 
       

    
    
    maxY = max(max(get(ah2_a,'Ylim')),max(get(ah2_b,'Ylim')));
    set(ah2_a,'Ylim',[0 maxY]);
    set(ah2_b,'Ylim',[0 maxY]);
   
    ah2_b.Title.FontSize = 8;
    
   if ~SAVE_SPACE
        sstr{1} = ['N ' num2str(i)];
        sstr{2} = [' Stim B'];
        ah1_b.YLabel.String = sstr;
    end
    
    
    % set([ah2_a ah1_b ],'YTickLabel',[],'Ylabel',[])
    if ~(i==N)
        set([ah1_a ah2_a ah1_b ah2_b],'XTick',[],'Xlabel',[])
    end
    
end
   
% savefig([basedir filesep scenario filesep  'PSTHs_' scenario ])

