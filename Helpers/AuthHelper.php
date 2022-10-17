<?php
class AuthHelper{

    function __construct(){
        // esto es para q no se ejecute dos veces el session start
        if (session_status()!=PHP_SESSION_ACTIVE)
        session_start();
    }

    function checkLoggedIn() {
            if(!isset($_SESSION["email"])){
            header("Location: ".BASE_URL);       
        }

    }

}