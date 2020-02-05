clc;
clear all;
freq = [3 7.5 10 11];  %put all frequencies
u=1;   %channel no. [1,2,3,4] 1- for 13th channel , 2  - 15 , 3 - 18, 4 - 19 channel.
desired = 10; %Desired Frequency (enter 3,7.5 or 10) Say of you are testing for 7.5 then use that.
X=dlmread('checkr_10.txt');  %file name
X = X(1000:15360,:);   
chy = [13 15 18 19];
[~,fidx] = ismember(desired,freq);
out = buffer(X(:,chy(u))',512,256);
q = size(out);
c = 0;
total =0;

for i = 1:56
    disp('Here')
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

