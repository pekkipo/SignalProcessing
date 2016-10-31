fs=10000;
T=1/fs;
duration=0.1;
t=0:T:duration;
f_dom=(-fs/2):1/duration:fs/2;                           %0:1/duration:fs;

signal = sin(2*pi*50*t)+0.3*sin(2*400*pi*t);
noise = 0.3*randn(1,length(t));
new_signal=signal+noise;
fftsignal=fft(new_signal);
fftshiftedsignal=fftshift(fftsignal);


%% Shifted signal in frequency domain
figure(1)
subplot(2,1,1)
plot(t,new_signal);
subplot(2,1,2)
plot(f_dom,abs(fftshiftedsignal));
tw=900;
filter=rectpuls(f_dom,tw);
filtered_signal=(fftshiftedsignal).*filter;
%% Filtered signal in frequency domain
figure(2)
subplot(2,1,1)
plot(f_dom, abs(filtered_signal));
subplot(2,1,2)
plot(f_dom, filter); %filter in frequency domain

%% Original signal
figure(3)
plot(t,signal)
%% ifft back to the original
shifted_filtered_signal=ifftshift(filtered_signal);
figure(5)
plot(abs(shifted_filtered_signal));
signalintimedomain=ifft(shifted_filtered_signal);
figure(4)
plot(t,(signalintimedomain));
