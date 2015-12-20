function Section081Group05Project

%this will set up a menu to choose the animation
choice = menu('What do you want the UFO to do?','RISE','CRASH');


%function gets and checks use input
[frames, tiltFactor, spin] =  getValidInput;

[space, spaceHandle] = makeCubeAxes(-30,30);


%conditional makes different points/modifiers for the two animations
if choice == 1
    %%case 1: rise
    
    %imports background image from .jpg file
    backgroundImage = imread('SpaceArt.jpg');
    
    %sets coordinates using frame value and linspace command
    longitude = linspace(1,15,frames);
    latitude = linspace(-16,16,frames);
    altitude = latitude;
    bearingA = linspace(10,50,frames/2 + 1);% 1 is necessary for max value
    bearingB = linspace(bearingA(length(bearingA)-1),10,frames/2 );%the first argument makes sure it starts where the previous vector left off
    bearing = [bearingA bearingB];%concatenates the two matrices
    
    scaleDirection = 1;%scales positively for rising
    muteExponant = 0;%as an exponent this will mute some transforms later
    
else
    
    %imports background image from .jpg file
    backgroundImage = imread('star wars.jpg');
    
    %sets coordinates using frame value and linspace command
    %just like in above vectors, uses concatenation techniques to make
    %unique flight path
    longitude = linspace(0,15,frames);
    latitudeA = linspace(0,-14,frames/2);
    latitudeB = linspace(-16,-30,frames/2);
    latitude = [latitudeA latitudeB];
    altitude = latitude;
    bearingA = linspace(0,40, frames/2 + 1);
    bearingB = linspace(bearingA(length(bearingA)-1),0,frames/2);
    bearing = [bearingA bearingB];
    
    scaleDirection = -1;%scales negatively for crash
    muteExponant = 2;%mute is off here;allows transforms later
    
end

%%

imagesc(backgroundImage);%sets bckd image to figure
set(spaceHandle,'handlevisibility','off','visible','off')%sets final desired properties in figure hiding them

%generates points for UFO shape
[xCylinder,yCylinder,zCylinder] = cylinder([6,4],16);
[xSphere,ySphere,zSphere]=sphere(20);

%uses points to generate two ufos
UFO1(1) = surface(xCylinder, yCylinder ,zCylinder,'FaceColor','b','EdgeColor','y');
UFO1(2) = surface(xSphere*3,ySphere*3,zSphere*3,'FaceColor','b','EdgeColor','b');
UFO2(1) = surface(xCylinder, yCylinder ,zCylinder,'FaceColor','r','EdgeColor','b');
UFO2(2) = surface(xSphere*3,ySphere*3,zSphere*3,'FaceColor','r','EdgeColor','r');

%combines the objects so that each UFO is whole
combinedObject1 = hgtransform('parent',space);
set(UFO1,'parent',combinedObject1);
combinedObject2 = hgtransform('parent',space);
set(UFO2,'parent',combinedObject2);

%introduces dynamic lighting to show proper depth of object's curves
camlight('right')

%for loop performs animation with objects and transforms
for i = 1:length(latitude)
    
    %first set of transforms from flight points
    UFO1translation = makehgtform('translate',[latitude(i) longitude(i) altitude(i)]);
    UFO1rotation1 = makehgtform('xrotate',(pi/180)*5*bearing(i))^muteExponant;%muted for rising; causes eratic crashing motion
    UFO1rotation2 = makehgtform('yrotate',(pi/180)*tiltFactor*bearing(i));
    UFO1rotation3 = makehgtform('zrotate',(pi/180)*spin*bearing(i));
    
    %second set of transforms from flight path
    UFO2translation = makehgtform('translate',[latitude(i)+muteExponant*20, -longitude(i), altitude(i)]);
    UFO2rotation1 = makehgtform('xrotate',(pi/180)*5*bearing(i))^muteExponant;%muted for rising; causes eratic crashing motion
    UFO2rotation2 = makehgtform('yrotate',-(pi/180)*tiltFactor*bearing(i));
    UFO2rotation3 = makehgtform('zrotate',(pi/180)*spin*bearing(i));
    
    %scales based on frames and direction 
    scaling = makehgtform('scale',(i*4/(frames*3))^(scaleDirection));
    
    %draws each frame
    set(combinedObject1,'matrix', UFO1translation*UFO1rotation1*UFO1rotation2*UFO1rotation3*scaling);
    set(combinedObject2,'matrix', UFO2translation*UFO2rotation1*UFO2rotation2*UFO2rotation3*scaling);
    
    %pause 
    pause(0.0001)
end

end

