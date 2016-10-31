% t=1;
% u = sin(100*pi*t)+0.3*sin(800*pi*t);
% noise=0.3*randn
% 
% ex_fft_tut


t = 0:.1:1;
N=11;
%snr=0.3;
u = sin(100*pi*t)+0.3*sin(800*pi*t);
noise=0.3*randn(N,1);
f = u+noise';
subplot(2,1,1)
plot(t,f,t,u);
% subplot(2,1,2)
% plot(t,u)

legend('Original signal','Signal with noise');


%x = sawtooth(t); % Create sawtooth signal.
%y = awgn(u,snr,'measured'); % Add white Gaussian noise.
%plot(t,u,t,y) % Plot both signals.
%legend('Original signal','Signal with AWGN');

% 
% SNR = [-10:5:30];  %in Db
%     snr = 10.^(0.1.*SNR);
% 
%     for I = 1:length(snr)
%      noise = 1/sqrt(2)*(randn(1,N)+1i*randn(1,N));
%     u = y+ noise.*snr(I);
%     end
     