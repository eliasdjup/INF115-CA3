<!DOCTYPE html>
<html>
    <head>
        <title>INF115 - CE3</title>
    </head>
    <body>
        <h1>INF115 - Compulsary exercise 3</h1>

            <?php
            /*
                Database configuration
            */

            // Connection parameters
            $host 		= 'localhost';
            $user 		= 'root';
            $password 	= '';
            $db 		= 'bysykkel';

            // Connect to the database
            $conn = mysqli_connect($host, $user, $password, $db);

            // Connection check
            if(!$conn) {
                exit('Error: Could not connect to the database.');
            }

            // Set the charset
            mysqli_set_charset($conn, 'utf8');
            ?>

        <h1> Task 1 </h1>
            <h2> a) </h2>
            <!-- Write your solution to 1a here -->

            <h2> b) </h2>
            <!-- Write your solution to 1b here -->
            
            <h2> c) </h2>
            <!-- Write your solution to 1c here -->
            
        
        <h1> Task 2 </h1>
            <h2> a) </h2>
            <!-- Write your solution to 2a here -->

            <h2> b) </h2>
            <!-- Write your solution to 2b here -->

            <h2> c) </h2>
            <!-- Write your solution to 2c here -->

        <h1> Task 3 </h1>
            <h2> a) </h2>
            <!-- Write your solution to 3a here -->

            <h2> b) </h2>
            <!-- Write your solution to 3b here -->

            <h2> c) </h2>
            <!-- Write your solution to 3c here -->
        
        <h1> Task 4 </h1>
        <!-- Write your solution to 4 here -->


    </body>
</html>