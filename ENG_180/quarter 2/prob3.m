% do not modify the function line below
function [xTranslation, yTranslation, zTranslation] = problem3
% generate the figure window and axes
myAxes = axes('xlim',[-20 20],'ylim',[-20 20],'zlim',[-20 20]); 
view(3) 
grid on; 
axis equal; 
hold on 
xlabel('x') 
ylabel('y') 
zlabel('z') 
% generate sphere
[x,y,z] = sphere(20);
 
 
% 3-D Animation      +x   +y   -x   +z   +x  -y   -x
xTranslation = [-10, 10,  10,  -10, -10, 10, 10,  -10];
yTranslation = [-10, -10, 10,  10,   10,  10, -10, -10];
zTranslation = [-10, -10, -10, -10,  10,  10, 10,  10];
combinedObject = hgtransform('parent',myAxes); 
h = surface(x,y,z,'facecolor', 'r', 'edgealpha', 0);
set(h,'parent',combinedObject) 
drawnow 
for i = 1:length(xTranslation)
    translation = makehgtform('translate',[xTranslation(i) yTranslation(i) zTranslation(i)]); 
    
    % Combining the individual transformation
    set(combinedObject,'matrix',translation);
    pause(.5)
    hold on
end
end