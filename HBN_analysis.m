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
RS_sub_list = [];

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
                RS_sub_list = [RS_sub_list; subjects(i).name];
                
            elseif exist(RS_file2, 'file')
                load(RS_file2)
                EEG = pop_eegfiltnew(EEG, 1, 0);
                EEG = pop_eegfiltnew(EEG, 0, 30);
                EEG = pop_resample(EEG, 125);
                EEG = pop_selectevent( EEG, 'type',{'20'},'deleteevents','on');
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
                eeglab redraw
                highquality_RS = highquality_RS+1;
                RS_sub_list = [RS_sub_list; subjects(i).name];
                
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

% Save prototypes
save('/data2/Projects/Jake_matlab/microstates_project/prototypes.mat', 'EEG')

%% Load Video4 data

highquality_Video4 = 0;
video4_sub_list = [];

for i = 1:length(subjects)
    if strfind(subjects(i).name, 'NDAR')
        if ~strcmp(subjects(i).name, 'NDARFA402LMW') && ~strcmp(subjects(i).name, 'NDARFT305CG1') && ~strcmp(subjects(i).name, 'NDARRK882CLT')
        
            % Only selects files with "good" quality data, indicated by "g" at
            % beginning of the filename

            Video4_file = strcat(datapath, subjects(i).name, '/gp_Video4.mat');
            Video4_file2 = strcat(datapath, subjects(i).name, '/gip_Video4.mat');

            if exist(Video4_file, 'file')
                load(Video4_file)
                EEG = pop_eegfiltnew(EEG, 1, 0);
                EEG = pop_eegfiltnew(EEG, 0, 30);
                EEG = pop_resample(EEG, 125);
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
                eeglab redraw  
                highquality_Video4 = highquality_Video4+1;
                video4_sub_list = [video4_sub_list; subjects(i).name];
                
            elseif exist(Video4_file2, 'file')
                load(Video4_file2)
                EEG = pop_eegfiltnew(EEG, 1, 0);
                EEG = pop_eegfiltnew(EEG, 0, 30);
                EEG = pop_resample(EEG, 125);
                [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
                eeglab redraw
                highquality_Video4 = highquality_Video4+1;
                video4_sub_list = [video4_sub_list; subjects(i).name];
                
            end
        end
    end
end

disp([num2str(highquality_Video4), ' Video4 files added'])

%% Backfit onto RestingState and obtain statistics

for i = 1:highquality_RS

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

%% Backfit onto Video4 and obtain statistics

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

%% Save statistics

% Resting State
GEV_v = [];
Occurence1 = []; Occurence2 = []; Occurence3 = []; Occurence4 = [];
Duration1 = []; Duration2 = []; Duration3 = []; Duration4 = [];
Coverage1 = []; Coverage2 = []; Coverage3 = []; Coverage4 = [];

for i = 1:highquality_RS

    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'retrieve',i,'study',0);
    eeglab redraw
    
    GEVtotal = EEG.microstate.stats.GEVtotal;
    Occurence = EEG.microstate.stats.Occurence;
    Duration = EEG.microstate.stats.Duration;
    Coverage = EEG.microstate.stats.Coverage;
    GEV = EEG.microstate.stats.GEV;
    
    GEV_v = [GEV_v; GEVtotal];
    Occurence1 = [Occurence1; Occurence(1)]; Occurence2 = [Occurence2; Occurence(2)];
    Occurence3 = [Occurence3; Occurence(3)]; Occurence4 = [Occurence4; Occurence(4)]; 
    Duration1 = [Duration1; Duration(1)]; Duration2 = [Duration2; Duration(2)]; 
    Duration3 = [Duration3; Duration(3)]; Duration4 = [Duration4; Duration(4)]; 
    Coverage1 = [Coverage1; Coverage(1)]; Coverage2 = [Coverage2; Coverage(2)]; 
    Coverage3 = [Coverage3; Coverage(3)]; Coverage4 = [Coverage4; Coverage(4)]; 

end

RS_output = [GEV_v Occurence1 Occurence2 Occurence3 Occurence4 Duration1 Duration2 Duration3 Duration4 Coverage1 Coverage2 Coverage3 Coverage4];
csvwrite('/data2/Projects/Jake_matlab/microstates_project/rs_statistics.csv', RS_output);

% Video4
GEV_v = [];
Occurence1 = []; Occurence2 = []; Occurence3 = []; Occurence4 = [];
Duration1 = []; Duration2 = []; Duration3 = []; Duration4 = [];
Coverage1 = []; Coverage2 = []; Coverage3 = []; Coverage4 = [];

for i = highquality_RS+2:highquality_RS+1+highquality_Video4

    [ALLEEG, EEG, CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'retrieve',i,'study',0);
    eeglab redraw
    
    GEVtotal = EEG.microstate.stats.GEVtotal;
    Occurence = EEG.microstate.stats.Occurence;
    Duration = EEG.microstate.stats.Duration;
    Coverage = EEG.microstate.stats.Coverage;
    GEV = EEG.microstate.stats.GEV;
    
    GEV_v = [GEV_v; GEVtotal];
    Occurence1 = [Occurence1; Occurence(1)]; Occurence2 = [Occurence2; Occurence(2)];
    Occurence3 = [Occurence3; Occurence(3)]; Occurence4 = [Occurence4; Occurence(4)]; 
    Duration1 = [Duration1; Duration(1)]; Duration2 = [Duration2; Duration(2)]; 
    Duration3 = [Duration3; Duration(3)]; Duration4 = [Duration4; Duration(4)]; 
    Coverage1 = [Coverage1; Coverage(1)]; Coverage2 = [Coverage2; Coverage(2)]; 
    Coverage3 = [Coverage3; Coverage(3)]; Coverage4 = [Coverage4; Coverage(4)]; 

end

RS_output = [GEV_v Occurence1 Occurence2 Occurence3 Occurence4 Duration1 Duration2 Duration3 Duration4 Coverage1 Coverage2 Coverage3 Coverage4];
csvwrite('/data2/Projects/Jake_matlab/microstates_project/video4_statistics.csv', RS_output);










