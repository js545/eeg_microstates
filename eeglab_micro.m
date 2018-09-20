% Jake Son
% Child Mind Institute

clear;clc;close all;

eeglab

% for i=1:469
%     
%     if ratings{i,2}==5
%     
%         sub=ratings{i,1};
%         load(['/data2/HBN/EEG/data/' sub '/EEG/preprocessed/mat_format/RestingState.mat'])
%         
%     end
%     
% end

load('/home/matlab/Downloads/eeglab14_1_2b/automagic_raw_5_sub_results/NDARZT957CWG/nip_RestingState.mat')
% EEG=result; 
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
[EEG.event.latency] = EEG.event.sample; EEG.event = orderfields(EEG.event,[1:1,8,2:7]); EEG.event = rmfield(EEG.event,'sample');
EEG = pop_epoch(EEG, {'30 '}, [0 20]);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

load('/data2/HBN/EEG/data/NDARAD232HVV/EEG/preprocessed/mat_format/RestingState.mat')
EEG=result; 
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
[EEG.event.latency] = EEG.event.sample; EEG.event = orderfields(EEG.event,[1:1,8,2:7]); EEG.event = rmfield(EEG.event,'sample');
EEG = pop_epoch(EEG, {'30 '}, [0 20]);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw

load('/data2/HBN/EEG/data/NDARAP359UM6/EEG/preprocessed/mat_format/RestingState.mat')
EEG=result; 
EEG = pop_eegfiltnew(EEG, 1, 0);
EEG = pop_eegfiltnew(EEG, 0, 30);
[EEG.event.latency] = EEG.event.sample; EEG.event = orderfields(EEG.event,[1:1,8,2:7]); EEG.event = rmfield(EEG.event,'sample');
EEG = pop_epoch(EEG, {'30 '}, [0 20]);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
eeglab redraw


% % LEGACY
% 
% load('/data2/HBN/EEG/data/NDARAD232HVV/EEG/preprocessed/mat_format/RestingState.mat')
% remove_channel=find(mean(result.data')==0);
% result.data(remove_channel,:)=[];
% result.chanlocs(:,remove_channel)=[];
% 
% 
% EEG=result; 
% % [EEG, event_indices] = pop_selectevent(EEG, 'type', '30 ');
% EEGOUT = pop_eegfiltnew(EEG, 2, 20);
% [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
% [EEG.event.latency] = EEG.event.sample; EEG.event = orderfields(EEG.event,[1:1,8,2:7]); EEG.event = rmfield(EEG.event,'sample');
% eeglab redraw
% 
% load('NDARAP359UM6_rest.mat')
% EEG=result; 
% EEGOUT = pop_eegfiltnew(EEG, 2, 20);
% [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0);
% eeglab redraw
% 
% 
% [EEG, ALLEEG] = pop_micro_selectdata( EEG, ALLEEG, 'datatype', 'spontaneous',...
%     'avgref',1,'normalise',0,'MinPeakDist',10,'Npeaks',1000,'GFPthresh',1,'dataset_idx',2:3);
% 
% [ALLEEG, EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
% eeglab redraw
% 
% [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2, 'retrieve', 3);
% eeglab redraw
% 
% EEG = pop_micro_segment(EEG, 'algorithm','modkmeans',...
%     'sorting','Global explained variance', ...
%     'Nmicrostates',4,'verbose',1,'normalise',0,'Nrepetitions',50,'max_iterations',1000,...
%     'threshold',1e-06,'fitmeas','CV','optimised',1);
% 
% [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
% 
% figure;MicroPlotTopo(EEG, 'plot_range', 4);






