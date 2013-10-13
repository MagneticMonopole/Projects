clear all
close all
clc

% matrix = [0 0 1 2 3; 0 0 1 2 3; 0 0 1 2 3];
% for x = 1 : 3
%     while true
%         if matrix(:, 1) == zeros(size(matrix, 1), 1) & matrix(:, 1) == zeros(size(matrix, 1), 1)
%             matrix(:, 1) = [];
%         else
%             break;
%         end
%     end
%     disp(matrix)
% end

x = -5:0.01:5;
y = 4*x.^3 - x.^4;
plot(x,y)
grid on
ylim([-50 50]);