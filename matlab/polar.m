lat = randi([50 90],50,1);
lon = randi([-180 180],50,1);

fg = figure;
set(fg, 'Position', [50 80 300 300]);

m_proj('azimuthal equal-area','latitude',90,'radius',45,'rectbox','off');
h1=m_scatter(lon,lat,(lat-49)*2,lat,'filled');
m_coast('color',[.6 .6 .6]);
m_grid('tickdir','out','ytick',[60 80],'linest','-','color',[.75 .75 .75]);      
hh=colorbar('h');
set(hh,'tickdir','out');
xlabel(hh,'Latitude (deg)');

