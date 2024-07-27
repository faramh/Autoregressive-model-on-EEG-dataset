% In this code we want to decide which model of AR is proper for us to do
% DK Analysis so we have changed the parameters of model one by one
%Loading the dataset
load("shamdata_tlgo.mat")


%% Doing selected model for all subjects of shamhceeg

include_W = 1;
n_AR_lags = 102;
W_mask = 'full';   

TrainBool=1;
kStep=1;

% Initialize the results struct for all subjects
Results_shamhceeg = struct();

% Loop through each subject
if TrainBool
    for subj = 1:22
        Data = shamhceeg{1,subj};
        Results_shamhceeg(subj).subject = subj;
        Results_shamhceeg(subj).data = struct();
        
        % Loop through trials for the current subject
        for trial = 1:10
            Y_singletrial = Data(:,:,trial);
            
            % Initialize the delta_y matrix with zeros
            delta_y = zeros(size(Y_singletrial));
            
            % Compute delta y (y(t) - y(t-1))
            delta_y(:, 2:end) = Y_singletrial(:, 2:end) - Y_singletrial(:, 1:end-1);
            
            % Apply the AR model
            [model, R2, whiteness, Y_hat,Y_test_plus_hat, runtime, R2_lagremoved,whiteness_lagremoved] = linear_AR(delta_y, include_W, n_AR_lags, W_mask, kStep, 0, []);
            
            % Store the results in the struct
            Results_shamhceeg(subj).data(trial).model = model;
            Results_shamhceeg(subj).data(trial).R2 = R2;
            Results_shamhceeg(subj).data(trial).Y_hat = Y_hat;
            Results_shamhceeg(subj).data(trial).whiteness = whiteness;
            Results_shamhceeg(subj).data(trial).runtime = runtime;
            Results_shamhceeg(subj).data(trial).R2_lagremoved=R2_lagremoved;
            Results_shamhceeg(subj).data(trial).whiteness_lagremoved=whiteness_lagremoved;
        end
    end
end

%% Plotting box plots

trialsR2=zeros(27,10);
R2_MeanOfElectrodes_shamhc=zeros(10,22);

for i = 1:22
    % Construct the name of the struct dynamically
    % Assign the struct to the Subjects array
    Variable = Results_shamhceeg(i).data;
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




%% Changing the test range:


include_W = 1;
n_AR_lags = 102;
W_mask = 'full';   


kStep=20;
StartStep=1601+kStep+n_AR_lags;

Data=shamhceeg{1,1};
Results_shamhceeg_subj1 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    % Initialize the delta_y matrix with zeros
    delta_y = zeros(size(Y_singletrial));
    % Compute delta y (y(t) - y(t-1))
    delta_y(:, 2:end) = Y_singletrial(:, 2:end) - Y_singletrial(:, 1:end-1);
    [model, R2, whiteness, Y_hat,Y_test_plus_hat, runtime, R2_lagremoved,whiteness_lagremoved]=linear_AR(delta_y,include_W,n_AR_lags,W_mask,kStep,0,[]);
    Results_shamhceeg_subj1(i).model=model;
    Results_shamhceeg_subj1(i).R2=R2;
    Results_shamhceeg_subj1(i).Y_hat=Y_hat;
    Results_shamhceeg_subj1(i).Y_test_plus_hat=Y_test_plus_hat;
    Results_shamhceeg_subj1(i).whiteness=whiteness;
    Results_shamhceeg_subj1(i).runtime=runtime;
    Results_shamhceeg_subj1(i).R2_lagremoved=R2_lagremoved;
    Results_shamhceeg_subj1(i).whiteness_lagremoved=whiteness_lagremoved;
end
 

StepsNumber=(2000-StartStep)+1;
Subj=shamhceeg{1,1};
Y_original=Subj(12:14,:,:);

Y_hat_total=zeros(10,27,2000);

for i=1:10
    Y_hat_total(i,:,:)=Results_shamhceeg_subj1(1,i).Y_hat;
end

Y_hat_total_compare=Y_hat_total(:,:,StartStep:2000);
deltaY_hat_total_compare_trial1=Y_hat_total_compare(1,12:14,:);
deltaY_hat_total_compare_trial1=reshape(deltaY_hat_total_compare_trial1,3,StepsNumber);

Y_original_compare=Y_original(:,StartStep:2000,:);

Y_original_compare_trial1=Y_original_compare(:,:,1);

% Initialize the delta_y matrix with zeros
delta_y_compare = zeros(size(Y_original_compare_trial1));

% Compute delta y (y(t) - y(t-1))
delta_y_compare(:, 2:end) = Y_original_compare_trial1(:, 2:end) - Y_original_compare_trial1(:, 1:end-1);
StartTime=StartStep/1000;
time_axis = linspace(StartTime, 2, StepsNumber);

% Plot EEG for each Estimated and Original
figure;
hold on;
plot(time_axis, deltaY_hat_total_compare_trial1(1,:), 'r', 'LineWidth', 3.5, 'Color', [1 0 0 0.5]); % Red with 50% transparency
hold on;
plot(time_axis, delta_y_compare(1,:), 'b', 'LineWidth', 3.5, 'Color', [0 0 1 0.5]); % Blue with 50% transparency
hold off;
% Labeling
fontSize = 14; % Whatever you want.
xlabel('Time (s)','FontSize', fontSize);
ylabel('Voltage(uV)','FontSize', fontSize);
title('Original and estimated Electrode 12 EEG waveform','FontSize', fontSize);
legend('Estimated', 'Original','FontSize', fontSize);
grid on;
hold off;
% Electrode 13
% Plot EEG for each Estimated and Original
figure;
hold on;
%Efficient type of trials
plot(time_axis, deltaY_hat_total_compare_trial1(2,:), 'r', 'LineWidth', 3.5, 'Color', [1 0 0 0.5]); % Red with 50% transparency
hold on;
plot(time_axis, delta_y_compare(2,:), 'b', 'LineWidth', 3.5, 'Color', [0 0 1 0.5]); % Blue with 50% transparency
hold off;
fontSize = 14; % Whatever you want.
% Labeling
xlabel('Time (s)','FontSize', fontSize);
ylabel('Voltage(uV)','FontSize', fontSize);
title('Original and estimated Electrode 13 EEG waveform','FontSize', fontSize);
legend('Estimated', 'Original','FontSize', fontSize);
grid on;
hold off;

% Electrode 14
% Plot EEG for each Estimated and Original
figure;
hold on; 
%Efficient type of trials
plot(time_axis, deltaY_hat_total_compare_trial1(3,:), 'r', 'LineWidth', 3.5, 'Color', [1 0 0 0.5]); % Red with 50% transparency
hold on;
plot(time_axis, delta_y_compare(3,:), 'b', 'LineWidth', 3.5, 'Color', [0 0 1 0.5]); % Blue with 50% transparency
hold off;
% Labeling
xlabel('Time (s)','FontSize', fontSize);
ylabel('Voltage(uV)','FontSize', fontSize);
title('Original and estimated Electrode 14 EEG waveform','FontSize', fontSize);
legend('Estimated', 'Original','FontSize', fontSize);
grid on;
hold off;
 

%% Plotting box plots

trialsR2=zeros(27,10);
R2_MeanOfElectrodes_shamhc=zeros(10,22);

for i = 1:22
    % Construct the name of the struct dynamically
    % Assign the struct to the Subjects array
    Variable = Results_shamhceeg(i).data;
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










