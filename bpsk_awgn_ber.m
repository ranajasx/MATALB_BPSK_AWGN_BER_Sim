% bpsk_awgn_ber.m
% Basic BPSK Modulation over AWGN Channel and BER Performance.

clear;
close all;
clc;

% --- 1. System Parameters Definition ---
num_bits_per_snr = 100000;    % Number of bits to simulate for each SNR point
SNR_dB_range = 0:2:12;        % SNR range in dB for simulation

% --- Initialize storage for BER results ---
BER_simulated = zeros(size(SNR_dB_range));
BER_theoretical = zeros(size(SNR_dB_range));

fprintf('Starting BPSK over AWGN BER simulation...\n');

% --- Loop over different SNR values ---
for snr_idx = 1:length(SNR_dB_range)
    current_SNR_dB = SNR_dB_range(snr_idx);
    SNR_linear = 10^(current_SNR_dB / 10); % Convert SNR from dB to linear

    % --- 2. Data Generation (Binary) ---
    input_bits = randi([0 1], num_bits_per_snr, 1); % Generate random binary bits (0s and 1s)

    % --- 3. BPSK Modulation (Mapping 0->-1, 1->+1) ---
    % In BPSK, 0 maps to -1 and 1 maps to +1
    % This also assumes unit energy per bit (Eb=1) for simplicity
    modulated_symbols = 2 * input_bits - 1; % Maps 0 to -1, 1 to +1

    % --- 4. AWGN Channel Simulation ---
    % Noise power calculation: Noise_Power = Eb / SNR_linear
    % Since we assume Eb = 1 for modulated_symbols, Noise_Power = 1 / SNR_linear
    noise_variance = 1 / SNR_linear;
    noise_std_dev = sqrt(noise_variance / 2); % Standard deviation for real/imaginary parts of noise

    % Generate real Gaussian noise (BPSK is a real signal in this context)
    noise = noise_std_dev * randn(size(modulated_symbols));

    % Add noise to the signal
    received_signal = modulated_symbols + noise;

    % --- 5. BPSK Demodulation (Coherent Detection) ---
    % For BPSK, a simple threshold detector (0) works if transmitted symbols are -1 and +1
    detected_bits = (received_signal > 0); % If received > 0, decide 1; else 0

    % --- 6. Calculate Bit Error Rate (BER) ---
    num_bit_errors = sum(input_bits ~= detected_bits);
    BER_simulated(snr_idx) = num_bit_errors / num_bits_per_snr;

    % --- 7. Calculate Theoretical BER for BPSK over AWGN ---
    % BER_theoretical = Q(sqrt(2 * Eb/No))
    % Here, Eb/No = SNR_linear
    BER_theoretical(snr_idx) = 0.5 * erfc(sqrt(SNR_linear)); % erfc is MATLAB's complementary error function

    fprintf('SNR = %d dB, Simulated BER = %e, Theoretical BER = %e\n', ...
            current_SNR_dB, BER_simulated(snr_idx), BER_theoretical(snr_idx));
end % End of SNR loop

% --- 8. Plotting BER Curve ---
fprintf('\nSimulation complete. Plotting BER curve.\n');
figure;
semilogy(SNR_dB_range, BER_simulated, 'bo-', 'DisplayName', 'Simulated BPSK');
hold on;
semilogy(SNR_dB_range, BER_theoretical, 'r--', 'DisplayName', 'Theoretical BPSK');
xlabel('SNR (Eb/No in dB)');
ylabel('Bit Error Rate (BER)');
title('BPSK Modulation over AWGN Channel');
grid on;
ylim([1e-5 1]);
legend('show');