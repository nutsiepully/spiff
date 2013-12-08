%normmat(mat), where mat is an MxN matrix
%Function calculates and returns the L2 norm of a matrix
function norm=normmat(mat);

[row col]=size(mat);
sumNum=0;
%Loop through each of the elements and sum up the square of the absolute value
  for i=1:row
    for j=1:col
     sumNum=sumNum+abs(mat(i,j)).^2;  
    end
  end
%Return the square root of the sum
  norm =sqrt(sumNum);