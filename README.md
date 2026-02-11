# wireless_radio_2026_matlab_SNR_experiment
To investigate how varying Signal-to-Noise Ratio (SNR) affects the demodulation performance of a communication system.  This experiment provides you with hands-on experience in understanding how SNR affects the performance of a communication system. 


Overview

The simulation compares two fundamental modulation techniques:

Amplitude Shift Keying (ASK): Data is represented by changes in carrier amplitude.

Binary Phase Shift Keying (BPSK): Data is represented by 180^ phase shifts.

The goal is to visualize how Additive White Gaussian Noise (AWGN) corrupts the signal and to quantify the Bit Error Rate (BER) as signal quality degrades.

Simulation ParametersSampling Frequency (f_s): 1000 Hz

Carrier Frequency (f_c): 50 Hz - 100 Hz

SNR Range: -10 dB to 10 dB

Channel Model: AWGN (Additive White Gaussian Noise)

Key Findings
Sensitivity to Noise: ASK proved more susceptible to errors at low SNR because noise directly interferes with the amplitude envelope.

Phase Robustness: BPSK maintained a significantly lower BER in high-noise environments (negative SNR) due to the greater "distance" between binary states in the signal space.

Thresholding: While ASK requires an optimized threshold for decision-making, BPSK uses a zero-crossing detection, making it more robust against varying signal power.

Experimental VariablesCarrier Frequency (f_c): 

Increasing the frequency allows for more cycles per bit, which can improve the accuracy of the low-pass filter (averaging) during demodulation, though it requires higher sampling rates.

SNR (Signal-to-Noise Ratio): This is the ratio of signal power to noise power.

High SNR (>10dB): Clear signal, zero or minimal bit errors.

Low SNR (<0dB): Signal is buried in noise; demodulation becomes highly unreliable.

Modulation Schemes:ASK (Amplitude Shift Keying): Simple to implement but vulnerable to noise that mimics amplitude spikes.

BPSK (Binary Phase Shift Keying): More robust. By shifting the phase by 180^, we maximize the "distance" between a '0' and a '1', making it harder for noise to cause a bit-flip.

📊 Results & Observations

Noise Tolerance: BPSK consistently outperforms ASK at negative SNR levels because the decision threshold is at zero, whereas ASK requires a manually tuned amplitude threshold.

Frequency Impact: Lower carrier frequencies are more susceptible to "ripple" effects in the demodulated output, while higher frequencies provide a smoother envelope for the decision logic.

Noise Threshold: As SNR drops below 0dB, the ASK envelope becomes indistinguishable from background noise, leading to high bit error rates.

Phase Robustness: BPSK maintains a clear logical "high" and "low" even when the received signal is visually distorted, thanks to coherent demodulation.

Frequency Impact: Lower carrier frequencies result in slower transitions, making the low-pass filter (moving average) more critical for accurate recovery.

High SNR (10dB+): The signal dominates; demodulation is nearly perfect.

Low SNR (<0dB): The noise power exceeds the signal power. In ASK, the amplitude pulses are "buried," while in BPSK, the phase shifts become difficult to track.

Higher f_c: Allows for easier filtering of the envelope during demodulation but requires higher sampling rates to avoid aliasing.

Lower f_c: Results in fewer wave cycles per bit, making the demodulator more sensitive to noise spikes within a single bit period.

Modulation Scheme: ASK vs. BPSK

ASK (Amplitude Shift Keying): Represents bits by switching the carrier on and off. It is simple but highly vulnerable to atmospheric noise which affects amplitude.

BPSK (Binary Phase Shift Keying): Represents bits by flipping the phase of the carrier by 180^.

Observation: BPSK is significantly more robust. Because it uses the full power of the carrier for both '0' and '1' and has a wider "distance" between states in the phase domain, it maintains data integrity at lower SNR levels than ASK.

The MATLAB Code and plots can be seen in files in this repository.
