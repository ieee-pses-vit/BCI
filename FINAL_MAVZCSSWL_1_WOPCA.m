clc
clear all
s=load( 'E:\ARYAN\Desktop\BCI\checkr_7.5.txt');
a=s(:,13);
b=s(:,14);
c=s(:,15);
d=s(:,16);
e=s(:,18);
f=s(:,19);
g=cat(2,a,b,c,d,e,f)
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
hold on
histogram(abs1,'FaceColor','red');
hold on
histogram(zc,'FaceColor','blue');
hold on
histogram(ssc,'FaceColor','yellow');
hold on
histogram(wl,'FaceColor','green');


