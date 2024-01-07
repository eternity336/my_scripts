# Script for combining usernames from multiple csv files.
# Created by: Joshua Ochsankehl

param(
    # Directory where the user list csv file are located.
    # csv should have a column titled 'user' and be a list of names.
    $dir='csvs'
)

#pulls a list of files in directory.
$files=$(ls $dir *.csv)

# Creates an empty user list
$users=@()

# loops through the csv files
foreach ($file in $files.name) {
    $users += @(Import-Csv -Path "$dir\$file")
}

# Returns sorted list of usernames from the joined csv files
return $users.user | sort