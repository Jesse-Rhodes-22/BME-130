% File name (without extension)
recordName = '0188'; % Replace with your actual file name (without .dat or .hea)

% Read all signals and metadata
[signals, fields] = rdsamp(recordName);

% Display the field contents to understand the structure
disp(fields);

% Extract ECG1 signal (usually the first channel, confirm based on your dataset)
ecg1 = signals(:, 1); % Adjust the column index if ECG1 is on a different channel
ecg2 = signals(:, 2);
nibp = signals(:, 3);

% Plot the ECG1 signal
figure;
plot(ecg1);
title('ECG1 Signal');
xlabel('Time (ms)');
ylabel('Amplitude');
xlim([0 10000]);
grid on;

figure;
plot(ecg2);
title('ECG2 Signal');
xlabel('Time (ms)');
ylabel('Amplitude');
xlim([0 10000]);
grid on;

figure;
plot(nibp);
title('NIBP Signal');
xlabel('Time (ms)');
ylabel('Amplitude');
xlim([0 10000]);
grid on;