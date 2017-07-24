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

$sqlStmt = "SELECT * FROM `ModuleInfo` WHERE moduleId IN (SELECT Module_id FROM `StudentModule` ";

//------------------------------------------------------------------------
//if (isset($_GET["id"], $_GET["name"])) {
////    $sqlStmt .= " WHERE _id = " . $_GET["id"] . ";";
////    $name = mysqli_real_escape_string($_GET["name"],"");
//    $sqlStmt .= " WHERE _id = " . $_GET["id"] . " OR name = '" . $_GET["name"] . "';";
//
//    //
//    //var_dump($sqlStmt);
//
//}
//if (isset($_GET["id"], $_GET["id2"], $_GET["id3"], $_GET["id4"])) {
//
//    $sqlStmt .= " WHERE _id = " . $_GET["id"]
//        . " OR _id = " . $_GET["id2"]
//        . " OR _id = " . $_GET["id3"]
//        . " OR _id = " . $_GET["id4"] . ";";
//    //var_dump($sqlStmt);
//
//}
//elseif (isset($_GET["id"], $_GET["id2"], $_GET["id3"])) {
//
//    $sqlStmt .= " WHERE _id = " . $_GET["id"]
//        . " OR _id = " . $_GET["id2"]
//        . " OR _id = " . $_GET["id3"] . ";";
////    var_dump($sqlStmt);
//
//}
//elseif (isset($_GET["id"], $_GET["id2"])) {
//
//    $sqlStmt .= " WHERE _id = " . $_GET["id"]
//        . " OR _id = " . $_GET["id2"] . ";";
//    //var_dump($sqlStmt);
//
//}

if (isset($_GET["student_id"])) {

    $sqlStmt .= " WHERE Student_id = " . $_GET["student_id"] . ");";
//    var_dump($sqlStmt);


   // echo $sqlStmt;
} else {
    $sqlStmt .= ");";
}


// debugging
//echo $_GET["student_id"];
////echo trim($_GET["name"]);
//echo trim($_GET["id2"]);


$results = $db->unsafeQueryExec($sqlStmt);

//var_dump($results);

$allResults = [];


while ($row = $results->fetch_assoc()) {
    array_push($allResults, $row);
}

//------------------------------------------------------------------------

//if (isset($_GET["id"])) {
//    $sqlStmt .= " WHERE _id = " . $_GET["id"] . ";";
////    $sqlStmt = "SELECT * FROM `StudentInfo` WHERE _id IN(`". $_GET["id"] . "`,`" . $_GET["id2"] . "`);";
//
//}
//
//$results = $db->unsafeQueryExec($sqlStmt);
//
//
//while ($row = $results->fetch_assoc()) {
//    array_push($allResults, $row);
//}


// make object
$content['modules']=$allResults;
//$content[$_POST['bla2']]=$allResults; // experiment works!
echo json_encode($content);
//echo $_POST["bla"];




