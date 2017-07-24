<?php
/**
 * Created by PhpStorm.
 * User: landtanin
 * Date: 4/13/2017 AD
 * Time: 7:31 PM
 */

class DBOperations{

    private $host = 'localhost';
    private $user = 'root';
//    private $db = 'TestDB';
    private $db = 'attendance_monitoring';
//    private $pass = '';
    private $pass = 'Jv42Lgz?Ogi6';
    private $conn;

    public function __construct() {

        $this -> conn = new PDO("mysql:host=".$this -> host.";dbname=".$this -> db, $this -> user, $this -> pass);

    }

    public function insertData($name,$student_id,$email,$password){

        $unique_id = uniqid('', true);
        $hash = $this->getHash($password);
        $encrypted_password = $hash["encrypted"];
        $salt = $hash["salt"];

        $sql = 'INSERT INTO student_users SET unique_id =:unique_id,name =:name,student_id =:student_id,
    email =:email,encrypted_password =:encrypted_password,salt =:salt,created_at = NOW()';

        $query = $this ->conn ->prepare($sql);
        $query->execute(array('unique_id' => $unique_id, ':name' => $name, ':student_id' => $student_id, ':email' => $email,
            ':encrypted_password' => $encrypted_password, ':salt' => $salt));

        if ($query) {

            return true;

        } else {

            return false;

        }
    }

    public function checkLogin($email, $password) {

        $sql = 'SELECT * FROM student_users WHERE email = :email';
        $query = $this -> conn -> prepare($sql);
        $query -> execute(array(':email' => $email));
        $data = $query -> fetchObject();
        $salt = $data -> salt;
        $db_encrypted_password = $data -> encrypted_password;

        if ($this -> verifyHash($password.$salt,$db_encrypted_password) ) {

            $user["name"] = $data -> name;
            $user["student_id"] = $data -> student_id;
            $user["email"] = $data -> email;
            $user["unique_id"] = $data -> unique_id;
            return $user;

        } else {

            return false;
        }
    }

    public function changePassword($email, $password){

        $hash = $this -> getHash($password);
        $encrypted_password = $hash["encrypted"];
        $salt = $hash["salt"];

        $sql = 'UPDATE student_users SET encrypted_password = :encrypted_password, salt = :salt WHERE email = :email';
        $query = $this -> conn -> prepare($sql);
        $query -> execute(array(':email' => $email, ':encrypted_password' => $encrypted_password, ':salt' => $salt));

        if ($query) {

            return true;

        } else {

            return false;

        }
    }

    public function checkUserExist($email){

        $sql = 'SELECT COUNT(*) from student_users WHERE email =:email';
        $query = $this -> conn -> prepare($sql);
        $query -> execute(array('email' => $email));

        if($query){

            $row_count = $query -> fetchColumn();

            if ($row_count == 0){

                return false;

            } else {

                return true;

            }
        } else {

            return false;
        }
    }

    public function getHash($password) {

        $salt = sha1(rand());
        $salt = substr($salt, 0, 10);
        $encrypted = password_hash($password.$salt, PASSWORD_DEFAULT);

        // no salt
//        $encrypted = md5($password);
        $hash = array("salt" => $salt, "encrypted" => $encrypted);

        return $hash;

    }

    public function verifyHash($password, $hash) {

        return password_verify ($password, $hash);
    }
}