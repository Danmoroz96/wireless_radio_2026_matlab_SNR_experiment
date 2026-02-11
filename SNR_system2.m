% === EXPERIMENTAL PARAMETERS ===
fs = 1000;                      % Sampling frequency in Hz
t = 0:1/fs:1-1/fs;              % Time vector
f_c = 50;                       % [MODIFY] Carrier frequency in Hz
SNR_values = [10, 5, 0, -5];    % [MODIFY] Array of SNR values to test
mod_scheme = 'BPSK';             % [MODIFY] Choose 'ASK' or 'BPSK'
% ===============================

% 1. Generate Binary Message Signal
bits = randi([0 1], 1, 10); 
message_signal = repelem(bits, fs/10); 
carrier = sin(2*pi*f_c*t);

% 2. Modulation Logic
if strcmp(mod_scheme, 'ASK')
    modulated_signal = message_signal .* carrier;
elseif strcmp(mod_scheme, 'BPSK')
    % Map 0 to -1 and 1 to +1 for phase shifting
    modulated_signal = (2*message_signal - 1) .* carrier;
end

figure('Name', [mod_scheme, ' Performance Analysis']);

for i = 1:length(SNR_values)
    % 3. Add AWGN Noise
    received_signal = awgn(modulated_signal, SNR_values(i), 'measured');
    
    % 4. Demodulation Logic
    if strcmp(mod_scheme, 'ASK')
        % Envelope Detection
        rectified = abs(received_signal);
        demodulated_raw = movmean(rectified, fs/f_c); 
        demodulated_binary = demodulated_raw > 0.3; % Fixed threshold
    elseif strcmp(mod_scheme, 'BPSK')
        % Coherent Detection
        product = received_signal .* carrier;
        demodulated_raw = movmean(product, fs/f_c);
        demodulated_binary = demodulated_raw > 0; % Zero threshold
    end
    
    % 5. Plotting
    subplot(4, 1, i);
    plot(t, received_signal, 'Color', [0.7 0.7 0.7]); hold on;
    plot(t, demodulated_binary, 'r', 'LineWidth', 1.5);
    title([mod_scheme, ' at SNR = ', num2str(SNR_values(i)), ' dB']);
    grid on;
end