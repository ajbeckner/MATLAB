function varargout = Section68Group06Biweekly2GUI(varargin)
% SECTION68GROUP06BIWEEKLY2GUI MATLAB code for Section68Group06Biweekly2GUI.fig
%      SECTION68GROUP06BIWEEKLY2GUI, by itself, creates a new SECTION68GROUP06BIWEEKLY2GUI or raises the existing
%      singleton*.
%
%      H = SECTION68GROUP06BIWEEKLY2GUI returns the handle to a new SECTION68GROUP06BIWEEKLY2GUI or the handle to
%      the existing singleton*.
%
%      SECTION68GROUP06BIWEEKLY2GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECTION68GROUP06BIWEEKLY2GUI.M with the given input arguments.
%
%      SECTION68GROUP06BIWEEKLY2GUI('Property','Value',...) creates a new SECTION68GROUP06BIWEEKLY2GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Section68Group06Biweekly2GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Section68Group06Biweekly2GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Section68Group06Biweekly2GUI

% Last Modified by GUIDE v2.5 15-Jul-2015 15:41:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Section68Group06Biweekly2GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Section68Group06Biweekly2GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Section68Group06Biweekly2GUI is made visible.
function Section68Group06Biweekly2GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Section68Group06Biweekly2GUI (see VARARGIN)

% Choose default command line output for Section68Group06Biweekly2GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Section68Group06Biweekly2GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Section68Group06Biweekly2GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%button sets up accelerometer and starts sampling accelerometer data for
%two plots, plotted in a while loop with break condition

% this if statement makes the serial por reusable from previous trial
% closeSerial does not work because call to "close all" destroys GUI
if ~isempty(instrfind)
    fclose(instrfind);
    delete(instrfind);
end

%code for accelrometer set up for sampling data
comPort='/dev/tty.usbmodem1421';
[accelerometer.s,flag]=setupSerial(comPort);
calCo=calibrate(accelerometer.s);

%% section specifies axes and plots initial rolling plot data initialized as
% random for smoother plot
axes(handles.axes1);
hold on
%random initial data; 3 component 1 composite dataset
GX = rand(1,50);
GY = rand(1,50);
GZ = rand(1,50);
GT = sqrt(GX.^2 + GY.^2 + GZ.^2);

%plots random initialized datasets
plot(GX,'r');
plot(GY,'g');
plot(GZ,'b');
plot(GT,'k');

%calls function to write to file storage
conditionWrite('condition.txt','1');

%% while loop samples accelerometer data and uses it to create two plots;
%  has break condition based on file storage reading to allow for separate
%  start/stop buttons
while(true)
    
    %specifies axes for first plot
    axes(handles.axes1);
    title('Complete magnitude representation')
    ylabel('Magnitude')
    
    %starts sampling accelerometer data
    [gx, gy, gz]=readAcc(accelerometer,calCo);
    cla%slow way of replotting
    
    %sets hold on and plots set of data
    hold on
    plot(GX,'r');
    plot(GY,'g');
    plot(GZ,'b');
    plot(GT,'k');
    
    %shift datasets by one, adding new sampled data
    GX = [GX(2:end) gx];
    GY = [GY(2:end) gy];
    GZ = [GZ(2:end) gz];
    GT = sqrt(GX.^2 + GY.^2 + GZ.^2);
    
    %specifies second set of axes and plots cursor with marker from plot
    %function
    axes(handles.axes2);
    title('cursor')
    xlabel('x position')
    ylabel('y position')
    plot(gx,gy,'ob')
    %sets axes for better animation
    axis([-1.5 1.5 -1.5 1.5]);

    %forces redraw for smooth animation
    drawnow
    
    %% break condition - when file reads back 0 break loop; conditionRead 
    %  is function thatreads from file storage
    if ~str2num(conditionRead('condition.txt'))
        break
    end
    
end
%necessary to redraw frame after break 
drawnow

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%writes '0' to file to trigger loop break in button1
conditionWrite('condition.txt','0');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%writes '0' to file to trigger loop break in button1
conditionWrite('condition.txt','0');
%closes serial safely also closing plot due to close all statement
closeSerial
