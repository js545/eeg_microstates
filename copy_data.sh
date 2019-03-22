# Jake Son
# Child Mind Institute
# Copies raw EEG data for Automagic analysis

eid_file='/data2/Projects/Jake_matlab/microstates_project/eid_list.txt'
data_dir='/data2/HBN/EEG/data'
copy_data_dir='/data2/Projects/Jake_matlab/microstates_project/raw_data/'

for participant in $(cat $eid_file); do

    mkdir $copy_data_dir/$participant/
    cp $data_dir/$participant/'EEG/raw/mat_format/RestingState.mat' $copy_data_dir/$participant/'RestingState.mat'
    cp $data_dir/$participant/'EEG/raw/mat_format/Video4.mat' $copy_data_dir/$participant/'Video4.mat'

done
