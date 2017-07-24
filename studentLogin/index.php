<?php
/**
 * Created by PhpStorm.
 * User: landtanin
 * Date: 4/13/2017 AD
 * Time: 7:32 PM
 */


require_once 'Functions.php';

$fun = new Functions();

if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
//    $data = json_decode(file_get_contents("php://input"));

//    if(isset($data -> operation)){
    if(isset($_POST['tag']) && $_POST['tag'] != ''){

//        $operation = $data -> operation;
        $tag = $_POST['tag'];

        if($tag == 'register'){

//            if(isset($data -> user ) && !empty($data -> user) && isset($data -> user -> name)
//                && isset($data -> user -> student_id)
//                && isset($data -> user -> email) && isset($data -> user -> password)){
            if (isset($_POST['name']) && $_POST['name'] != ''
                && isset($_POST['email']) && $_POST['email'] != ''
                && isset($_POST['student_id']) && $_POST['student_id'] != ''
                && isset($_POST['password']) && $_POST['password'] != '') {


//                $user = $data -> user;
//                $name = $user -> name;
//                $student_id = $user -> student_id;
//                $email = $user -> email;
//                $password = $user -> password;

                $name = $_POST['name'];
                $email = $_POST['email'];
                $student_id = $_POST['student_id'];
                $password = $_POST['password'];


                if ($fun -> isEmailValid($email)) {

                    echo $fun -> registerUser($name, $student_id, $email, $password);

                } else {

                    echo $fun -> getMsgInvalidEmail();
                }

            } else {

                echo $fun -> getMsgInvalidParam();

            }

//        }else if ($operation == 'login') {
        }else if ($tag == 'login') {

//            if(isset($data -> user ) && !empty($data -> user) && isset($data -> user -> email) && isset($data -> user -> password)){
            if (isset($_POST['email']) && $_POST['email'] != ''
                && isset($_POST['password']) && $_POST['password'] != '') {

//                $user = $data -> user;
//                $email = $user -> email;
//                $password = $user -> password;
                $email = $_POST['email'];
                $password = $_POST['password'];

                echo $fun -> loginUser($email, $password);

            } else {

                echo $fun -> getMsgInvalidParam();

            }
//        } else if ($operation == 'chgPass') {
        } else if ($tag == 'chgPass') {

//            if(isset($data -> user ) && !empty($data -> user) && isset($data -> user -> email) && isset($data -> user -> old_password)
//                && isset($data -> user -> new_password)){
            if (isset($_POST['old_password']) && $_POST['old_password'] != ''
                && isset($_POST['email']) && $_POST['email'] != ''
                && isset($_POST['new_password']) && $_POST['new_password'] != '') {

//                $user = $data -> user;
//                $email = $user -> email;
//                $old_password = $user -> old_password;
//                $new_password = $user -> new_password;

                $email = $_POST['email'];
                $old_password = $_POST['old_password'];
                $new_password = $_POST['new_password'];

                echo $fun -> changePassword($email, $old_password, $new_password);

            } else {

                echo $fun -> getMsgInvalidParam();

            }
        }

    } else {

        echo $fun -> getMsgInvalidParam();

    }
} else if ($_SERVER['REQUEST_METHOD'] == 'GET'){

    echo "UoN CheckIn Login API";

}