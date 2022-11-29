clc; clear;

lms = [-97.35 -93.4 28.1 30.6]; 

fg = figure;
set(fg, 'Position', [50 60 800 600]);

m_proj('Equid','lat',lms(3:4),'lon',lms(1:2));
hold on

% basemap
[CS,CH]=m_etopo2('contourf',[-60:1:0 0:1:200],'edgecolor','none');
colormap([m_colmap('blues',60); m_colmap('gland',200)]); % number means how many bands for each color scheme
brighten(.5); % brighten the image
ax=m_contfbar(0.9,[.2 .5],CS,CH,'edgecolor','none');
title(ax,{'Level/m',''}); % Move up by inserting a blank line

%finer rivers from shapefile
S = shaperead([indir 'Major_Rivers_dd83\MajorRivers_dd83.shp']);
for i = 1:3171
  p1 = m_plot(S(i).X, S(i).Y,'color',[0, 0.7, 0.9],'linewidth',2);
end

% finer coastline
m_gshhs('fc','color',[0.7, 0.7, 0.7],'linewidth',1); 

hold off

set(gca,'fontname','Segoe UI Semilight')
m_grid('linewi',1,'tickdir','in')

set(gcf,'PaperPositionMode','auto')
exportgraphics(gcf,['\plot\map_high.pdf'],'ContentType','vector')

close (fg);