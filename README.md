# INF115 Compulsory Exercise 3

## DUE DATE: 9th of May 23:59

## Intro

For this third obligatory INF115 assignment we will be working with PHP.
Specifically, we will write PHP and HTML code that connects to an SQL database. You can find the files for the exercise at https://github.com/eliasdjup/INF115-CA3. 

## PHP Environment
We recommend you to complete this assignment using the XAMPP software stack. 
You need to setup this stack on your own computer. You can download the latest release of XAMPP from
https://www.apachefriends.org/index.html.

Installation instructions can be found in the XAMPP FAQ for the respective operating systems.

- **Linux**: https://www.apachefriends.org/faq_linux.html
- **Windows**: https://www.apachefriends.org/faq_windows.html
- **Mac OS**: https://www.apachefriends.org/faq_osx.html

## Dataset
For some of the tasks you will be working with the “bysykkel” dataset available at https://github.com/eliasdjup/INF115-CA3.

To setup the database:

1. Download the `bysykkel.sql` file from the above repository.
2. Access the interface at [phpMyAdmin](http://localhost/phpmyadmin).
3. Go to the [import](http://localhost/phpmyadmin/server_import.php) tab at the top of the window.
4. Upload the `bysykkel.sql` file, and click "**Go**".

*You can also paste the contents of the  `bysykkel.sql` file into the SQL field in phpMyAdmin.*

You should now have a database called `bysykkel`, containing the tables
`users`, `subscriptions`, `bikes`, `stations` and `trips`.

## Development Environment
This task is web oriented and you are supposed to connect your front-end (HTML and PHP) to the backend (SQL on XAMPP).
To do this you must place the given `CE3.php` file inside XAMPP `htdocs` folder. Its location differs between operating systems.

The `CE3.php` file can be found at https://github.com/eliasdjup/INF115-CA3

Once you have done this, you can see the resulting webpage in your browser at [localhost/CE3.php](http://localhost/CE3.php)

### Windows and Mac OS
 
Refer to the XAMPP FAQ given above.

Some other useful links:

**Windows**: (https://www.edureka.co/blog/how-to-run-a-php-program-in-xampp) 

(https://www.techwalla.com/articles/how-to-run-a-php-file-in-xampp)

**Mac OS**: (https://www.webucator.com/how-to/how-install-start-test-xampp-on-mac-osx.cfm)


### Linux

If you have downloaded the `CE3.php` file to you `Downloads` directory you can use the following terminal command to move the folder to the right place.

```shell
mv ~/Downloads/CE3.php /opt/lampp/htdocs/
```

*You might need to change the permission of the files you just placed in your htdocs to be able to write and save. Do this by running the following command in your terminal.*


```shell
sudo chmod -R 777 /opt/lampp/htdocs
```

Once this is done, open the `/opt/lampp/htdocs/CE3.php` file with your favorite text editor or IDE and write your solutions.


## Submission

Write the answer to each of the tasks in the `CE3.php` file provided. Only this file is to be submitted.

**Do not** create any additional files.

We will use a local version of the `bysykkel` database to test your submissions so be careful **not** to change the names of entities and
attributes in the database.
Please do not set passwords in your script.

**Make sure that your code runs locally on your computer before delivery.**

Points will be subtracted if there are errors when running your submission.

### **Submit on Mitt UiB by 9th of May 23:59**

## Task 1: PHP and HTML Form (27%)

### a)
Write a PHP script to output your name and student id in boldface, on seperate lines.

*Tip: use `echo "<br>";` to print a newline in PHP*

### b)
Create an HTML form that asks for `name`, `phone number` and `email`.
The form should have a submit and a reset button. 

All the fields in the form should be required (they can't be empty).

Print the three input values below the form when it is submitted.

*Tip: use `?` as the action of the HTML form to return to the same page.
To check if a value is set by the form use the PHP function `isset`.*

*Example:*

```php
<form action="?" method="post">
        ...
</form>

<?php
if (isset($_POST[YOUR_VALUE])){
        ...
}
?>
```

### c)

You should implement a PHP method that tests the values that were submitted in to the HTML form in task **1b** for correctness.
Print the input together with `Valid` or `Not valid` after the input.
- A valid name should only contain letters `A-Å`
- A valid email should contain an `@`-sign.
- A valid phone number should have exactly 8 digits.

*Example:*

```
Mons Monsen - Valid
mons@monsen.no - Valid
123456789 - Not valid
```


## Task 2: PHP for Database Queries (27%)

### a)
Display a HTML table of the users's name, sorted in alphabetical order.

### b)
Display a HTML table of all of the unique bike names together with their status.

### c)
Display a HTML table of all the SQL tables in the `bysykkel` database (`users`,`bikes`...), together with the number of rows in the table.

*Example:*
| Table | Rows |
|-------|------|
| bikes | 15   |


## Task 3: More queries (24%)
### a)
Write a PHP script that displays an HTML table showing all of the attributes of each of the tables
in the `bysykkel` database. The table name should be in the left hand column and the attribute names in the right hand column.

*Example:*

| Table 	| Attributes            |
|------------	|----------------------	|
| users         | user_id,name,phone_number 	|

*Tip: You can use the SQL `GROUP_CONCAT()` function to list all values in a grouping when using `GROUP BY`*

### b)
Using PHP, query the bysykkel database and produce a HTML table that shows how many trips have ended on each station.
The table should consist of 3 rows. The station ID, the name of the station and the number of trips that have ended on the station.

*Example:*

| station_id 	| Name                 	| Number of trips 	|
|------------	|----------------------	|-----------------	|
| 1          	| Høyteknologisenteret 	| 2               	|

### c)
Write a script that queries the `bysykkel` database and returns a table showing user ID,
username, and how many subscriptions they purchased in the years 2018, 2019, 2020 and 2021. 

*Tip: you can use the SQL `YEAR`function to get the year of a timestamp*
*Tip: ypu can use the CASE function to count occurences in groupings. `CASE VALUE WHEN X then 1 else 0 end)`*

*Example:*

| user_id | Name          | 2018 | 2019 | 2020 | 2021 |
|---------|--------------------|------|------|------|------|
| 12      | Madeleine Sørensen | 0    | 1    | 1    | 0    |

## Task 4: HTML Database Interface (22%)

Create a HTML selector where you can choose one of the 5 stations and the click Submit.

Then a PHP script should return a table where the first column is the station name, the second column the availability. 

The availability of the stations should be represented as a percentage of the maximum
spots at the station.
*For example: 5 available spots and 10 max spots = 50% availability.*

The last column should be a link to the location of the station represented by a link to Google Maps using the latitude and longitude attributes of the `station` table.

Given the latitude and longitude, such a link would be:

        https://www.google.com/maps?q=LATITUDE,LONGITUDE

where LATITUDE and LONGITUDE are the values for latitude and longitude, respectively.

*Example:*

| Name 	| Availability                 	| Location 	|
|------------	|----------------------	|-----------------	|
| Festplassen          	| 96% 	| [Link](https://www.google.com/maps?q=60.391270,5.325756)               	|
