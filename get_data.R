if(! file.exists("household_power_consumption.txt")) {
	if(! file.exists("exdata_data_household_power_consumption.zip")) {
		download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
		destfile = "exdata_data_household_power_consumption.zip",
		method = "curl")
	}
	unzip("exdata_data_household_power_consumption.zip")
}
