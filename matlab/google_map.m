clc; clear;

lms = [-97.35 -93.4 28.1 30.6]; 
% MT = 'satellite';
% MT = 'terrain';
MT = 'roadmap';

fg = figure;
set(fg, 'Position', [50 60 800 600]);
m_proj('Equid','lat',lms(3:4),'lon',lms(1:2));

axis(lms);
[Glon,Glat,Gimg]=plot_google_map('MapType',MT,'refresh',0,'autoaxis',0, 'showlabels',0);

hold on

% basemap
m_image(Glon,Glat,Gimg);

% rivers
m_gshhs('fr','color',[0, 0.7, 0.9],'linewidth',2);

hold off

set(gca,'fontname','Segoe UI Semilight')
m_grid('linewi',1,'tickdir','in')