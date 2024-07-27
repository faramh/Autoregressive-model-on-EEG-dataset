% Main code for applying AR to our data

%Loading the dataset
load("shamdata_tlgo.mat")
load("stim7data_tlgo.mat")
load("stim8data_tlgo.mat")


%% Arranging data and apply method - Shamhceeg - 100 step ahead prediction

kStep=100;
StartStep=1601+kStep;

%n_subjs=1;
Data=shamhceeg{1,1};
Results_shamhceeg_subj1 = struct();

for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat,Y_test_plus_hat, runtime, R2_lagremoved,whiteness_lagremoved]=linear_AR(Y_singletrial,[],[],[],kStep,0,[]);
    Results_shamhceeg_subj1(i).model=model;
    Results_shamhceeg_subj1(i).R2=R2;
    Results_shamhceeg_subj1(i).Y_hat=Y_hat;
    Results_shamhceeg_subj1(i).whiteness=whiteness;
    Results_shamhceeg_subj1(i).runtime=runtime;
    Results_shamhceeg_subj1(i).R2_lagremoved=R2_lagremoved;
    Results_shamhceeg_subj1(i).whiteness_lagremoved=whiteness_lagremoved;


end
   


%% Plot Y and Yhat in one plot - Electrode 12



StepsNumber=(2000-StartStep)+1;
Subj=shamhceeg{1,1};
Y_original=Subj(12:14,:,:);

Y_hat_total=zeros(10,27,2000);

for i=1:10
    Y_hat_total(i,:,:)=Results_shamhceeg_subj1(1,i).Y_hat;
end

Y_hat_total_compare=Y_hat_total(:,:,StartStep:2000);
Y_hat_total_compare_trial1=Y_hat_total_compare(1,12:14,:);
Y_hat_total_compare_trial1=reshape(Y_hat_total_compare_trial1,3,StepsNumber);

Y_original_compare=Y_original(:,StartStep:2000,:);

Y_original_compare_trial1=Y_original_compare(:,:,1);

StartTime=StartStep/1000;
time_axis = linspace(StartTime, 2, StepsNumber);

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

ylim([-7 10])


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

%% Changing the test range:


kStep=1;
StartStep=1601+kStep;

Data=shamhceeg{1,1};
Results_shamhceeg_subj1 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    % Initialize the delta_y matrix with zeros
    delta_y = zeros(size(Y_singletrial));

    % Compute delta y (y(t) - y(t-1))
    delta_y(:, 2:end) = Y_singletrial(:, 2:end) - Y_singletrial(:, 1:end-1);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(delta_y,[],102,[],kStep,0,[0.8 1]);
    Results_shamhceeg_subj1(i).model=model;
    Results_shamhceeg_subj1(i).R2=R2;
    Results_shamhceeg_subj1(i).Y_hat=Y_hat;
    Results_shamhceeg_subj1(i).whiteness=whiteness;
    Results_shamhceeg_subj1(i).runtime=runtime;


end
 



StepsNumber=(2000-StartStep)+1;
Subj=shamhceeg{1,1};
Y_original=Subj(12:14,:,:);

Y_hat_total=zeros(10,27,2000);

for i=1:10
    Y_hat_total(i,:,:)=Results_shamhceeg_subj1(1,i).Y_hat;
end

Y_hat_total_compare=Y_hat_total(:,:,StartStep:2000);
Y_hat_total_compare_trial1=Y_hat_total_compare(1,12:14,:);
Y_hat_total_compare_trial1=reshape(Y_hat_total_compare_trial1,3,StepsNumber);

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
 

plot(time_axis, Y_hat_total_compare_trial1(1,:), 'r', 'LineWidth', 3.5, 'Color', [1 0 0 0.5]); % Red with 50% transparency
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

ylim([-7 10])


%% Arranging data and apply method - Shamhceeg - 100 step ahead prediction

include_W = 1;
n_AR_lags = 2;
W_mask = 'full';   


kStep=2;
StartStep=1601+kStep;

Data=shamhceeg{1,1};
Results_shamhceeg_subj1 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat,Y_test_plus_hat, runtime]=linear_AR(Y_singletrial,include_W,n_AR_lags,W_mask,kStep,0,[]);
    Results_shamhceeg_subj1(i).model=model;
    Results_shamhceeg_subj1(i).R2=R2;
    Results_shamhceeg_subj1(i).Y_hat=Y_hat;
    Results_shamhceeg_subj1(i).whiteness=whiteness;
    Results_shamhceeg_subj1(i).runtime=runtime;


end



StepsNumber=(2000-StartStep)+1;
Subj=shamhceeg{1,1};
Y_original=Subj(12:14,:,:);

Y_hat_total=zeros(10,27,2000);

for i=1:10
    Y_hat_total(i,:,:)=Results_shamhceeg_subj1(1,i).Y_hat;
end

Y_hat_total_compare=Y_hat_total(:,:,StartStep:2000);
Y_hat_total_compare_trial1=Y_hat_total_compare(1,12:14,:);
Y_hat_total_compare_trial1=reshape(Y_hat_total_compare_trial1,3,StepsNumber);

Y_original_compare=Y_original(:,StartStep:2000,:);

Y_original_compare_trial1=Y_original_compare(:,:,1);

StartTime=StartStep/1000;
time_axis = linspace(StartTime, 2, StepsNumber);

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

ylim([-7 10])

% Electrode 13
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

% Electrode 14
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










