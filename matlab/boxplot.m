x = reshape(rand(10,6),[],1);
group = [repmat(1,10,1);repmat(2,10,1);repmat(3,10,1);repmat(4,10,1);repmat(5,10,1);repmat(6,10,1)];

for iii = 1:3
    p = [iii iii+0.28];
    if iii == 1
        positions = p;
        loc = mean(p);
    else
        positions = [positions p];
        loc = [loc mean(p)];
    end
end

fg = figure;

boxplot(x,group, 'positions', positions,'outliersize',1);
h=findobj(gca,'tag','Outliers'); delete(h)

set(gca,'xtick',loc)
set(gca,'xticklabel',{'A','B','C'})

color = ['c', 'y', 'c', 'y', 'c', 'y'];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end
