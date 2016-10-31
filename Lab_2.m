clc
clear all
close all

filename='Sample.wav';
[y, fs, nbits] = wavread(filename);
sample=wavread(filename)
%play(sample);

duration=(length(y)-1)/fs;
T=1/fs;
t=0:T:duration;
f_dom=(-fs/2):1/duration:fs/2; 
fft_y=(fft(y)); %was abs
fft_shifted_y = fftshift(fft_y);

figure(1)
subplot(2,1,1)
plot(t,y);
subplot(2,1,2);
plot(f_dom,abs(fft_y))
figure(2)
plot(f_dom,fft_shifted_y);
xlim([-1000 1000]);

filter_wide=rectpuls(f_dom,800); %800
filter_narrow=rectpuls(f_dom,500); %530
filter=filter_wide-filter_narrow;
filter=filter';

filtered_signal=(fft_shifted_y).*filter;
figure(3)
plot(f_dom, abs(filtered_signal));


shifted_filtered_signal=ifftshift(filtered_signal);
% figure(4)
% plot(abs(shifted_filtered_signal));
filteredsignalintimedomain=ifft(shifted_filtered_signal);
figure(4)
plot(t,((filteredsignalintimedomain)));

wavwrite(filteredsignalintimedomain,fs,nbits,'newsample3');
%play(new_sample);