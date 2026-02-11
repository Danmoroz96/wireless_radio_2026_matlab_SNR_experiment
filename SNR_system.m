% Parameters
fs = 1000;              % Sampling frequency in Hz
t = 0:1/fs:1-1/fs;      % Time vector (1 second)
f_c = 50;               % Carrier frequency in Hz
SNR_values = [10, 5, 0, -5]; % SNR values in dB

% 1. Generate Binary Message Signal
% Note: To make the plots readable, let's use a slower bit rate
bits = randi([0 1], 1, 10); % 10 random bits
message_signal = repelem(bits, fs/10); % Upsample to match time vector

% 2. Modulation (ASK)
carrier = sin(2*pi*f_c*t);
modulated_signal = message_signal .* carrier;

figure('Name', 'ASK Modulation Analysis');

for i = 1:length(SNR_values)
    % 3. Add AWGN Noise
    received_signal = awgn(modulated_signal, SNR_values(i), 'measured');
    
    % 4. Demodulation (Rectification + Low-pass Filtering)
    % We rectify the signal and then use a moving average as a simple LPF
    rectified = abs(received_signal);
    demodulated_raw = movmean(rectified, fs/f_c); 
    
    % Thresholding to get back binary bits
    demodulated_binary = demodulated_raw > 0.3; % Simple thresholding
    
    % 5. Plotting
    subplot(4, 1, i);
    plot(t, received_signal, 'Color', [0.7 0.7 0.7]); hold on;
    plot(t, demodulated_binary, 'r', 'LineWidth', 1.5);
    title(['SNR = ', num2str(SNR_values(i)), ' dB']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    legend('Received (Noisy)', 'Demodulated');
    grid on;
end