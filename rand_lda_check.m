clc;
clear all;
S1=load('E:\ARYAN\Desktop\BCI\train.mat')
S2=load('E:\ARYAN\Desktop\BCI\test.mat')
z12=S1.training1;
z11=S2.testing1;
for i=1:240
    g(i)=ceil(i/60);
    a=g(:);
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
accuracy=max(class)/15*100
 
