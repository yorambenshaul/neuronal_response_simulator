function plot_scenario_discriminability_gui(TV,a_SPKS,b_SPKS,scenario,Dmeasure,CLims)
% Show the PSTHs associated with a given scenario
% The function loads the file and the structure containg the stimulated
% scenario and plots it - it is entirely determinstic

%% define data directories
% % basedir = 'C:\Users\yoramb\Documents\DATA\simulated_data';
% % 
% % fname = [basedir filesep scenario filesep scenario '.mat'];
% % load(fname);
% % 
N = length(a_SPKS);


%% plot the result

% We do this for each temporal resolution separately 

% temporal resolutions to analyze
nbins = length(TV);
TRs = [0.5 1 2 3 4 5 10 20];
LastTime  = 25;
FirstTime = 5;

% times corresponding to these times
for i = 1:length(TRs)
    TMs{i}     = [FirstTime:TRs(i):LastTime];
    if TMs{i}(end)  < LastTime 
        TMs{i} = [TMs{i}  LastTime ];
    end
end
% find the bins that correspond to these times
% times corresponding to these times
for i = 1:length(TMs)    
    for j = 1:length(TMs{i})
        t = TMs{i}(j);
        [~,b] = min(abs(TV-t));       
        BINs{i}(j) = b;        
    end
end

[~,b] = min(abs(TV-5));
lastbasebin = b-1;

% now run over each of thes resolutions - first do the baseline bin for
% each. They are all the samem, since we take one large 5 second window for
% the entire duration. 
for tri = 1:length(TRs)
    DiscMat{tri} = zeros(N,nbins);
    % run over each bin
    binrange = [1:lastbasebin];
    % run over each neuron
    for ni = 1:N
        a_mat = a_SPKS{ni}(:,binrange);
        b_mat = b_SPKS{ni}(:,binrange);
        a_counts = sum(a_mat,2);
        b_counts = sum(b_mat,2);
        % dprime   = abs(mean(a_counts)-mean(b_counts))/ sqrt(0.5*([var(a_counts) + var(b_counts)]));
        
        switch Dmeasure
            case 'absDprime'
                dprime   = abs(mean(b_counts)-mean(a_counts))/ sqrt(0.5*([var(a_counts) + var(b_counts)]));
            case 'Dprime'
                dprime   = (mean(b_counts)-mean(a_counts))/ sqrt(0.5*([var(a_counts) + var(b_counts)]));
            case 'meandiff'
                dprime   = mean(b_counts)-mean(a_counts);
            case 'auROC'
                dprime   = roc_analysis(a_counts',b_counts',0);
            case 'abs auROC'
                dprime   = abs(roc_analysis(a_counts',b_counts',0));
        end
                
        % assign the value to all relevant bins
        DiscMat{tri}(ni,binrange) = dprime;
    end
end


% now run over each of thes resolutions
for tri = 1:length(TRs)
    % run over each bin
    for bi = 1:(length(BINs{tri})-1)
        binrange = [BINs{tri}(bi):BINs{tri}(bi+1)];
        % run over each neuron
        for ni = 1:N
            a_mat = a_SPKS{ni}(:,binrange);
            b_mat = b_SPKS{ni}(:,binrange);
            a_counts = sum(a_mat,2);
            b_counts = sum(b_mat,2);
            switch Dmeasure
                case 'absDprime'
                    dprime   = abs(mean(b_counts)-mean(a_counts))/ sqrt(0.5*([var(a_counts) + var(b_counts)]));
                case 'Dprime'
                    dprime   = (mean(b_counts)-mean(a_counts))/ sqrt(0.5*([var(a_counts) + var(b_counts)]));
                case 'meandiff'
                    dprime   = mean(b_counts)-mean(a_counts);
                case 'auROC'
                    dprime   = roc_analysis(a_counts',b_counts',0);
                 case 'abs auROC'
                    dprime   = abs(roc_analysis(a_counts',b_counts',0));                        
            end
            % assign the value to all relevant bins
            DiscMat{tri}(ni,binrange) = dprime;
        end
    end
end

% Get the maximum value
maxval = 0;
for i = 1:length(DiscMat)
    maxval = max(maxval,max(abs(DiscMat{i}(:))));
end

switch Dmeasure
    case {'absDprime','abs auROC'}
        minval = 0;
    case {'Dprime', 'meandiff','auROC'}
        minval = -maxval;
end


if ~isempty(CLims)
    minval = CLims(1);
    maxval = CLims(2);
end

% maxclim = 0;
fh = figure;
for tri = 1:length(TRs)
    sh(i) = subplot(2,4,tri);    
    imagesc([TV(1) TV(end)],[1 N],DiscMat{tri},[minval maxval]);
    colorbar
    title(['temporal resolution ' num2str(TRs(tri)) ' s']);
    
    set(gca,'Ytick',[1:N],'Xtick',[0:5:TV(end)])
    ylabel('neurons')
    xlabel('time (s)')
    
    
    % maxclim = max(maxclim,max(get(gca,'Clim')));
end




switch Dmeasure
    case {'absDprime','abs auROC'}
        colormap hot
    case {'Dprime', 'meandiff','auROC'}
        % colormap(parula(128));
        colormap(redbluecmap(21))
        %cmap = load('H:\documents\MATLAB\myredgreencmap');
        %colormap(cmap.C)
end

titstr = ['Discriminability_' scenario '_' Dmeasure];
set(fh,'name',titstr)
% % fullfname = [basedir filesep scenario filesep  fname];
% % savefig(fullfname)






% % % basedir = 'C:\Users\yoramb\Documents\DATA\simulated_data';
% % % 
% % % fname = [basedir filesep scenario filesep scenario '.mat'];
% % % load(fname)

return

% % 
% % fh = figure;
% % set(fh,'name',['PSTHs_' scenario ],'numbertitle','off')
% % for i = 1:N
% %     % get and plot response for stim a
% %     % [a_SPKS{i},a_TV{i}] = generate_one_response_type(BS,TD,NT,a_BRs(i),a_RRs(i),a_RSrngs(i,:),a_RDrngs(i,:));
% %     % info string (for title)    
% %     
% %     
% %     %INFO_STR = ['Start: ' num2str(a_RSrngs(i,1)) '-' num2str(a_RSrngs(i,2)) ' Dur: ' num2str(a_RDrngs(i,1)) '-' num2str(a_RDrngs(i,1)) ' Base Rate: ' num2str(a_BRs(i)) ' Resp Rate: ' num2str(a_RRs(i))];    
% %     %ah1_a = subplot(N,2,(i-1)*2+1);
% %     ah2_a = plot_single_sim_case(a_SPKS{i},TV,NT,BS,SWW,INFO_STR,ah1_a,SAVE_SPACE);
% %     
% %     % get and plot response for stim b
% %     % [b_SPKS{i},b_TV{i}] = generate_one_response_type(BS,TD,NT,b_BRs(i),b_RRs(i),b_RSrngs(i,:),b_RDrngs(i,:));
% %     % info string (for title)
% %     INFO_STR = ['Start: ' num2str(b_RSrngs(i,1)) '-' num2str(b_RSrngs(i,2)) ' Dur: ' num2str(b_RDrngs(i,1)) '-' num2str(b_RDrngs(i,1)) ' Base Rate: ' num2str(b_BRs(i)) ' Resp Rate: ' num2str(b_RRs(i))];
% %     ah1_b = subplot(N,2,(i-1)*2+2);
% %     ah2_b = plot_single_sim_case(b_SPKS{i},TV,NT,BS,SWW,INFO_STR,ah1_b,SAVE_SPACE); 
% %             
% %     maxY = max(max(get(ah2_a,'Ylim')),max(get(ah2_b,'Ylim')));
% %     set(ah2_a,'Ylim',[0 maxY]);
% %     set(ah2_b,'Ylim',[0 maxY]);
% %    
% %     % set([ah2_a ah1_b ],'YTickLabel',[],'Ylabel',[])
% %     if ~(i==N)
% %         set([ah1_a ah2_a ah1_b ah2_b],'XTick',[],'Xlabel',[])
% %     end
% %     
% % end
% %    
% % savefig([basedir filesep scenario filesep  'PSTHs_' scenario ])

