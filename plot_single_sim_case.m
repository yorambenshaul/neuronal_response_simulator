function a2 = plot_single_sim_case(R,TV,NT,BS,SWW,INFO_STR,a1,SAVE_SPACE)
       
% PSTH - the rate is normalized by the bin size and the number of trials,
% giving firing rate in Hz

PSTH = sum(R) / (NT*BS);
sPSTH = smoothdata(PSTH,'movmean',round(SWW/BS)); % a sec smoothing window
% sPSTH = PSTH; % no smoothing, a better indication of what is going on in terms of response onset

%figure
%a1 = axes;
axes(a1)
imagesc(R,'Xdata',TV);
set(gca,'ytick',1:NT,'YtickLabel',[])
if ~SAVE_SPACE
    % ylabel('trial')
    xlabel('time - s')    
else
    set(gca,'ytick',[])
end
colormap gray
colormap(flipud(colormap))

AP = get(a1,'position');
a2 = axes('position',AP,'color','none');
hold on
ph = plot(TV,sPSTH,'r');
set(ph,'linewidth',1)
set(a2,'Yaxislocation','right','xticklabel',[],'Ylim',[0 1.1*max(sPSTH)])
if ~SAVE_SPACE
    ylabel('rate Hz')
else
    set(gca,'ytick',[])
end


if ~SAVE_SPACE
    title([INFO_STR ' #spikes = ' num2str(sum(R(:)))])
end
