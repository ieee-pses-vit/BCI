function varargout = BCI_GUI(varargin)
% BCI_GUI MATLAB code for BCI_GUI.fig
%      BCI_GUI, by itself, creates a new BCI_GUI or raises the existing
%      singleton*.
%
%      H = BCI_GUI returns the handle to a new BCI_GUI or the handle to
%      the existing singleton*.
%
%      BCI_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BCI_GUI.M with the given input arguments.
%
%      BCI_GUI('Property','Value',...) creates a new BCI_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BCI_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BCI_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BCI_GUI

% Last Modified by GUIDE v2.5 18-Feb-2019 12:09:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BCI_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @BCI_GUI_OutputFcn, ...
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


% --- Executes just before BCI_GUI is made visible.
function BCI_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BCI_GUI (see VARARGIN)

% Choose default command line output for BCI_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BCI_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BCI_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

syms ansh;
% --- Executes on button press in select_feature3.
function select_feature3_Callback(hObject, eventdata, handles)
% hObject    handle to select_feature3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[inputFileName,inputPathName]=uigetfile({'*.mat'},'Feature Selector');
fullPathName=strcat(inputPathName,inputFileName);
set(handles.feature_directory3,'String',fullPathName);
setappdata(handles.feature_directory3,'String',fullPathName);  

function feature_directory3_Callback(hObject, eventdata, handles)
% hObject    handle to feature_directory3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of feature_directory3 as text
%        str2double(get(hObject,'String')) returns contents of feature_directory3 as a double


% --- Executes during object creation, after setting all properties.
function feature_directory3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feature_directory3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in lda_button.
function lda_button_Callback(hObject, eventdata, handles)
% hObject    handle to lda_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S1=load('E:\ARYAN\Desktop\BCI\train.mat')
S2=load('E:\ARYAN\Desktop\BCI\test.mat')
z12=S1.training1;
z11=S2.testing1;
for i=1:240
    g(i)=ceil(i/60);
    a=g(:)
end

  [cl,ERR,POSTERIOR,LOGP,COEF]=classify(z11, z12, a);
kk1=0;
 for i=1:15
if(cl(i)==1)
kk1=kk1+1;
end
 end

 kk2=0;
 for i=16:30
if(cl(i)==2)
kk2=kk2+1;
end
 end

 kk3=0;
 for i=31:45
if(cl(i)==3)
kk3=kk3+1;
end
 end

 kk4=0;
 for i=46:60
if(cl(i)==4)
kk4=kk4+1;
end
 end


fprintf('\nthe accuracy of class 1 is %d',(kk1/15)*100);
fprintf('\nthe accuracy of class 2 is %d',(kk2/15)*100);
fprintf('\nthe accuracy of class 3 is %d',(kk3/15)*100);
fprintf('\nthe accuracy of class 4 is %d',(kk4/15)*100);


class=[kk1 kk2 kk3 kk4]

 

set(handles.freq_3,'String',round(kk1,0));
set(handles.freq_7_5,'String',round(kk2,0));
set(handles.freq_10,'String',round(kk3,0));
set(handles.freq_11,'String',round(kk4,0));
mean_acc=max(class)/15*100;
set(handles.mean_accuracy_display,'String',mean_acc);
 



function mean_accuracy_display_Callback(hObject, eventdata, handles)
% hObject    handle to mean_accuracy_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mean_accuracy_display as text
%        str2double(get(hObject,'String')) returns contents of mean_accuracy_display as a double


% --- Executes during object creation, after setting all properties.
function mean_accuracy_display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mean_accuracy_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cca_button.
function cca_button_Callback(hObject, eventdata, handles)
% hObject    handle to cca_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
freq = [3 7.5 10 11];  %put all frequencies
u=1;   %channel no. [1,2,3,4] 1- for 13th channel , 2  - 15 , 3 - 18, 4 - 19 channel.
desired = 7.5; %Desired Frequency (enter 3,7.5 or 10) Say of you are testing for 7.5 then use that.
di=getappdata(handles.data_directory_display3,'String')
X=dlmread(di);  %file name
X = X(1000:15360,:);   
chy = [13 15 18 19];
[~,fidx] = ismember(desired,freq);
out = buffer(X(:,chy(u))',512,256);
q = size(out);
c = 0;
total =0;
disp('Here');
for i = 1:56
    disp('Here');
    x=out(:,i)';
    [~,~,r1]=cca(x,ref(3));
    [~,~,r2]=cca(x,ref(7.5));    
    [~,~,r3]=cca(x,ref(10));
    [~,idx] = max([r1 r2 r3]);
    total = total+1;
    
    if(idx == fidx)
        c=c+1;
    end
end


accuracy = (c/total)*100  %output
set(handles.mean_accuracy_display,'String',accuracy);


% --- Executes on button press in msi_button.
function msi_button_Callback(hObject, eventdata, handles)
% hObject    handle to msi_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S=[];
k=0;
i=1;
% 1) 7.5_con_sq.txt   % 2) 7.5_checker_sq.txt    % 3) 7.5_colvoiche_sq.txt     % 4) 7.5_voi_cir.txt  %  5) 7.5_con_cir.txt
w=3;
X=load(get(handles.data_directory_display3,'String'));
z_act=[];    
z_req=[ones(60,1)*1];  %desired class number 
out = buffer(X(:,19)',512,256);
q = size(out);
while(i<=q(2))
    
    x=out(:,i);
    
    x=x';
    y=ref_msi(7.5);
    S(i,1)=(ind_msi(x,y));
    
    y=ref_msi(11);
    S(i,2)=(ind_msi(x,y));
    
    y=ref_msi(3);
    S(i,3)=(ind_msi(x,y));
    
    y=ref_msi(10);
    S(i,4)=(ind_msi(x,y));
    
   
    i=i+1;
end
i=1;
while(i<61)
%     while(i<141)
    for j=1:4   %loop to find the index number
        if S(i,j)==max(S(i,:))
           %display(j);
            z_act(i)=j;
           
        end
    end
    i=i+1;
end
% toc;
[C,order]=confusionmat(z_req,z_act);
accuracy=(max(C(1,:))/60)*100;
set(handles.mean_accuracy_display,'String',accuracy);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in knn_button.
function knn_button_Callback(hObject, eventdata, handles)
% hObject    handle to knn_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
S=load(get(handles.data_directory_display3,'String'));
z11=S.g1;
z12=S.g2;
for i=1:60
    g(i)=ceil(i/15);
    a=g(:);
end

for i=1:180
    g(i)=ceil(i/45);
    b=g(:);
end
knn=fitcknn(z11,  a,'Numneighbors',1);
y=confusionmat(b,predict(knn,z12))
fprintf('\nthe accuracy of class 1 is %d',(y(1,1)/45)*100);
fprintf('\nthe accuracy of class 2 is %d',(y(2,2)/45)*100);
fprintf('\nthe accuracy of class 3 is %d',( y(3,3)/45)*100);
fprintf('\nthe accuracy of class 4 is %d',(y(4,4)/45)*100);

% --- Executes on button press in cnn_button.
function cnn_button_Callback(hObject, eventdata, handles)
% hObject    handle to cnn_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in runMav_button.
function runMav_button_Callback(hObject, eventdata, handles)
axes(handles.dataPlot)
cla(handles.dataPlot,'reset')
data3=get(handles.radioButton3,'Value')
data7_5=get(handles.radioButton7,'Value')
data10=get(handles.radioButton_10,'Value')
data11=get(handles.radioButton_11,'Value')
if(data3==1)
    data=get(handles.radioButton3,'String')
elseif(data7_5==1)
    data=get(handles.radioButton7,'String')
elseif(data10==1)
    data=get(handles.radioButton_10,'String')
elseif(data11==1)
    data=get(handles.radioButton_11,'String')
else
    fprintf("No Value Selected\n");
end
    
s=load(get(handles.data_directory_display3,'String'));
axis([0 500 -30 30])
hold on 
grid on
plot(s,'r-')
axes(handles.powerSpectralPlot)
cla(handles.powerSpectralPlot,'reset')
periodogram(s)

%FFT
y=s(:,13); 
y=y';
y=y(10291:15462);
Fs=256;
T=1/Fs;
L=length(y);
t=(0:(L-1))*T;
[b,a] = butter(4,[3/256 30/256],'bandpass');
y = filter(b,a,y);
% [b,a] = butter(4,[47/256 53/256],'stop');
% y = filter(b,a,y);
axes(handles.fftPlot)
cla(handles.fftPlot,'reset')
hold on 
grid on
axis([0 5 -10 10]);
plot(t,y); %fft
xlabel('Time(sec)')
ylabel('Amplitude(uV)')

axes(handles.fftPowerSpectralPlot)
cla(handles.fftPowerSpectralPlot,'reset')
hold on
grid on
title('FFT Power Density')
periodogram(y)

a=s(:,13);
b=s(:,14);
c=s(:,15);
d=s(:,16);
e=s(:,18);
f=s(:,19);
g=cat(2,a,b,c,d,e,f);
n=0;
eps=0.002;
max_PCs=1;
L=0;M=1;n=1;Lm=0;
while(L<15300)
     lm=1;
    for i = 1:1:6 
        abs1(i,lm)=0;
        zc(i,lm)=0;
        ssc(i,lm)=0;
        wl(i,lm)=0;
        for j = L+1:1:L+512 
        y1= g(j,i);
        y2=g(j+1,i);
        abs1(i,lm)=abs1(i,lm)+abs(y1);
            if (j==1)
                y3=0;
            else
                y3=g(j-1,i);
            end
            if((y1>0 && y2<0)||(y1<0 && y2>0)&& (abs(y1-y2)>=eps))
        zc(i,lm)=zc(i,lm)+1;  
        end

        if(((y1>y3) && (y1>y2))||((y1<y3)&& (y1<y2))&& (abs(y1-y2)>=eps ||abs(y1-y3)>=eps))
        ssc(i,lm)=ssc(i,lm)+1;
        end
        wl(i,lm)=wl(i,lm)+abs(y1-y3);
        end
        abs1(i,lm)=abs1(i,lm)/512;
    end
        z(M,:)=[abs1; zc; ssc; wl];
M=M+1;
L=L+256;
end
matFile=strcat('check_feature_',data,'.mat')
save(matFile,'z');  

function select_data3_Callback(hObject, eventdata, handles)
[inputFileName,inputPathName]=uigetfile({'*.txt'},'Data Selector');
fullPathName=strcat(inputPathName,inputFileName);
set(handles.data_directory_display3,'String',fullPathName);
setappdata(handles.data_directory_display3,'String',fullPathName);  



function data_directory_display3_Callback(hObject, eventdata, handles)

function data_directory_display3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radioButton3_Callback(hObject, eventdata, handles)

function radiobutton3_Callback(hObject, eventdata, handles)

function radioButton7_Callback(hObject, eventdata, handles)

function radioButton_10_Callback(hObject, eventdata, handles)

function radioButton_11_Callback(hObject, eventdata, handles)

function select_data7_5_Callback(hObject, eventdata, handles)
[inputFileName,inputPathName]=uigetfile({'*.txt'},'Data Selector');
fullPathName=strcat(inputPathName,inputFileName);
set(handles.data_directory_display7_5,'String',fullPathName);
setappdata(handles.data_directory_display7_5,'String',fullPathName);

% --- Executes on button press in select_data_10.
function select_data_10_Callback(hObject, eventdata, handles)

[inputFileName,inputPathName]=uigetfile({'*.txt'},'Data Selector');
fullPathName=strcat(inputPathName,inputFileName);
set(handles.data_directory_display10,'String',fullPathName);
setappdata(handles.data_directory_display10,'String',fullPathName);

function select_data_11_Callback(hObject, eventdata, handles)

[inputFileName,inputPathName]=uigetfile({'*.txt'},'Data Selector');
fullPathName=strcat(inputPathName,inputFileName);
set(handles.data_directory_display11,'String',fullPathName);
setappdata(handles.data_directory_display11,'String',fullPathName);


function data_directory_display7_5_Callback(hObject, eventdata, handles)

function data_directory_display7_5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function data_directory_display10_Callback(hObject, eventdata, handles)

function data_directory_display10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function data_directory_display11_Callback(hObject, eventdata, handles)

function data_directory_display11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function select_feature7_5_Callback(hObject, eventdata, handles)

function feature_directory7_5_Callback(hObject, eventdata, handles)

function feature_directory7_5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function feature_directory10_Callback(hObject, eventdata, handles)
function feature_directory10_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function feature_directory11_Callback(hObject, eventdata, handles)
% hObject    handle to feature_directory11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of feature_directory11 as text
%        str2double(get(hObject,'String')) returns contents of feature_directory11 as a double


% --- Executes during object creation, after setting all properties.
function feature_directory11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to feature_directory11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in select_feature10.
function select_feature10_Callback(hObject, eventdata, handles)
% hObject    handle to select_feature10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in select_feature11.
function select_feature11_Callback(hObject, eventdata, handles)
% hObject    handle to select_feature11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function freq_3_Callback(hObject, eventdata, handles)
% hObject    handle to freq_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_3 as text
%        str2double(get(hObject,'String')) returns contents of freq_3 as a double


% --- Executes during object creation, after setting all properties.
function freq_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_7_5_Callback(hObject, eventdata, handles)
% hObject    handle to freq_7_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_7_5 as text
%        str2double(get(hObject,'String')) returns contents of freq_7_5 as a double


% --- Executes during object creation, after setting all properties.
function freq_7_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_7_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_10_Callback(hObject, eventdata, handles)
% hObject    handle to freq_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_10 as text
%        str2double(get(hObject,'String')) returns contents of freq_10 as a double


% --- Executes during object creation, after setting all properties.
function freq_10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_11_Callback(hObject, eventdata, handles)
% hObject    handle to freq_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_11 as text
%        str2double(get(hObject,'String')) returns contents of freq_11 as a double


% --- Executes during object creation, after setting all properties.
function freq_11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in trainTestButton.
function trainTestButton_Callback(hObject, eventdata, handles)
% hObject    handle to trainTestButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
z3=load('E:\ARYAN\Desktop\BCI\check_feature_3.mat');
z7_5=load('E:\ARYAN\Desktop\BCI\check_feature_7.5.mat');
z10=load('E:\ARYAN\Desktop\BCI\check_feature_10.mat');
z11=load('E:\ARYAN\Desktop\BCI\check_feature_11.mat');

[inputFileName,inputPathName]=uigetfile({'*.txt'},'Select the file to be tested');
fullPathName=strcat(inputPathName,inputFileName);
setappdata(handles.trainTestButton,'String',fullPathName);
s=load(fullPathName);
a=s(:,13);
b=s(:,14);
c=s(:,15);
d=s(:,16);
e=s(:,18);
f=s(:,19);
g=cat(2,a,b,c,d,e,f);
n=0;
eps=0.002;
max_PCs=1;
L=0;M=1;n=1;Lm=0;
while(L<15300)
     lm=1;
    for i = 1:1:6 
        abs1(i,lm)=0;
        zc(i,lm)=0;
        ssc(i,lm)=0;
        wl(i,lm)=0;
        for j = L+1:1:L+512 
        y1= g(j,i);
        y2=g(j+1,i);
        abs1(i,lm)=abs1(i,lm)+abs(y1);
            if (j==1)
                y3=0;
            else
                y3=g(j-1,i);
            end
            if((y1>0 && y2<0)||(y1<0 && y2>0)&& (abs(y1-y2)>=eps))
        zc(i,lm)=zc(i,lm)+1;  
        end

        if(((y1>y3) && (y1>y2))||((y1<y3)&& (y1<y2))&& (abs(y1-y2)>=eps ||abs(y1-y3)>=eps))
        ssc(i,lm)=ssc(i,lm)+1;
        end
        wl(i,lm)=wl(i,lm)+abs(y1-y3);
        end
        abs1(i,lm)=abs1(i,lm)/512;
    end
        z(M,:)=[abs1; zc; ssc; wl];
M=M+1;
L=L+256;
end
matFile=strcat('testing_feature','.mat')
save(matFile,'z');
x=load('testing_feature.mat');
training1=[z3.z;z7_5.z;z10.z;z11.z];
testing1=[x.z];
save('train','training1');
save('test','testing1');


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
