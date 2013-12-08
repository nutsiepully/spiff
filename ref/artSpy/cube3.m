%Script for generating three dimensional color cube spaces.  Creates cube for
%RGB space, HSV space, and NTSC space for values of 0 to 1 with a stepsize of
%.1 for all coefficient color factors

%Does for all 3 cubes
for cube = 1:3
   
   figure
   clf
   hold on
   
   
   %Does for all values on x-axis
   for x = 0:.1:1
      x
      %Sets up x-axis fill vector
      a = x+.1;
      xvec = [x x a a x x a a x x x x x x x a a x x a a x x a a a a a a x x];
      
      %Does for all values on y-axis
      for y = 0:.1:1
         %Sets up y-axis fill vector
         b = y+.1;
         yvec = [y b b y y y y y y b b y y b b b b b b b y y b b b y y b b b y];
         
         %Does for all values on z-axis
         for z = 0:.1:1
            %Sets up z-axis fill vector
            c = z+.1;
            zvec = [z z z z z c c z z z c c z z c c z z c c c c c c z z c c z z z];
            
            %Draws ploygon for RGB cube
            if cube == 1
               patch(xvec,yvec,zvec,[x y z])
            %Draws polygon for HSV cube
            elseif cube == 2
               patch(xvec,yvec,zvec,hsv2rgb([x y z]))
            %Draws polygon for NTSC cube
            else
               patch(xvec,yvec,zvec,ntsc2rgb([x y z]))
            end
            
            
            
         end
      end
   end
   
   axis tight
   
   %Labels axes of cubes
   if cube ==1
      title('RGB')
      xlabel('Red')
      ylabel('Green')
      zlabel('Blue')
   elseif cube == 2
      title('HSV')
      xlabel('Hue')
      ylabel('Saturation')
      zlabel('Color Value')
   else
      title('NTSC')
      xlabel('Y (luminance)')
      ylabel('I (chrominance)')
      zlabel('Q (chrominance)')
   end
   
end

   
   