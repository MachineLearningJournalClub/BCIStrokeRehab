clc, close all, clear all


%PATIENT 1
load C:\Users\ventr\Downloads\BCI\paziente1\P1_pre_training
samples_Shift=8*fs;     % #samples in 8 seconds
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente1\P1_pre_training_filtered
pause

load C:\Users\ventr\Downloads\BCI\paziente1\P1_pre_test
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente1\P1_pre_test_filtered
pause

load C:\Users\ventr\Downloads\BCI\paziente1\P1_post_training
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente1\P1_post_training_filtered
pause

load C:\Users\ventr\Downloads\BCI\paziente1\P1_post_test
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente1\P1_post_test_filtered

%%
%PATIENT 2
load C:\Users\ventr\Downloads\BCI\paziente2\P2_pre_training                     
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente2\P2_pre_training_filtered
pause

load C:\Users\ventr\Downloads\BCI\paziente2\P2_pre_test
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente2\P2_pre_test_filtered


load C:\Users\ventr\Downloads\BCI\paziente2\P2_post_training
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente2\P2_post_training_filtered
pause

load C:\Users\ventr\Downloads\BCI\paziente2\P2_post_test
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente2\P2_post_test_filtered

%%
%PATIENT 3
load C:\Users\ventr\Downloads\BCI\paziente3\P3_pre_training                     
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente3\P3_pre_training_filtered

load C:\Users\ventr\Downloads\BCI\paziente3\P3_pre_test
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente3\P3_pre_test_filtered

load C:\Users\ventr\Downloads\BCI\paziente3\P3_post_training
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente3\P3_post_training_filtered

load C:\Users\ventr\Downloads\BCI\paziente3\P3_post_test
dataOut=preProcessing(y,fs,trig,samples_Shift);
save C:\Users\ventr\Downloads\BCI\paziente3\P3_post_test_filtered