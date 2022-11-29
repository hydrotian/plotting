clc; clear;

lms = [-97.35 -93.4 28.1 30.6]; 
% MT = 'satellite';
% MT = 'terrain';
MT = 'roadmap';

fg = figure;
set(fg, 'Position', [50 60 800 600]);
m_proj('Equid','lat',lms(3:4),'lon',lms(1:2));

% divide the area into four tiles: SW, SE, NW, NE
temp = [lms(1) lms(1)+(lms(2)-lms(1))/2 lms(3) lms(3)+(lms(4)-lms(3))/2];
axis(temp);
[Glonsw,Glatsw,Gimgsw]=plot_google_map('MapType',MT,'refresh',0,'autoaxis',0, 'showlabels',0);

temp = [lms(1)+(lms(2)-lms(1))/2 lms(2) lms(3) lms(3)+(lms(4)-lms(3))/2];
axis(temp);
[Glonse,Glatse,Gimgse]=plot_google_map('MapType',MT,'refresh',0,'autoaxis',0, 'showlabels',0);

temp = [lms(1) lms(1)+(lms(2)-lms(1))/2 lms(3)+(lms(4)-lms(3))/2 lms(4)];
axis(temp);
[Glonnw,Glatnw,Gimgnw]=plot_google_map('MapType',MT,'refresh',0,'autoaxis',0, 'showlabels',0);

temp = [lms(1)+(lms(2)-lms(1))/2 lms(2) lms(3)+(lms(4)-lms(3))/2 lms(4)];
axis(temp);
[Glonne,Glatne,Gimgne]=plot_google_map('MapType',MT,'refresh',0,'autoaxis',0, 'showlabels',0);

% stitch SE and SW to create S
Glonse_cut = Glonse(sum(Glonse<=max(Glonsw))+1:end);
Glon = [Glonsw Glonse_cut];
Gimgse_cut = Gimgse(:,sum(Glonse<=max(Glonsw))+1:end,:);
Gimgs = cat(2,Gimgsw,Gimgse_cut);

% stitch NE and NW to create N
Gimgne_cut = Gimgne(:,sum(Glonne<=max(Glonnw))+1:end,:);
Gimgn = cat(2,Gimgnw,Gimgne_cut);

% stitch S and N
Glatn_cut = Glatne(1:sum(Glatne>max(Glatse)));
Glat = [Glatn_cut Glatse];
Gimgn_cut = Gimgn(1:sum(Glatne>max(Glatse)),:,:);
Gimg = cat(1,Gimgn_cut,Gimgs);

hold on

% basemap
m_image(Glon,Glat,Gimg); % this is how google map is printed

% rivers
m_gshhs('fr','color',[0, 0.7, 0.9],'linewidth',2);

hold off

set(gca,'fontname','Segoe UI Semilight')
m_grid('linewi',1,'tickdir','in')