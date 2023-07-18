clc;    
close all;  
workspace;  
format long g;
format compact;
fontSize = 25;
fullFileName=imgetfile();
rgbImage = imread(fullFileName);
[rows, columns, numberOfColorChannels] = size(rgbImage);
figure(1)
subplot(2, 2, 1);
imshow(rgbImage, []);
axis on;
caption = sprintf('Original Color Image %s',fullFileName);
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]);
set(gcf, 'Name', 'Project', 'NumberTitle', 'Off')
drawnow;
hp = impixelinfo();
[rows, columns, numberOfColorChannels] = size(rgbImage)
if numberOfColorChannels > 1

  grayImage = rgbImage(:, :, 1);
end

subplot(2, 2, 2);
imshow(grayImage, []);
axis on;
caption = sprintf('Gray Image');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
hp = impixelinfo();
drawnow;
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
set(gcf, 'Toolbar', 'none', 'Menu', 'none');
set(gcf, 'Name', 'Project', 'NumberTitle', 'Off')
binaryImage = grayImage > 210;
subplot(2, 2, 3);
imshow(binaryImage);
title('Binary Image', 'FontSize', fontSize, 'Interpreter', 'None');
axis on;
verticalProfile = mean(grayImage, 2);
subplot(2, 2, 4);
plot(verticalProfile);
title('Vertical Profile', 'FontSize', fontSize, 'Interpreter', 'None');
whiteGaps = verticalProfile > 250;
measurements = regionprops(whiteGaps, 'Centroid');
allCentroids = [measurements.Centroid];
centroidX = allCentroids(1:2:end);
centroidY = allCentroids(2:2:end);
binaryImage = grayImage < 125;
  figure(2)
for k = 1 : length(centroidY)-1
	line1 = int32(centroidY(k));
	line2 = int32(centroidY(k+1));
	thisLine = binaryImage(line1:line2, :);
	subplot(5,4,k);
  
	imshow(thisLine);
	caption = sprintf('Line %d', k);
	title(caption, 'FontSize', fontSize);
end




