% In this analyze we want to check how koopman can effect on
%% Apply AR1 to Koopman data


% In this analyze we want to check how koopman can effect on

% Load the data (here we can load one of each 6 koopman transformed data we
% have)
load('Koopman_ShamHC_all.mat');

% Assume the data is stored in the variable Koopman_ShamHC_All
data =Koopman_ShamHC_All;

% The original data shape is 180000x5
original_size = size(data);

% Verify the original size is 180000x3
if original_size(1) ~= 180000 || original_size(2) ~= 3
    error('Unexpected data shape: %dx%d', original_size(1), original_size(2));
end


% Reshape the matrix
reshaped_data = reshape(data, [1000, 10, 18, 3]);

% Permute the dimensions to get the desired shape of 18 x 10 x 3 x 1000
reshaped_data = permute(reshaped_data, [3, 2, 4, 1]);

% The reshaped_data is now 18x10x3x1000
disp(size(reshaped_data));
%% 



include_W = 1;
n_AR_lags = 102;
W_mask = 'full';   

kStep=1;

% Initialize the results struct for all subjects
Results_shamhceeg_Koopman = struct();

    for subj = 1:18        
        % Loop through trials for the current subject
        for trial = 1:10
            Y_singletrial = reshaped_data(subj,trial,:,:);
            Y_singletrial=squeeze(Y_singletrial);
            % Initialize the delta_y matrix with zeros
            delta_y = zeros(size(Y_singletrial));
            
            % Compute delta y (y(t) - y(t-1))
            delta_y(:, 2:end) = Y_singletrial(:, 2:end) - Y_singletrial(:, 1:end-1);
            
            % Apply the AR model
            [model, R2, whiteness, Y_hat,Y_test_plus_hat, runtime, R2_lagremoved,whiteness_lagremoved] = linear_AR(delta_y, include_W, n_AR_lags, W_mask, kStep, 0, []);
            
            % Store the results in the struct
            Results_shamhceeg_Koopman(subj).data(trial).model = model;
            Results_shamhceeg_Koopman(subj).data(trial).R2 = R2;
            Results_shamhceeg_Koopman(subj).data(trial).Y_hat = Y_hat;
            Results_shamhceeg_Koopman(subj).data(trial).Y_test_plus_hat = Y_test_plus_hat;
            Results_shamhceeg_Koopman(subj).data(trial).whiteness = whiteness;
            Results_shamhceeg_Koopman(subj).data(trial).runtime = runtime;
            Results_shamhceeg_Koopman(subj).data(trial).R2_lagremoved = R2_lagremoved;
            Results_shamhceeg_Koopman(subj).data(trial).whiteness_lagremoved = whiteness_lagremoved;
        end
    end



 


% Load the data (here we can load one of each 6 raw datasets we
% have)
load('Raw_ShamHC_all.mat');

% Assume the data is stored in the variable Koopman_ShamHC_All
data = Raw_ShamHC_All;

% The original data shape is 180000x5
original_size = size(data);

% Verify the original size is 180000x5
if original_size(1) ~= 180000 || original_size(2) ~= 5
    error('Unexpected data shape: %dx%d', original_size(1), original_size(2));
end


% Reshape the matrix
reshaped_data = reshape(data, [1000, 10, 18, 5]);

% Permute the dimensions to get the desired shape of 18 x 10 x 3 x 1000
reshaped_data = permute(reshaped_data, [3, 2, 4, 1]);


% The reshaped_data is now 18x10x5x1000
disp(size(reshaped_data));

%% Apply AR1 to raw data





% Initialize the results struct for all subjects
Results_shamhceeg_raw = struct();

    for subj = 1:18        
        % Loop through trials for the current subject
        for trial = 1:10
            Y_singletrial = reshaped_data(subj,trial,:,:);
            Y_singletrial=squeeze(Y_singletrial);
            % Initialize the delta_y matrix with zeros
            delta_y = zeros(size(Y_singletrial));
            
            % Compute delta y (y(t) - y(t-1))
            delta_y(:, 2:end) = Y_singletrial(:, 2:end) - Y_singletrial(:, 1:end-1);
            
            % Apply the AR model
            [model, R2, whiteness, Y_hat,Y_test_plus_hat, runtime, R2_lagremoved,whiteness_lagremoved] = linear_AR(delta_y, include_W, n_AR_lags, W_mask, kStep, 0, []);
            
            % Store the results in the struct
            Results_shamhceeg_raw(subj).data(trial).model = model;
            Results_shamhceeg_raw(subj).data(trial).R2 = R2;
            Results_shamhceeg_raw(subj).data(trial).Y_hat = Y_hat;
            Results_shamhceeg_raw(subj).data(trial).Y_test_plus_hat = Y_test_plus_hat;
            Results_shamhceeg_raw(subj).data(trial).whiteness = whiteness;
            Results_shamhceeg_raw(subj).data(trial).runtime = runtime;
            Results_shamhceeg_raw(subj).data(trial).R2_lagremoved = R2_lagremoved;
            Results_shamhceeg_raw(subj).data(trial).whiteness_lagremoved = whiteness_lagremoved;
                     
        end
    end







%% Compare accuracies


trialsR2=zeros(5,10);
R2_MeanOfElectrodes_shamhc_raw=zeros(10,18);

for i = 1:18
    % Construct the name of the struct dynamically
    % Assign the struct to the Subjects array
    Variable = Results_shamhceeg_raw(i).data;
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_shamhc_raw(:,i)=trialsR2_mean;
end

figure;
boxplot(R2_MeanOfElectrodes_shamhc_raw)
fontSize = 14; % Whatever you want.
ylim([-1 1])

title("R2 plot in the condition of Sham and Healthy control Raw", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)

%% 


trialsR2=zeros(3,10);
R2_MeanOfElectrodes_shamhc_koopman=zeros(10,18);

for i = 1:18
    % Construct the name of the struct dynamically
    % Assign the struct to the Subjects array
    Variable = Results_shamhceeg_Koopman(i).data;
    for j=1:10
        trialsR2(:,j)=Variable(j).R2;
    end

    trialsR2_mean=mean(trialsR2,1);
    R2_MeanOfElectrodes_shamhc_koopman(:,i)=trialsR2_mean;
end

figure;
boxplot(R2_MeanOfElectrodes_shamhc_koopman)
fontSize = 14; % Whatever you want.
ylim([-1 1])

title("R2 plot in the condition of Sham and Healthy control Koopman", 'FontSize', fontSize)
ylabel('R2 box plot', 'FontSize', fontSize)
xlabel('Subject number', 'FontSize', fontSize)

%% 


% Assuming R2_MeanOfElectrodes_shamhc_raw and R2_MeanOfElectrodes_shamhc_koopman
% are matrices with the same number of rows (subjects)

% Combine the data
combined_data = [R2_MeanOfElectrodes_shamhc_raw(:); R2_MeanOfElectrodes_shamhc_koopman(:)];

% Create group labels for the box plots
num_subjects = size(R2_MeanOfElectrodes_shamhc_raw, 2);
num_trials = size(R2_MeanOfElectrodes_shamhc_raw, 1);

group = [repmat((1:num_subjects)', num_trials, 1); repmat((1:num_subjects)', num_trials, 1)];
condition = [repmat({'Raw'}, num_subjects*num_trials, 1); repmat({'Koopman'}, num_subjects*num_trials, 1)];

% Combine the grouping variables
group_combined = strcat(cellstr(num2str(group)), '-', condition);

% Plot the combined box plot
figure;
boxplot(combined_data, group_combined);

% Set the font size
fontSize = 20;
ylim([-1 1])

% Customize the plot
title('R2 plot in the conditions of Sham and Healthy control', 'FontSize', fontSize);
ylabel('R2 box plot', 'FontSize', fontSize);
xlabel('Subject number - Condition', 'FontSize', fontSize);
xtickangle(45); % Rotate x-axis labels for better readability

% Optionally, adjust the colors of the box plots
h = findobj(gca, 'Tag', 'Box');
colors = [0 0.4470 0.7410; 0.8500 0.3250 0.0980]; % Example colors: blue and red
for j=1:length(h)
    patch(get(h(j), 'XData'), get(h(j), 'YData'), colors(mod(j-1, 2)+1, :), 'FaceAlpha', 0.5);
end













