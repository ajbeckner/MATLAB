function varargout = Section68Group06Biweekly4GUI(varargin)
%Section 68 Group 06 AJ Beckner, Megan Begley, Corey Klawunn
% SECTION68GROUP06BIWEEKLY4GUI MATLAB code for Section68Group06Biweekly4GUI.fig
%      SECTION68GROUP06BIWEEKLY4GUI, by itself, creates a new SECTION68GROUP06BIWEEKLY4GUI or raises the existing
%      singleton*.
%
%      H = SECTION68GROUP06BIWEEKLY4GUI returns the handle to a new SECTION68GROUP06BIWEEKLY4GUI or the handle to
%      the existing singleton*.
%
%      SECTION68GROUP06BIWEEKLY4GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECTION68GROUP06BIWEEKLY4GUI.M with the given input arguments.
%
%      SECTION68GROUP06BIWEEKLY4GUI('Property','Value',...) creates a new SECTION68GROUP06BIWEEKLY4GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Section68Group06Biweekly4GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Section68Group06Biweekly4GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Section68Group06Biweekly4GUI

% Last Modified by GUIDE v2.5 13-Aug-2015 16:57:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Section68Group06Biweekly4GUI_OpeningFcn, ...
    'gui_OutputFcn',  @Section68Group06Biweekly4GUI_OutputFcn, ...
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


% --- Executes just before Section68Group06Biweekly4GUI is made visible.
function Section68Group06Biweekly4GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Section68Group06Biweekly4GUI (see VARARGIN)

% Choose default command line output for Section68Group06Biweekly4GUI
handles.output = hObject;

comPort='/dev/tty.usbmodem1421';
[accelerometer.s,flag]=setupSerial(comPort);
calCo=calibrate(accelerometer.s);

%initialize correct values in filestorage
saveVal('hist','false')
saveVal('mean','false')
saveVal('std','false')
saveVal('var','false')
saveVal('outliers','false')
saveVal('velocity','false')
saveVal('loop','true');

%set buffer and initialize arrays, counters
buffer = 200;
tnow=0;
vxnow=0;
t = zeros(1,buffer);
vx = zeros(1,buffer);
GX = rand(1,buffer);
% start timerfor veloc calc
tic 
%   
while(true)
%     %read from accel; NOTE: we are only looking at the x values
%     [gx, gy, gz]=readAcc(accelerometer,calCo) ; % Read data from accelerometer
%     gx = floor(gx*10)/10;
%     %update rolling plot of acceleration
%     GX = [GX(2:end) gx];
%     
%     % get time, change in time, height/area, and update rolling plots
%     tnow=toc; 
%     delta_t=tnow-t(end); % width of trapazoid
%     avg_height=(gx+GX(end))/2; % average height of trapazoid
%     area_trap=delta_t*avg_height; % area of trapazoid
%     vxnow=vx(end)+area_trap; % add area to previous area
%     t=[t(2:end) tnow]; % rolling time vector
%     vx=[vx(2:end) vxnow]; % rolling velocity vector
%     
%     %calculate descriptive statistics
%     AVG = gx;
%     %AVG = mean(GX);
%     VAR = var(GX);
%     STD = std(GX);
%     outlier = length(GX(GX>(AVG+2*STD)))+length(GX(GX<(AVG-2*STD)));
%     
    %prepare refresh regardless of conditions (so that we dont get a still
    %graph)
    cla
    
    %brings GUI to Front
    axes(handles.axes1)
%     
%     %plot hist and set axes properties only when condition is selected
%     if (strcmp(getVal('hist'),'true'))
%         axes(handles.axes1)
%         histogram(GX, 20); 
%         title('Histogram of Readings');
%         xlabel('bins');
%         ylabel('frequency');
%         drawnow
%     end
%     
%     %show average when condition is selected
%     if (strcmp(getVal('mean'),'true'))
%         set(handles.meanDisplayText,'string',AVG);
%     end
%     
%     %show standard deviation when condition is selected
%     if (strcmp(getVal('std'),'true'))
%         set(handles.stdDisplayText,'string',STD);
%     end
%     
%     %show variance when condition is selected
%     if (strcmp(getVal('var'),'true'))
%         set(handles.varDisplayText,'string',VAR);
%     end
%     
%     %show outliers when condition is selected
%     if (strcmp(getVal('outliers'),'true'))
%         set(handles.outlierDisplayText,'string',outlier);
%     end
%     
%     %plot velocity graph and update axes properties when condition is selected
%     if (strcmp(getVal('velocity'),'true'))
%         axes(handles.axes2);
%         plot(t,vx)
%         title('Speed of accelerometer');
%         xlabel('velocity');
%         ylabel('time');
%         drawnow     
%     end
%     
%     %redraw
    drawnow
%     
%     %stop loops (triggered by deletefunction for safety)
%     if(strcmp(getVal('loop'),'false'))
%         break
%     end
end
% % Update handles structure
% guidata(hObject, handles);

% UIWAIT makes Section68Group06Biweekly4GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Section68Group06Biweekly4GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

%varargout{1} = handles.output;


% --- Executes on button press in histStartButton.
function histStartButton_Callback(hObject, eventdata, handles)
% hObject    handle to histStartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%change hist value when hit
if(strcmp(getVal('hist'),'false'))
    saveVal('hist','true')
elseif(strcmp(getVal('hist'),'true'))
    saveVal('hist','false')
end


% --- Executes on button press in toggleOutliersButton.
function toggleOutliersButton_Callback(hObject, eventdata, handles)
% hObject    handle to toggleOutliersButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%change outliers value when hit
if(strcmp(getVal('outliers'),'false'))
    saveVal('outliers','true')
elseif(strcmp(getVal('outliers'),'true'))
    saveVal('outliers','false')
    set(handles.outlierDisplayText,'string','N/A');
end


% --- Executes on button press in toggleMeanButton.
function toggleMeanButton_Callback(hObject, eventdata, handles)
% hObject    handle to toggleMeanButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%change avg value when hit
if(strcmp(getVal('mean'),'false'))
    saveVal('mean','true')
elseif(strcmp(getVal('mean'),'true'))
    saveVal('mean','false')
    set(handles.meanDisplayText,'string','N/A');
end


% --- Executes on button press in toggleStdButton.
function toggleStdButton_Callback(hObject, eventdata, handles)
% hObject    handle to toggleStdButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%change std value when hit
if(strcmp(getVal('std'),'false'))
    saveVal('std','true')
elseif(strcmp(getVal('std'),'true'))
    saveVal('std','false')
    set(handles.stdDisplayText,'string','N/A');
end


% --- Executes on button press in toggleVarButton.
function toggleVarButton_Callback(hObject, eventdata, handles)
% hObject    handle to toggleVarButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%change variance value when hit
if(strcmp(getVal('var'),'false'))
    saveVal('var','true')
elseif(strcmp(getVal('var'),'true'))
    saveVal('var','false')
    set(handles.varDisplayText,'string','N/A');
end


% --- Executes on button press in vStartButton.
function vStartButton_Callback(hObject, eventdata, handles)
% hObject    handle to vStartButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%change v value when hit
if(strcmp(getVal('velocity'),'false'))
    saveVal('velocity','true')
elseif(strcmp(getVal('velocity'),'true'))
    saveVal('velocity','false')
end



% --- Executes during object deletion, before destroying properties.
function figure1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%safely stop graphing before serial is closed and clear is called
saveVal('loop','false');
closeSerial;
