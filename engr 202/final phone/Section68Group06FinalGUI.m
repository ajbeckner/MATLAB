function varargout = Section68Group06FinalGUI(varargin)
% SECTION68GROUP06FINALGUI MATLAB code for Section68Group06FinalGUI.fig
%      SECTION68GROUP06FINALGUI, by itself, creates a new SECTION68GROUP06FINALGUI or raises the existing
%      singleton*.
%
%      H = SECTION68GROUP06FINALGUI returns the handle to a new SECTION68GROUP06FINALGUI or the handle to
%      the existing singleton*.
%
%      SECTION68GROUP06FINALGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECTION68GROUP06FINALGUI.M with the given input arguments.
%
%      SECTION68GROUP06FINALGUI('Property','Value',...) creates a new SECTION68GROUP06FINALGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Section68Group06FinalGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Section68Group06FinalGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Section68Group06FinalGUI

% Last Modified by GUIDE v2.5 27-Aug-2015 12:06:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Section68Group06FinalGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Section68Group06FinalGUI_OutputFcn, ...
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


% --- Executes just before Section68Group06FinalGUI is made visible.
function Section68Group06FinalGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Section68Group06FinalGUI (see VARARGIN)

% Choose default command line output for Section68Group06FinalGUI
handles.output = hObject;

set(handles.axes1);
axis([-25 300 -25 50 -25 50]);
view(3);
grid off;
axis off;
axis equal;
whitebg('g');
hold on
shg

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Section68Group06FinalGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Section68Group06FinalGUI_OutputFcn(hObject, eventdata, handles) 
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

[v,angle] = getargs();
set(handles.axes1);
cla
 
%makes space look nice

animation(v,angle,handles.axes1);
