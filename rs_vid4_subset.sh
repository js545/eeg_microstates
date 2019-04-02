# Jake Son
# Child Mind Institute
# Select participants with raw RestingState and Video4 data (.mat format)

cd "/data2/HBN/EEG/data"

data_dir='/data2/HBN/EEG/data'
output_file='/data2/Projects/Jake_matlab/microstates_project/eid_list_full.txt'

for sub in $(ls $data_dir); do

    rs_path=$data_dir/$sub/'EEG/raw/mat_format/RestingState.mat'
    mv_path=$data_dir/$sub/'EEG/raw/mat_format/Video4.mat'

    if [ -f $rs_path ] && [ -f $mv_path ]; then echo $sub >> $output_file; fi

done


