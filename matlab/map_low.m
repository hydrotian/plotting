clc; clear;

lms = [-97.35 -93.4 28.1 30.6]; 

fg = figure;
set(fg, 'Position', [50 60 800 600]);

m_proj('Equid','lat',lms(3:4),'lon',lms(1:2));
hold on

% basemap
[CS,CH]=m_etopo2('contourf',[-60:1:0 0:1:200],'edgecolor','none');
colormap([m_colmap('blues',6); m_colmap('gland',20)]); % number means how many bands for each color scheme
brighten(.5); % brighten the image
ax=m_contfbar(0.9,[.2 .5],CS,CH,'edgecolor','none');
title(ax,{'Level/m',''}); % Move up by inserting a blank line

% rivers
m_gshhs('fr','color',[0, 0.7, 0.9],'linewidth',2);

% coastline
m_gshhs('ic','color',[0.7, 0.7, 0.7],'linewidth',1); 

hold off

set(gca,'fontname','Segoe UI Semilight')
m_grid('linewi',1,'tickdir','in')