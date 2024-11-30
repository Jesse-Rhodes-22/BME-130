% Condensed MATLAB script to read, convert, and plot ECG1, ECG2, and NIBP

% Record name (file without extension)
recordName = '0188';

% Signal metadata
channel_indices = [1, 2, 3];          % ECG1, ECG2, NIBP channel indices
conv_factors = [30370.1, 25948, 1308.12]; % Conversion factors (adu/unit)
baselines = [-19399, -13050, -84809];    % Baseline offsets (adu)
signal_labels = {'ECG1 (mV)', 'ECG2 (mV)', 'NIBP (mmHg)'}; % Signal names

% Read sampling frequency and total time from the header
[~, fs] = wfdbdesc(recordName);

% Read and process all data at once
[signal, tm] = rdsamp(recordName);

% Loop through each channel to process and plot
figure;
for i = 1:length(channel_indices)
    % Extract and convert the signal for the current channel
    channel_signal = signal(:, channel_indices(i)); % Select channel
    physical_signal = (channel_signal + baselines(i)) / conv_factors(i); % Convert to physical units

    % Plot the current channel
    subplot(3, 1, i);
    plot(tm, physical_signal);
    xlabel('Time (s)');
    ylabel(signal_labels{i});
    title(signal_labels{i});
    grid on;
end
