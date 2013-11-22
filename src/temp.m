
% Plot frequencies for one pixel (R,G,B)
%
hold on
plot(filterResponses(100, 1:33), 'r')
plot(filterResponses(100, 34:66), 'g')
plot(filterResponses(100, 67:99), 'b')
hold off
