% besov(pic) where pic is a string containing the picture name
% This function takes in an image, computes the 5 level wavelet decomposition 
% using the haar wavelet basis, and then calculates and returns the besov norm 
% with p=1 of the wavelet coefficients. 

function normish=besov(pic);
%Read in picture and convert it to grayscale of class double
  picfile=imread(pic);
  picgray=im2double(rgb2gray(picfile));

%Normalize picture with L2 norm
  picgray=picgray./normmat(picgray);
  
%Compute the 5 level DWT2 on the normalized picture
  [AA,H,V,D]=dwt2(picgray,'haar');
  [A1,H1,V1,D1]=dwt2(AA,'haar');
  [A2,H2,V2,D2]=dwt2(A1,'haar');
  [A3,H3,V3,D3]=dwt2(A2,'haar');
  [A4,H4,V4,D4]=dwt2(A3,'haar');

%Sum up the absolute value of the coefficients for each level 
  sum1=(sum(sum(abs(H)))+sum(sum(abs(V)))+sum(sum(abs(D))))*16;
  sum2=(sum(sum(abs(H1)))+sum(sum(abs(V1)))+sum(sum(abs(D1))))*8;
  sum3=(sum(sum(abs(H2)))+sum(sum(abs(V2)))+sum(sum(abs(D2))))*4;
  sum4=(sum(sum(abs(H3)))+sum(sum(abs(V3)))+sum(sum(abs(D3))))*2;
  sum5=(sum(sum(abs(H4)))+sum(sum(abs(V4)))+sum(sum(abs(D4))))*1;  

%Calculate L1 norm of the approximation coefficients of the 5th level 
  L1norm=sum(sum(abs(A4)));

%Sum up the the coefficients, add the L1norm, and return the answer
  normish=(sum1+sum2+sum3+sum4+sum5+L1norm);





