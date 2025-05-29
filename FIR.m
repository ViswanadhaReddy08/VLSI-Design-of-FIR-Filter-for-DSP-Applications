% FIR Filter Coefficient Generation (corrected)
clc;
clear;

% Filter specifications
N = 8;  % Number of taps
fc = 0.2;  % Normalized cutoff frequency (0 < fc < 0.5)
fs = 1;  % Normalized sampling frequency

% Design lowpass FIR filter using built-in function
h = fir1(N-1, fc, 'low');  % (N-1) because fir1 defines filter order

% Scale to fixed-point (Q15 format: -32768 to 32767)
scale = 2^15 - 1;  % Max 16-bit signed integer (Q15)
h_fixed = round(h * scale);

% Display results
disp('Floating point coefficients:');
disp(h);

disp('Fixed-point (Q15) coefficients:');
disp(h_fixed);

% Optional: write to a text file for Verilog use
fileID = fopen('coefficients.txt','w');
fprintf(fileID, '%d\n', h_fixed);
fclose(fileID);