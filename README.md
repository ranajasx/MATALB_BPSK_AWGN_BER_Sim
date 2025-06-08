# MATALB_BPSK_AWGN_BER_Sim
# BPSK Modulation over AWGN Channel Simulation (MATLAB)

# Project Overview
This project simulates a fundamental digital communication system: Binary Phase Shift Keying (BPSK) modulation, its transmission through an Additive White Gaussian Noise (AWGN) channel, and subsequent demodulation. The primary goal is to analyze the system's performance by calculating and plotting the Bit Error Rate (BER) against various Signal-to-Noise Ratio (SNR) levels.

The simulation is implemented entirely using **core MATLAB functions**, ensuring compatibility with environments like basic MATLAB Online where specialized toolboxes might be unavailable.

This project demonstrates:
-   **Core Digital Communications Principles:** Practical understanding of BPSK, AWGN, and BER.
-   **MATLAB for Engineering Simulation:** Proficiency in using MATLAB for numerical simulations and scientific plotting.
-   **Resourcefulness & Problem-Solving:** Ability to implement communication system components from first principles when standard toolbox functions are not available, highlighting adaptability to tool limitations.
-   **Performance Analysis:** Ability to compare simulated results against theoretical models for validation.

## Communication Concepts Demonstrated
-   **Binary Data Generation:** Creating random bit streams (0s and 1s).
-   **BPSK Modulation:** Mapping binary bits (0s/1s) to antipodal symbols (-1/+1).
-   **AWGN Channel Modeling:** Simulating the effect of random noise on the signal.
-   **Coherent Detection:** Recovering original bits from noisy signals based on a decision threshold.
-   **Bit Error Rate (BER) Calculation:** Quantifying system reliability by comparing transmitted vs. detected bits.
-   **Theoretical BER Comparison:** Validating simulation results against the known theoretical BER for BPSK over AWGN, derived from the complementary error function.

## Expected Results
The simulation will produce a graph with two curves:
-   A **simulated BER curve** (typically represented by blue circles) which is derived from counting bit errors during the simulation.
-   A **theoretical BER curve** (typically a red dashed line) which is calculated based on the mathematical formula for BPSK over an AWGN channel.

The simulated curve is expected to closely follow the theoretical curve, especially at higher SNR values (where BER is lower), confirming the correctness and accuracy of the implemented simulation logic.
