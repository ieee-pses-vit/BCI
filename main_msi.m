clc;
clear all;
S=[];
k=0;
i=1;

% 1) 7.5_con_sq.txt   % 2) 7.5_checker_sq.txt    % 3) 7.5_colvoiche_sq.txt     % 4) 7.5_voi_cir.txt  %  5) 7.5_con_cir.txt
w=3;
X=dlmread('E:\ARYAN\Desktop\BCI\checkr_3.txt');
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
accuracy=(max(C(1,:))/60)*100


% end