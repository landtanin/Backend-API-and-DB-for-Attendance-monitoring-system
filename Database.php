<?php

//echo "Hello";
/**
 * Created by PhpStorm.
 * User: landtanin
 * Date: 3/25/2017 AD
 * Time: 9:45 PM
 */


class Database {

    function getConnection() {

        $servername = "localhost";
        $pass = "Jv42Lgz?Ogi6";
        $user = "root";
        $dbname = "attendance_monitoring";

        // Create connection
        $conn = new mysqli($servername, $user, $pass, $dbname);

        if (!$conn) {
            die("Connection failed due to reason: " . mysqli_connect_error());
        }

        return $conn;
    }

    function closeConnection($conn) {
        $conn->close();
    }

    function unsafeQueryExec($query) {
        $conn = $this->getConnection();

        $results = $conn->query($query);

        $conn->close();

        return $results;
    }


}