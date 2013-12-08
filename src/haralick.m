% Haralick Texture Features Matlab Toolbox v0.1b
%
% [SGLD,energy,correlation,inertia,entropy,inverse_diff,sum_avg,sum_var,...
% sum_entropy,diff_avg,diff_var,diff_entropy,info_corr_1,info_corr_2]=...
% Haralick(image,input_bits,output_bits,d,theta)
%
% This function generates a Spatial Grey Level Dependence Matrix (SGLD) of 
% a grey scale image and calcuates 13 Haralick's texture features from it.
%
% The Haralick's texture features calculated are:
% 1) Energy
% 2) Correlation
% 3) Inertia
% 4) Entropy
% 5) Inverse Difference Moment
% 6) Sum Average
% 7) Sum Variance
% 8) Sum Entropy
% 9) Difference Average
% 10) Difference Variance
% 11) Difference Entropy
% 12) Infomation measure of correlation 1
% 13) Information measure of correlation 2
%
% The inputs to the function are 
% a) image: the input grey scale image
%
% b) input_bits: the grey level resolution of the input image, 
%                eg. for a 265 grey level image input_bits=8
%
% c) output_bits: the grey level resolution of the SGLD matrix, 
%                 eg. for an output_bits=0, the SGLD matrix will be at a 
%                 resolution of input_bits 
%                 eg. for a output_bits=1, the SGLD matrix will be at a 
%                 resolution of input_bits-1 etc.
%
% d) d: the distance between pixels for calculating the SGLD matrix, it can
%       take values between 0 and the min(size(image))-1
%
% e) theta: the anlge at which the SGLD matrix is calculated, 
%           can take on values of 0 or 45 or 90 or 135 degrees
%
% Note: a pair of pixels is counted for both the forward and the 
%       backward directions for calculating the SGLD matrix.
%
% The outputs of the function are:
% a) SGLD: the SGLD matrix
% b) energy,correlation,inertia,entropy,inverse_diff,sum_avg,sum_var,
%    sum_entropy,diff_avg,diff_var,diff_entropy,info_corr_1,info_corr_2: 
%    the 13 texture features
% 
% Example:
% 
%       a=floor(4*rand(20,20));
%       [SGLD,energy,correlation,inertia,entropy,inverse_diff,sum_avg,...
%       sum_var,sum_entropy,diff_avg,diff_var,diff_entropy,info_corr_1,...
%       info_corr_2]=Haralick(a,2,0,1,0);
% 
% This returns the SGLD matrix along with the thirteen texture features for 
% the matrix 'a' which is at a resolution of the 'input_bits' = 2
% (4 grey level values), the output_bits =0, so the SGLD will be for 
% 2^(input_bits-0) grey levels. The distance 'd' is 1 pixel and the angle
% is 0 degrees. 
 

%**************************************************************************   
% Haralick Texture Features Matlab Toolbox VERSION 0.1b
% This toolbox was created in Dr. Mia K. Markey's Biomedical informatics 
% laboratory at the Univeristy of Texas at Austin,
% by Shalini Gupta email:shalinig@ece.utexas.edu on 09/02/2005.
% website www.bme.utexas.edu/reasearch/informatics
%**************************************************************************

function F = Haralick(image,input_bits,output_bits,d,theta)


% ***************************
% Calculating the SGLD matrix
% ***************************

% getting the size of the input image
im_final=floor(double(image)/(2^output_bits));
[im_final_x im_final_y]=size(im_final);

% setting the size of the co-occurence matrices depending on the grey level depth
CO_size=2^input_bits/(2^output_bits);
SGLD=zeros(CO_size,CO_size);
      
      
switch theta
   case {0}
     for i=1:im_final_x
       for j=1:(im_final_y-d)
          SGLD(im_final(i,j)+1,im_final(i,j+d)+1)=SGLD(im_final(i,j)+1,im_final(i,j+d)+1)+1;
       end
     end
     
   case {45}
      for i=(1+d):im_final_x
        for j=1:(im_final_y-d)
          SGLD(im_final(i,j)+1,im_final(i-d,j+d)+1)=SGLD(im_final(i,j)+1,im_final(i-d,j+d)+1)+1;
        end
      end

   case {90}
      for i=(1+d):im_final_x
        for j=1:im_final_y
          SGLD(im_final(i,j)+1,im_final(i-d,j)+1)=SGLD(im_final(i,j)+1,im_final(i-d,j)+1)+1;
        end
      end

   case {135}
      for i=(1+d):im_final_x
        for j=(1+d):im_final_y
          SGLD(im_final(i,j)+1,im_final(i-d,j-d)+1)=SGLD(im_final(i,j)+1,im_final(i-d,j-d)+1)+1;
        end
      end
end
   
% make the SGLD matrix symmetric by adding it's transpose to it
SGLD=SGLD+SGLD';

% normalize the SGLD matrix to values between 0 and 1
SGLD=SGLD/sum(sum(SGLD));    
    

% *****************************************************
% Calculating the texture features from the SGLD matrix
% *****************************************************

foo=SGLD;

% Entropy 
entropy=sum(sum(-((full(spfun(@log2,foo))).*foo)));

% Energy:
energy=sum(sum(foo.*foo));

% Inertia:
[i,j,v]=find(foo);
inertia=sum((((i-1)-(j-1)).*((i-1)-(j-1))).*v);

% Inverse differnece moment:
inverse_diff=sum((1./(1+(((i-1)-(j-1)).*((i-1)-(j-1))))).*v);

% Correlation:
[m,n]=size(foo);

px=sum(foo,2);
[i,j,v]=find(px);
mu_x=sum((i-1).*v);
sigma_x=sum((((i-1)-mu_x).^2).*v);
h_x=sum(sum(-((full(spfun(@log2,px))).*px)));
temp1=repmat(px,[1 m]);

py=sum(foo,1);
[i,j,v]=find(py);
mu_y=sum((j-1).*v);
sigma_y=sum((((j-1)-mu_y).^2).*v);
h_y=sum(sum(-((full(spfun(@log2,py))).*py)));
temp2=repmat(py,[n 1]);


[i,j,v]=find(foo);
correlation=(sum(((i-1)-mu_x).*((j-1)-mu_y).*v))/sqrt(sigma_x*sigma_y);

% Information measures of correlation 1 and 2:
foo1=-(foo.*(((temp1.*temp2)==0)-1));
foo2=-((temp1.*temp2).*((foo1==0)-1));
[i1,j1,v1]=find(foo1);
[i2,j2,v2]=find(foo2);
h1=sum((sum(-(v1.*(log2(v2))))));
info_corr_1=(entropy-h1)/max(h_x,h_y);
[i,j,v]=find(temp1.*temp2);
h2=sum((sum(-(v.*(log2(v))))));
info_corr_2=sqrt((1-exp(-2*(h2-entropy))));

% Sum average, variance and entropy:
[i,j,v]=find(foo);
k=i+j-1;
pk_sum=zeros(max(k),1);
for l=min(k):max(k)
  pk_sum(l)=sum(v(find(k==l)));
end

[i,j,v]=find(pk_sum);
sum_avg=sum((i-1).*v);
sum_var=sum((((i-1)-sum_avg).^2).*v);
sum_entropy=sum(-((full(spfun(@log2,pk_sum))).*pk_sum));
 
% Difference average, variance and entropy:
[i,j,v]=find(foo);
k=abs(i-j);
pk_diff=zeros(max(k)+1,1);
for l=min(k):max(k)
   pk_diff(l+1)=sum(v(find(k==l)));
end

[i,j,v]=find(pk_diff);
diff_avg=sum((i-1).*v);
diff_var=sum((((i-1)-diff_avg).^2).*v);
diff_entropy=sum(-((full(spfun(@log2,pk_diff))).*pk_diff));    

%**************************************************************************
F= [energy,correlation,inertia,entropy,inverse_diff,sum_avg,...
    sum_var,sum_entropy,diff_avg,diff_var,diff_entropy,info_corr_1,...
    info_corr_2];
    