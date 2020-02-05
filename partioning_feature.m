% z3=load('E:\ARYAN\Desktop\BCI\check_feature_3.mat');
% z7_5=load('E:\ARYAN\Desktop\BCI\check_feature_7.5.mat');
% z10=load('E:\ARYAN\Desktop\BCI\check_feature_10.mat');
% z11=load('E:\ARYAN\Desktop\BCI\check_feature_11.mat');
% 
% training1=[z3.z;z7_5.z;z10.z;z11.z];
% testing1=[z10.z];
% save('train','training1');
% save('test','testing1');
clc
clear all
z3=load('E:\ARYAN\Desktop\BCI\check_feature_3.mat');
z7_5=load('E:\ARYAN\Desktop\BCI\check_feature_7.5.mat');
z10=load('E:\ARYAN\Desktop\BCI\check_feature_10.mat');
z11=load('E:\ARYAN\Desktop\BCI\check_feature_11.mat');

%     [inputFileName,inputPathName]=uigetfile({'*.txt'},'Data Selector');
%     fullPathName=strcat(inputPathName,inputFileName);

    %setappdata(handles.trainTestButton,'String',fullPathName);
%         x=load(fullPathName)
training1=[z3.z;z7_5.z;z10.z;z11.z];
testing1=[z3.z];
save('train','training1');
save('test','testing1');