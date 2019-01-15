% Jake Son
% Child Mind Institute

%% Prep

clear;clc;close all;
cd /home/matlab/Jake/automagic-master

% Need to change filepath order as follows:
% /home/matlab/matlab2016b
% /home/matlab/Downloads/eeglab14_1_2b

%% Check Data Quality

% filepath = '/data2/Projects/Jake_matlab/data_20/NDARAC350BZ0/results/RestingState/gip_RestingState.mat';
% load(filepath)
% [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
% eeglab redraw
% 
% automagic.rate
% automagic.qualityScore

%% Microstate Estimation

eeglab

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAA075AMK/results/RestingState/gip_RestingState.mat';
% filepath = '/data2/Projects/Jake_matlab/data_20_peer/NDARAA117NEJ/results/ThePresent/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAA112DMH/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAB793GL3/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAC350BZ0/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAC853DTE/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAD232HVV/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAD481FXF/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAE012DGA/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAE199TDD/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAE828CML/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAEZ493ZJ/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAG584XLU/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAH503YG1/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAJ366ZFA/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw


filepath = '/data2/Projects/Jake_matlab/data_20/NDARAM048AFP/results/RestingState/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20/NDARAM277WZT/results/RestingState/gp_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAM704GKZ/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAN385MDH/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAP359UM6/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAV610EY3/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBF176LPM/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBF805EHN/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBG574KF4/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBJ159HXB/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBM173BJG/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBR740NKV/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARDT528ZZJ/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARDV088AA3/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARDY150ZP9/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFA402LMW/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFD316UD2/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFG757CEU/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFR108JNB/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFT305CG1/gp_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARGA056TMW/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARGJ878ZP4/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARGT551AFK/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARHD507TEF/gip_RestingState.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

num_sub = 38;

[EEG, ALLEEG] = pop_micro_selectdata( EEG, ALLEEG, 'datatype', 'spontaneous',...
'avgref', 1, ...
'normalise', 1, ... % or 0
'MinPeakDist', 30, ... % or 30
'Npeaks', 1000, ... % or 1000
'GFPthresh', 1, ... % Lower threshold = less data used, since rejection threshold is lower (by standard deviation)
'dataset_idx', 1:num_sub);

[ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
eeglab redraw

[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, i, 'retrieve', num_sub+1, 'study', 0);
eeglab redraw

EEG = pop_micro_segment( EEG, 'algorithm', 'modkmeans', ...
'sorting', 'Global explained variance', ...
'Nmicrostates', 4:6, ...
'verbose', 1, ...
'normalise', 1, ...
'Nrepetitions', 50, ... % Max
'max_iterations', 1000, ...
'threshold', 1e-06, ...
'fitmeas', 'CV',...
'optimised',1);

[ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

figure;MicroPlotTopo( EEG, 'plot_range', [] );

EEG = pop_micro_selectNmicro( EEG);
[ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

%% Load Movie EEG Data after Estimating Microstates

num_vid = 29;

filepath = '/data2/Projects/Jake_matlab/data_20_peer/NDARAA117NEJ/results/ThePresent/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAA948VFH/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20_peer/NDARAB793GL3/results/ThePresent/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20_peer/NDARAC350BZ0/results/ThePresent/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20_peer/NDARAC350XUM/results/ThePresent/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20_peer/NDARAC853DTE/results/ThePresent/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/data_20_peer/NDARAD615WLJ/results/ThePresent/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAM704GKZ/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAN385MDH/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAP359UM6/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARAV610EY3/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBF176LPM/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBF805EHN/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBG574KF4/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBJ159HXB/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBM173BJG/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARBX974XDR/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARCW933FD5/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARDC987BMU/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARDT528ZZJ/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARDY150ZP9/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFA402LMW/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFG757CEU/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFR108JNB/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARFT305CG1/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARGA056TMW/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARGJ878ZP4/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARGT551AFK/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

filepath = '/data2/Projects/Jake_matlab/5rating_eeg_data_1_16_19_presentation_results/NDARHD507TEF/gip_Video4.mat';
load(filepath)
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
EEG = pop_resample(EEG, 125);
EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

%% Backfitting and Statistical Analysis

for i = num_sub+2:num_sub+1+num_vid

    fprintf('Importing prototypes and backfitting for dataset %i\n',i)
    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'retrieve',i,'study',0);
    EEG = pop_micro_import_proto( EEG, ALLEEG, num_sub+1);

    EEG = pop_micro_fit( EEG, 'polarity', 0 );

    EEG = pop_micro_smooth( EEG, 'label_type', 'backfit', ...
    'smooth_type', 'reject segments', ...
    'minTime', 30, ...
    'polarity', 0 );

    EEG = pop_micro_stats( EEG, 'label_type', 'backfit', ...
    'polarity', 0 );
    [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

end



%% Export  microstate sequence to csv file

for i = num_sub+2:num_sub+1+num_vid

    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'retrieve', i, 'study', 0);
    eeglab redraw
    
    labels = EEG.microstate.fit.labels;
    csvwrite(char(strcat('/home/matlab/Desktop/labels/microstate_', string(i), '.csv')), labels);

end









%% Statistical Analysis Old

files = dir('/data2/Projects/Jake_matlab/data_20/');

for folder = 1:length
    
    ['/data2/Projects/Jake_matlab/data_20/' folder.name '/results/RestingState/gip_RestingState.mat']
    
end

%% Older Toolbox

for i=83:size(EID, 1)
% for i=1:5
    
    sub=EID(i,:);
    files = dir(['/home/matlab/Downloads/eeglab14_1_2b/automagic_103_hbn_103_results/' sub]);
    load(['/home/matlab/Downloads/eeglab14_1_2b/automagic_103_hbn_103_results/' sub '/' files(4).name])
    [EEG.event.latency] = EEG.event.sample; EEG.event = orderfields(EEG.event,[1:1,8,2:7]); EEG.event = rmfield(EEG.event,'sample');
    EEG = pop_epoch(EEG, {'30 '}, [0 20]);
    EEG = pop_resample(EEG, 125);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
    eeglab redraw
    
end

num_sub = i;

[EEG, ALLEEG] = pop_micro_selectdata( EEG, ALLEEG, 'datatype', 'spontaneous',...
'avgref', 1, ...
'normalise', 1, ...
'MinPeakDist', 30, ...
'Npeaks', 1000, ...
'GFPthresh', 3, ...
'dataset_idx', 1:num_sub);

[ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
eeglab redraw

[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, i, 'retrieve', i+1, 'study', 0);
eeglab redraw

EEG = pop_micro_segment( EEG, 'algorithm', 'modkmeans', ...
'sorting', 'Global explained variance', ...
'Nmicrostates', 4:8, ...
'verbose', 1, ...
'normalise', 1, ...
'Nrepetitions', 50, ...
'max_iterations', 1000, ...
'threshold', 1e-06, ...
'fitmeas', 'CV',...
'optimised',1);

[ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

figure;MicroPlotTopo( EEG, 'plot_range', [] );

EEG = pop_micro_selectNmicro( EEG);
[ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

for i = 1:num_sub

    fprintf('Importing prototypes and backfitting for dataset %i\n',i)
    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'retrieve',i,'study',0);
    EEG = pop_micro_import_proto( EEG, ALLEEG, num_sub+1);

    EEG = pop_micro_fit( EEG, 'polarity', 0 );

    EEG = pop_micro_smooth( EEG, 'label_type', 'backfit', ...
    'smooth_type', 'reject segments', ...
    'minTime', 30, ...
    'polarity', 0 );

    EEG = pop_micro_stats( EEG, 'label_type', 'backfit', ...
    'polarity', 0 );
    [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

end

