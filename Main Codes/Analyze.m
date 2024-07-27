%Anlyze the fitted model by plotting Yhat and metrics

%% for shamhcEEG
clear;
% Load the data set
load("all_results_shamhceeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_shamhc=zeros(10,22);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:22
    % Construct the name of the struct dynamically
    structName = sprintf('Results_shamhceeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_shamhc(:,i)=trialsR2_mean;
end


boxplot(R2_MeanOfElectrodes_shamhc)
fontSize = 14; % Whatever you want.

title("R2 plot in the condition of Sham and Healthy control", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)




TotalMean_shamhc=nanmean(R2_MeanOfElectrodes_shamhc,"all");


%% for shampd1EEG
clear;
% Load the data set
load("all_results_shampd1eeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_shampd1=zeros(10,20);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:20
    % Construct the name of the struct dynamically
    structName = sprintf('Results_shampd1eeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_shampd1(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_shampd1)
fontSize = 14; % Whatever you want.

title("R2 plot in the condition of Sham and Parkinson disease 1", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)


TotalMean_shampd1=nanmean(R2_MeanOfElectrodes_shampd1,"all");

%% for shampd2EEG
clear;
% Load the data set
load("all_results_shampd2eeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_shampd2=zeros(10,20);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:20
    % Construct the name of the struct dynamically
    structName = sprintf('Results_shampd2eeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_shampd2(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_shampd2)

fontSize = 14; % Whatever you want.

title("R2 plot in the condition of Sham and Parkinson disease 2", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)


TotalMean_shampd2=nanmean(R2_MeanOfElectrodes_shampd2,"all");


%% for stim7hcEEG
clear;
% Load the data set
load("all_results_stim7hceeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_stim7hc=zeros(10,22);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:22
    % Construct the name of the struct dynamically
    structName = sprintf('Results_stim7hceeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_stim7hc(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_stim7hc)
fontSize = 14; % Whatever you want.

title("R2 plot in the condition of Stimulus7 and Healthy control", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)

TotalMean_stim7hc=nanmean(R2_MeanOfElectrodes_stim7hc,"all");


%% for stim7pd1EEG
clear;
% Load the data set
load("all_results_stim7pd1eeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_stim7pd1=zeros(10,20);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:20
    % Construct the name of the struct dynamically
    structName = sprintf('Results_stim7pd1eeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_stim7pd1(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_stim7pd1)

fontSize = 14; % Whatever you want.

title("R2 plot in the condition of Stimulus and Parkinson disease 1", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)


TotalMean_stim7pd1=nanmean(R2_MeanOfElectrodes_stim7pd1,"all");

%% for stim7pd2EEG
clear;
% Load the data set
load("all_results_stim7pd2eeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_stim7pd2=zeros(10,20);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:20
    % Construct the name of the struct dynamically
    structName = sprintf('Results_stim7pd2eeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_stim7pd2(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_stim7pd2)
fontSize = 14; % Whatever you want.

title("R2 plot in the condition of Stimulus7 and Parkinson disease 2", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)

TotalMean_stim7pd2=nanmean(R2_MeanOfElectrodes_stim7pd2,"all");

%% for stim8hcEEG
clear;
% Load the data set
load("all_results_stim8hceeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_stim8hc=zeros(10,22);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:22
    % Construct the name of the struct dynamically
    structName = sprintf('Results_stim8hceeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_stim8hc(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_stim8hc)
fontSize = 14; % Whatever you want.

title("R2 plot in the condition of stimulus 8 and Healthy control", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)


TotalMean_stim8hc=nanmean(R2_MeanOfElectrodes_stim8hc,"all");

%% for stim8pd1EEG
clear;
% Load the data set
load("all_results_stim8pd1eeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_stim8pd1=zeros(10,20);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:20
    % Construct the name of the struct dynamically
    structName = sprintf('Results_stim8pd1eeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_stim8pd1(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_stim8pd1)

fontSize = 14; % Whatever you want.

title("R2 plot in the condition of stimulus 8 and Parkinson disease 1", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)


TotalMean_stim8pd1=nanmean(R2_MeanOfElectrodes_stim8pd1,"all");


%% for stim8pd2EEG
clear;
% Load the data set
load("all_results_stim8pd2eeg.mat");
% Initialize the new struct array
% Initialize a 1x22 empty cell array

R2_MeanOfElectrodes_stim8pd2=zeros(10,20);

trialsR2=zeros(27,10);

% Loop through each struct and assign it to the array
for i = 1:20
    % Construct the name of the struct dynamically
    structName = sprintf('Results_stim8pd2eeg_subj%d', i);
    % Assign the struct to the Subjects array
    Variable = eval(structName);
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_stim8pd2(:,i)=trialsR2_mean;
end

boxplot(R2_MeanOfElectrodes_stim8pd2)

fontSize = 14; % Whatever you want.

title("R2 plot in the condition of Stimulus 8 and Parkinson disease 2", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)


TotalMean_stim8pd2=nanmean(R2_MeanOfElectrodes_stim8pd2,"all");

%% Plot Y and Yhat in one plot

load("shamdata_tlgo.mat");

Subj=shamhceeg{1,1};
Y_original=Subj(12:14,:,:);

Y_hat_total=zeros(10,27,2000);

for i=1:10
    Y_hat_total(i,:,:)=Results_shamhceeg_subj1(1,i).Y_hat;
end

Y_hat_total_compare=Y_hat_total(:,:,1602:2000);
Y_hat_total_compare_trial1=Y_hat_total_compare(1,12:14,:);
Y_hat_total_compare_trial1=reshape(Y_hat_total_compare_trial1,3,399);

Y_original_compare=Y_original(:,1602:2000,:);

Y_original_compare_trial1=Y_original_compare(:,:,1);


time_axis = linspace(1.6, 2, 399);

% Plot EEG for each Estimated and Original

figure;
hold on;
 

plot(time_axis, Y_hat_total_compare_trial1(1,:), 'r', 'LineWidth', 3.5, 'Color', [1 0 0 0.5]); % Red with 50% transparency
hold on;
plot(time_axis, Y_original_compare_trial1(1,:), 'b', 'LineWidth', 3.5, 'Color', [0 0 1 0.5]); % Blue with 50% transparency
hold off;

% Labeling
fontSize = 14; % Whatever you want.

xlabel('Time (s)','FontSize', fontSize);
ylabel('Voltage(uV)','FontSize', fontSize);
title('Original and estimated Electrode 12 EEG waveform','FontSize', fontSize);
legend('Estimated', 'Original','FontSize', fontSize);
grid on;
hold off;

%% Electrode 13

% Plot EEG for each Estimated and Original

figure;
hold on;
 
%Efficient type of trials


plot(time_axis, Y_hat_total_compare_trial1(2,:), 'r', 'LineWidth', 3.5, 'Color', [1 0 0 0.5]); % Red with 50% transparency
hold on;
plot(time_axis, Y_original_compare_trial1(2,:), 'b', 'LineWidth', 3.5, 'Color', [0 0 1 0.5]); % Blue with 50% transparency
hold off;
fontSize = 14; % Whatever you want.

% Labeling
xlabel('Time (s)','FontSize', fontSize);
ylabel('Voltage(uV)','FontSize', fontSize);
title('Original and estimated Electrode 13 EEG waveform','FontSize', fontSize);
legend('Estimated', 'Original','FontSize', fontSize);
grid on;
hold off;



%% Electrode 14


% Plot EEG for each Estimated and Original

figure;
hold on;
 
%Efficient type of trials


plot(time_axis, Y_hat_total_compare_trial1(3,:), 'r', 'LineWidth', 3.5, 'Color', [1 0 0 0.5]); % Red with 50% transparency
hold on;
plot(time_axis, Y_original_compare_trial1(3,:), 'b', 'LineWidth', 3.5, 'Color', [0 0 1 0.5]); % Blue with 50% transparency
hold off;

% Labeling
xlabel('Time (s)','FontSize', fontSize);
ylabel('Voltage(uV)','FontSize', fontSize);
title('Original and estimated Electrode 14 EEG waveform','FontSize', fontSize);
legend('Estimated', 'Original','FontSize', fontSize);
grid on;
hold off;



%% functions



function colors = get_distinguishable_colors(n)
    % Generate a set of distinguishable colors
    golden_ratio_conjugate = (1 + sqrt(5)) / 2;
    hue = mod((0:n-1)' / golden_ratio_conjugate, 1);
    saturation = 0.6;
    value = 0.9;
    colors = hsv2rgb([hue, saturation * ones(n, 1), value * ones(n, 1)]);
end








