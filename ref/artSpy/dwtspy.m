%dwtspy(pic) where pic is a string containing the picture name
%Takes in an image and returns whether or not the image is a Picasso
%This is done by calculating the besov norm and checking it against the set 
%threshold. Function returns a string indication Picasso or Unknown. 

function [artist]=dwtspy(pic);
%Calculate the besov norm of the picture
val=besov(pic);

%If besov norm falls within the Picasso range return artist=picasso
if (val>=300) & (val<=500)
  artist='Picasso';
  
else
  artist='Unknown';

end


