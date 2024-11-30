clear all;
close all;
clc;

%Open file selection dialog
    [fileName, filePath] = uigetfile('*.dat', 'Select the  file');
    
    %Check if user selected a file
    if isequal(fileName, 0)
        disp('User selected Cancel');
        data = [];
        return;
    end
    
    %Construct full file path
    fullFileName = fullfile(filePath, fileName);
    
    %Read the data from the file into a MATLAB array
    data = readtable(fullFileName);

[signals, temp] = rdsamp(fileName); %rdsamp is like load but for physionet wfdb

ecg1 = signals(:, 1); %ecg1 is column 1
ecg2 = signals(:, 2); %ecg2 is column 2
nibp = signals(:, 3); %ecg3 is column 3

%plotting
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
