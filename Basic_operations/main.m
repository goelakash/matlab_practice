m = 400;

% Create dotted pattern image
dotted = dots(m,m,0.1);

line = [50,50,170,170];
rect = [ 80,250,100,100];
circle = [280,120,70];
poly = [200,300, 270,250, 330,330, 280,380, 220,250];

% Create image with closed curves
lined = zeros(m);
lined = rgb2gray(insertShape(lined,'Line',line));
lined = rgb2gray(insertShape(lined,'Rectangle',rect));
lined = rgb2gray(insertShape(lined,'Circle',circle));
lined = rgb2gray(insertShape(lined,'Polygon',poly));

% Create image with filled curves
filled = zeros(m);
filled = rgb2gray(insertShape(filled,'Line',line));
filled = rgb2gray(insertShape(filled,'FilledRectangle',rect,'Color','white','Opacity',1.0));
filled = rgb2gray(insertShape(filled,'FilledCircle',circle,'Color','white','Opacity',1.0));
filled = rgb2gray(insertShape(filled,'FilledPolygon',poly,'Color','white','Opacity',1.0));

% Negative of image to produce black figures on white

dotted = imcomplement(dotted);
lined = imcomplement(lined);
filled = imcomplement(filled);

kernel_size = 3;

dotted_mean = mean_filter(dotted,m,m,kernel_size);
dotted_median = medfilt2(dotted);
dotted_hist = histeq(dotted);
dotted_fd_x = deriv_x(dotted,m,m);
dotted_fd_y = deriv_y(dotted,m,m);
dotted_sd_x = deriv_x(dotted_fd_x,m-1,m-1);
dotted_sd_y = deriv_y(dotted_fd_y,m-1,m-1);

lined_mean = mean_filter(lined,m,m,kernel_size);
lined_median = medfilt2(lined);
lined_hist = histeq(lined);
lined_fd_x = deriv_x(lined,m,m);
lined_fd_y = deriv_y(lined,m,m);
lined_sd_x = deriv_x(lined_fd_x,m-1,m-1);
lined_sd_y = deriv_y(lined_fd_y,m-1,m-1);

filled_mean = mean_filter(filled,m,m,kernel_size);
filled_median = medfilt2(filled);
filled_hist = histeq(filled);
filled_fd_x = deriv_x(filled,m,m);
filled_fd_y = deriv_y(filled,m,m);
filled_sd_x = deriv_x(filled_fd_x,m-1,m-1);
filled_sd_y = deriv_y(filled_fd_y,m-1,m-1);

dotted = border(dotted,0);
dotted_mean = border(dotted_mean,0);
dotted_median = border(dotted_median,0);
dotted_hist = border(dotted_hist,0);

figure('name','dotted','numbertitle','off'),imshow(dotted);
figure('name','dotted_mean','numbertitle','off'),imshow(dotted_mean);
figure('name','dotted_median','numbertitle','off'),imshow(dotted_median);
figure('name','dotted_hist','numbertitle','off'),imshow(dotted_hist);
figure('name','dotted_fd_x','numbertitle','off'),imshow(dotted_fd_x);
figure('name','dotted_fd_y','numbertitle','off'),imshow(dotted_fd_y);
figure('name','dotted_sd_x','numbertitle','off'),imshow(dotted_sd_x);
figure('name','dotted_sd_y','numbertitle','off'),imshow(dotted_sd_y);


figure('name','lined','numbertitle','off'),imshow(lined);
figure('name','lined_mean','numbertitle','off'),imshow(lined_mean);
figure('name','lined_median','numbertitle','off'),imshow(lined_median);
figure('name','lined_hist','numbertitle','off'),imshow(lined_hist);
figure('name','lined_fd_x','numbertitle','off'),imshow(lined_fd_x);
figure('name','lined_fd_y','numbertitle','off'),imshow(lined_fd_y);
figure('name','lined_sd_x','numbertitle','off'),imshow(lined_sd_x);
figure('name','lined_sd_y','numbertitle','off'),imshow(lined_sd_y);

 
figure('name','filled','numbertitle','off'),imshow(filled);
figure('name','filled_mean','numbertitle','off'),imshow(filled_mean);
figure('name','filled_median','numbertitle','off'),imshow(filled_median);
figure('name','filled_hist','numbertitle','off'),imshow(filled_hist);
figure('name','filled_fd_x','numbertitle','off'),imshow(filled_fd_x);
figure('name','filled_fd_y','numbertitle','off'),imshow(filled_fd_y);
figure('name','filled_sd_x','numbertitle','off'),imshow(filled_sd_x);
figure('name','filled_sd_y','numbertitle','off'),imshow(filled_sd_y);
