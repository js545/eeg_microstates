% Jake Son
% Child Mind Institute

%% Prep

clear;clc;close all;
cd /home/matlab/Jake/automagic-master

% Need to change filepath order as follows:
% /home/matlab/matlab2016b
% /home/matlab/Downloads/eeglab14_1_2b

eeglab

datapath = '/data2/Projects/Jake_matlab/microstates_project/raw_data_microstates_results/';
subjects = dir(datapath);

%% Load RestingState data

highquality_RS = 0;

for i = 1:length(subjects)
    if strfind(subjects(i).name, 'NDAR') 
        if ~strcmp(subjects(i).name, 'NDARPD517MDH') && ~strcmp(subjects(i).name, 'NDARPX219TW0')
        
            % Only selects files with "good" quality data, indicated by "g" at
            % beginning of the filename

            RS_file = strcat(datapath, subjects(i).name, '/gp_RestingState.mat');
            RS_file2 = strcat(datapath, subjects(i).name, '/gip_RestingState.mat');

            if exist(RS_file, 'file')
                load(RS_file)
                EEG = pop_eegfiltnew(EEG, 1, 0);
                EEG = pop_eegfiltnew(EEG, 0, 30);
                EEG = pop_resample(EEG, 125);
                EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
                eeglab redraw  
                highquality_RS = highquality_RS+1;
                
            elseif exist(RS_file2, 'file')
                load(RS_file2)
                EEG = pop_eegfiltnew(EEG, 1, 0);
                EEG = pop_eegfiltnew(EEG, 0, 30);
                EEG = pop_resample(EEG, 125);
                EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
                eeglab redraw
                highquality_RS = highquality_RS+1;
                
            end
        end
    end
end

disp([num2str(highquality_RS), ' RestingState files added'])

%% Estimate Microstates

[EEG, ALLEEG] = pop_micro_selectdata( EEG, ALLEEG, 'datatype', 'spontaneous',...
'avgref', 1, ...
'normalise', 1, ... % or 0
'MinPeakDist', 30, ... % or 30
'Npeaks', 1000, ... % or 1000
'GFPthresh', 1, ... % Lower threshold = less data used, since rejection threshold is lower (by standard deviation)
'dataset_idx', 1:highquality_RS);

[ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
eeglab redraw

[ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, i, 'retrieve', highquality_RS+1, 'study', 0);
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

%% Load Video4 data
highquality_Video4 = 0;

for i = 1:length(subjects)
    if strfind(subjects(i).name, 'NDAR')
        if ~strcmp(subjects(i).name, 'NDARFA402LMW') && ~strcmp(subjects(i).name, 'NDARFT305CG1') && ~strcmp(subjects(i).name, 'NDARRK882CLT')
        
            % Only selects files with "good" quality data, indicated by "g" at
            % beginning of the filename

            Video4_file = strcat(datapath, subjects(i).name, '/bp_Video4.mat');
            Video4_file2 = strcat(datapath, subjects(i).name, '/bip_Video4.mat');

            if exist(Video4_file, 'file')
                load(Video4_file)
                EEG = pop_eegfiltnew(EEG, 1, 0);
                EEG = pop_eegfiltnew(EEG, 0, 30);
                EEG = pop_resample(EEG, 125);
                EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
                eeglab redraw  
                highquality_Video4 = highquality_Video4+1;
                
            elseif exist(Video4_file2, 'file')
                load(Video4_file2)
                EEG = pop_eegfiltnew(EEG, 1, 0);
                EEG = pop_eegfiltnew(EEG, 0, 30);
                EEG = pop_resample(EEG, 125);
                EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
                eeglab redraw
                highquality_Video4 = highquality_Video4+1;
                
            end
        end
    end
end

disp([num2str(highquality_Video4), ' Video4 files added'])

%% Backfit onto RestingState

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

%% Backfit onto Video4

for i = highquality_RS+2:highquality_RS+1+highquality_Video4

    fprintf('Importing prototypes and backfitting for dataset %i\n',i)
    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'retrieve',i,'study',0);
    EEG = pop_micro_import_proto( EEG, ALLEEG, highquality_RS+1);

    EEG = pop_micro_fit( EEG, 'polarity', 0 );

    EEG = pop_micro_smooth( EEG, 'label_type', 'backfit', ...
    'smooth_type', 'reject segments', ...
    'minTime', 30, ...
    'polarity', 0 );

    EEG = pop_micro_stats( EEG, 'label_type', 'backfit', ...
    'polarity', 0 );
    [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

end








