# dsi_assignment2

# DSI Assignment 2
This repository contains my Assignment 1 shell script (assignment1.sh).

## Description
The purpose of Assignment 1 is to write a shell script that will:
1. Print all types of parking infractions.
2. Print the mean, min, and max of set_fine_amounts.
3. Save all "Park on municipal property" infractions and associated observations (infraction_description, set_fine_amount, and location2) into a separate csv file.

## Usages
assignment1.sh can quickly generate types of parking infractions, calculations of set_fine_amounts (mean, min, and max) and create a csv file of all "Park on municipal propety" infractions using Toronto parking ticket datasets from any year.

You may revise the code and substitute "Park on municipal property" with any other infractions to create a csv file that will pull the relevant data to that infraction instead.

```bash
# save all "PARK ON MUNICIPAL PROPERTY" infractions with associated set_fine_amount and location2 observations to new_parking.csv file
write_csv() {
	cut -d, -f4,5,8 $csv_file > temp_new_parking.csv # cut desired observation columns from parking.csv dataset to temporary working temp_new_parking.csv file
	head -n1 temp_new_parking.csv > new_parking.csv # extract header row and save 
	grep "PARK ON MUNICIPAL PROPERTY" temp_new_parking.csv >> new_parking.csv # identify all "PARK ON MUNICIPAL PROPERTY" infraction entries and move to new_parking.csv file
	rm temp_new_parking.csv # remove temporary working temp_new_parking.csv file
	echo "New_parking.csv file has been created." # print statement to inform user new csv file has been created
```

## Installation
If you are on Windows system: download and install [Ubuntu](https://ubuntu.com/download) if you do not have it installed on your computer already. 

If you are on MacOS system: no additional software installation is required.

The following instructions will apply to all users:
1. Download the [Toronto parking ticket data](https://open.toronto.ca/dataset/parking-tickets/) at Toronto's Open Data Portal on your computer.
2. Download assignment1.sh on your computer. Both the parking data csv file and assignment1.sh should be stored in the same folder.
3. Run assignment1.sh with the parking data csv file as the first positional parameter.
```bash
./assignment1.sh parking.csv
```

## Support
Please contact [Kristy](mailto:kristyyiu@hotmail.com) for any additional support.

## Contributing
Pull requests are welcome. For major changes, please contact [Kristy](mailto:kristyyiu@hotmail.com) to discuss first.
