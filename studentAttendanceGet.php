<?php
/**
 * Created by PhpStorm.
 * User: landtanin
 * Date: 3/26/2017 AD
 * Time: 12:43 PM
 */
require "./Database.php";

$db = new Database();
$conn = $db->getConnection();
$sqlStmt = "SELECT * FROM `studentinfo` WHERE Student_id IN (SELECT Student_id FROM `StudentModule` ";

if (isset($_GET["module_id"])) {

    $sqlStmt .= " WHERE Module_id = '" . $_GET["module_id"] . "');";

} else {
    $sqlStmt .= ");";
}


$results = $db->unsafeQueryExec($sqlStmt);
$allResults = [];

while ($row = $results->fetch_assoc()) {
    array_push($allResults, $row);
}

$content['students']=$allResults;

echo json_encode($content);





