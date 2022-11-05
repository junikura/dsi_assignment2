#!/bin/bash

# define csv_file as global positional parameter
csv_file=$1

# list all parking infractions (column 4) in parking.csv
infraction_description() {
	echo "Here are the types of parking infractions:"  # print header titled "infraction_description"
	cut -d, -f4 < $csv_file | sort | uniq | head -n -1 # output all unique parking infractions from column 4; remove last line of sorted list (header of csv) [ref 1]
	return
}

infraction_description # run infraction_description function

# function to print mean set_fine_amount [ref 2, 3] 
mean() {
	awk -F',' 'NR > 1 {
		sum += $5
	}
	END {
		print "Mean set_fine_amount = "sum/(NR - 1)
	}' $csv_file
}

mean # run mean function

# function to print min and max set_fine_amount using loop [ref 4] 
min_max() {
	cut -d, -f5 $csv_file | sort -n | {
		read line
		echo "Min set_fine_amount = $line"
		while read line; do 
			max=$line; 
		done
		echo "Max set_fine_amount = $max"
	}
}

min_max # run min_max function

# save all "PARK ON MUNICIPAL PROPERTY" infractions with associated set_fine_amount and location2 observations to new_parking.csv file
write_csv() {
	cut -d, -f4,5,8 $csv_file > temp_new_parking.csv # cut desired observation columns from parking.csv dataset to temporary working temp_new_parking.csv file
	head -n1 temp_new_parking.csv > new_parking.csv # extract header row and save 
	grep "PARK ON MUNICIPAL PROPERTY" temp_new_parking.csv >> new_parking.csv # identify all "PARK ON MUNICIPAL PROPERTY" infraction entries and move to new_parking.csv file
	rm temp_new_parking.csv # remove temporary working temp_new_parking.csv file
	echo "New_parking.csv file has been created." # print statement to inform user new csv file has been created
}

write_csv # run write_csv function

# REFERENCES
# ref 1: https://superuser.com/questions/543950/opposite-of-tail-all-lines-except-the-last-n-lines [specific section: original response by user191638 on Jan 30, 2013]
# ref 2: https://unix.stackexchange.com/questions/369269/finding-average-excluding-the-first-row
# ref 3: https://unix.stackexchange.com/questions/96031/sum-the-values-in-a-column-except-the-header [specific section: original response by slm on Oct 15, 2013]
# ref 4: https://stackoverflow.com/questions/29783990/awk-find-minimum-and-maximum-in-column [specific section: original response by glenn jackman on Apr 22, 2015]