% Main code for applying AR to our data

%Loading the dataset
load("shamdata_tlgo.mat")
load("stim7data_tlgo.mat")
load("stim8data_tlgo.mat")



%% Arranging data and apply method - shampd2eeg


Data=shampd2eeg{1,1};
Results_shampd2eeg_subj1 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj1(i).model=model;
    Results_shampd2eeg_subj1(i).R2=R2;
    Results_shampd2eeg_subj1(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj1(i).whiteness=whiteness;
    Results_shampd2eeg_subj1(i).runtime=runtime;


end
   

%% subj2

Data=shampd2eeg{1,2};
Results_shampd2eeg_subj2 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj2(i).model=model;
    Results_shampd2eeg_subj2(i).R2=R2;
    Results_shampd2eeg_subj2(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj2(i).whiteness=whiteness;
    Results_shampd2eeg_subj2(i).runtime=runtime;

end



%% 

Data=shampd2eeg{1,3};
Results_shampd2eeg_subj3 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj3(i).model=model;
    Results_shampd2eeg_subj3(i).R2=R2;
    Results_shampd2eeg_subj3(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj3(i).whiteness=whiteness;
    Results_shampd2eeg_subj3(i).runtime=runtime;

end


%%

Data=shampd2eeg{1,4};
Results_shampd2eeg_subj4 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj4(i).model=model;
    Results_shampd2eeg_subj4(i).R2=R2;
    Results_shampd2eeg_subj4(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj4(i).whiteness=whiteness;    
    Results_shampd2eeg_subj4(i).runtime=runtime;

end

 %% 

Data=shampd2eeg{1,5};
Results_shampd2eeg_subj5 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj5(i).model=model;
    Results_shampd2eeg_subj5(i).R2=R2;
    Results_shampd2eeg_subj5(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj5(i).whiteness=whiteness;
    Results_shampd2eeg_subj5(i).runtime=runtime;

end
 
 %% 

 Data=shampd2eeg{1,6};
Results_shampd2eeg_subj6 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj6(i).model=model;
    Results_shampd2eeg_subj6(i).R2=R2;
    Results_shampd2eeg_subj6(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj6(i).whiteness=whiteness;
    Results_shampd2eeg_subj6(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,7};
Results_shampd2eeg_subj7 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj7(i).model=model;
    Results_shampd2eeg_subj7(i).R2=R2;
    Results_shampd2eeg_subj7(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj7(i).whiteness=whiteness;
    Results_shampd2eeg_subj7(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,8};
Results_shampd2eeg_subj8 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj8(i).model=model;
    Results_shampd2eeg_subj8(i).R2=R2;
    Results_shampd2eeg_subj8(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj8(i).whiteness=whiteness;
    Results_shampd2eeg_subj8(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,9};
Results_shampd2eeg_subj9 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj9(i).model=model;
    Results_shampd2eeg_subj9(i).R2=R2;
    Results_shampd2eeg_subj9(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj9(i).whiteness=whiteness;
    Results_shampd2eeg_subj9(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,10};
Results_shampd2eeg_subj10 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj10(i).model=model;
    Results_shampd2eeg_subj10(i).R2=R2;
    Results_shampd2eeg_subj10(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj10(i).whiteness=whiteness;
    Results_shampd2eeg_subj10(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,11};
Results_shampd2eeg_subj11 = struct();

%n_subjs=1;
for i=1:10
 
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj11(i).model=model;
    Results_shampd2eeg_subj11(i).R2=R2;
    Results_shampd2eeg_subj11(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj11(i).whiteness=whiteness;
    Results_shampd2eeg_subj11(i).runtime=runtime;
end

 %%

 Data=shampd2eeg{1,12};
Results_shampd2eeg_subj12 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj12(i).model=model;
    Results_shampd2eeg_subj12(i).R2=R2;
    Results_shampd2eeg_subj12(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj12(i).whiteness=whiteness;
    Results_shampd2eeg_subj12(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,13};
Results_shampd2eeg_subj13 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj13(i).model=model;
    Results_shampd2eeg_subj13(i).R2=R2;
    Results_shampd2eeg_subj13(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj13(i).whiteness=whiteness;
    Results_shampd2eeg_subj13(i).runtime=runtime;
end
 %%

 Data=shampd2eeg{1,14};
Results_shampd2eeg_subj14 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj14(i).model=model;
    Results_shampd2eeg_subj14(i).R2=R2;
    Results_shampd2eeg_subj14(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj14(i).whiteness=whiteness;
    Results_shampd2eeg_subj14(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,15};
Results_shampd2eeg_subj15 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj15(i).model=model;
    Results_shampd2eeg_subj15(i).R2=R2;
    Results_shampd2eeg_subj15(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj15(i).whiteness=whiteness;
    Results_shampd2eeg_subj15(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,16};
Results_shampd2eeg_subj16 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj16(i).model=model;
    Results_shampd2eeg_subj16(i).R2=R2;
    Results_shampd2eeg_subj16(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj16(i).whiteness=whiteness;
    Results_shampd2eeg_subj16(i).runtime=runtime;
end
 %% 
 
Data=shampd2eeg{1,17};
Results_shampd2eeg_subj17 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj17(i).model=model;
    Results_shampd2eeg_subj17(i).R2=R2;
    Results_shampd2eeg_subj17(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj17(i).whiteness=whiteness;
    Results_shampd2eeg_subj17(i).runtime=runtime;
end
 %%

 Data=shampd2eeg{1,18};
Results_shampd2eeg_subj18 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj18(i).model=model;
    Results_shampd2eeg_subj18(i).R2=R2;
    Results_shampd2eeg_subj18(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj18(i).whiteness=whiteness;
    Results_shampd2eeg_subj18(i).runtime=runtime;
end
 %% 
 
 Data=shampd2eeg{1,19};
Results_shampd2eeg_subj19 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj19(i).model=model;
    Results_shampd2eeg_subj19(i).R2=R2;
    Results_shampd2eeg_subj19(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj19(i).whiteness=whiteness;
    Results_shampd2eeg_subj19(i).runtime=runtime;
end
 %% 

 Data=shampd2eeg{1,20};
Results_shampd2eeg_subj20 = struct();

%n_subjs=1;
for i=1:10
    Y_singletrial=Data(:,:,i);
    [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
    Results_shampd2eeg_subj20(i).model=model;
    Results_shampd2eeg_subj20(i).R2=R2;
    Results_shampd2eeg_subj20(i).Y_hat=Y_hat;
    Results_shampd2eeg_subj20(i).whiteness=whiteness;
    Results_shampd2eeg_subj20(i).runtime=runtime;
end
% %% 
% 
%  Data=shampd2eeg{1,22};
% Results_shampd2eeg_subj22 = struct();
% 
% %n_subjs=1;
% for i=1:10
%     Y_singletrial=Data(:,:,i);
%     [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
%     Results_shampd2eeg_subj22(i).model=model;
%     Results_shampd2eeg_subj22(i).R2=R2;
%     Results_shampd2eeg_subj22(i).Y_hat=Y_hat;
%     Results_shampd2eeg_subj22(i).whiteness=whiteness;
% 
%     Results_shampd2eeg_subj22(i).runtime=runtime;
% end
% 
% %% 
% 
%  Data=shampd2eeg{1,21};
% Results_shampd2eeg_subj21 = struct();
% 
% %n_subjs=1;
% for i=1:10
%     Y_singletrial=Data(:,:,i);
%     [model, R2, whiteness, Y_hat, runtime]=linear_AR(Y_singletrial,[],[],[],1,0,[]);
%     Results_shampd2eeg_subj21(i).model=model;
%     Results_shampd2eeg_subj21(i).R2=R2;
%     Results_shampd2eeg_subj21(i).Y_hat=Y_hat;
%     Results_shampd2eeg_subj22(i).whiteness=whiteness;
% 
%     Results_shampd2eeg_subj21(i).runtime=runtime;
% end


%% Save results


% Save all structs directly into a single file if they are already in the workspace
save('all_results_shampd2eeg.mat', 'Results_shampd2eeg_subj1', 'Results_shampd2eeg_subj2', 'Results_shampd2eeg_subj3', ...
     'Results_shampd2eeg_subj4', 'Results_shampd2eeg_subj5', 'Results_shampd2eeg_subj6', 'Results_shampd2eeg_subj7', ...
     'Results_shampd2eeg_subj8', 'Results_shampd2eeg_subj9', 'Results_shampd2eeg_subj10', 'Results_shampd2eeg_subj11', ...
     'Results_shampd2eeg_subj12', 'Results_shampd2eeg_subj13', 'Results_shampd2eeg_subj14', 'Results_shampd2eeg_subj15', ...
     'Results_shampd2eeg_subj16', 'Results_shampd2eeg_subj17', 'Results_shampd2eeg_subj18', 'Results_shampd2eeg_subj19', ...
     'Results_shampd2eeg_subj20');











































