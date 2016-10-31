clear all
close all
clc


picture=imread('TUM.tiff','tiff');
picture=double(picture);

s=size(picture);


%% Filters
mean_filter = zeros(s(1), s(2));
differ_filter = zeros(s(1), s(2));
laplace_filter = zeros(s(1), s(2))

mean_filter(1:3, 1:3)=1/9*[1 1 1; 1 1 1; 1 1 1]
differ_filter(1:3, 1:3)=1/2*[0 -1 0; 0 0 0; 0 1 0]
laplace_filter(1:3, 1:3)=1/8*[0 1 0; 1 -4 1; 0 1 0]

%% Fourier transforms
picture_fdom=fft2(picture);
mean_filter_f=fft2(mean_filter);
differ_filter_f=fft2(differ_filter);
laplace_filter_f=fft2(laplace_filter);

picture_fdom_1=picture_fdom.*mean_filter_f;
picture_fdom_2=picture_fdom.*differ_filter_f;
picture_fdom_3=picture_fdom.*laplace_filter_f;

picture_1 = ifft2(picture_fdom_1);
picture_2 = ifft2(picture_fdom_2);
picture_3 = ifft2(picture_fdom_3);


figure(1)
imagesc(picture);
colormap('gray');
figure(2)
subplot(3,1,1)
imagesc(picture_1);
colormap('gray');
subplot(3,1,2)
imagesc(picture_2);
colormap('gray');
subplot(3,1,3)
imagesc(picture_3);
colormap('gray');







