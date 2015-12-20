function [Axes, axesHandle] = makeCubeAxes( min, max )
%sets up cubic axes with identical x y and z properties for the UFO
%animation

figure
Axes = axes('xlim',[min max],'ylim',[min max],'zlim',[min max]);
view(3);
axis off;%hides axes
axesHandle = axes('units','normalized','position',[0 0 1 1]);
uistack(axesHandle,'bottom'); %fixes o scrren for bckgd image


end

