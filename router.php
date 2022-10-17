<?php

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

include_once 'Controller/PropiedadController.php';
include_once 'Controller/CiudadController.php';
include_once 'Controller/LoginController.php';


//lee la acción
if (isset($_GET['action'])&&!empty($_GET['action'])) {
    $action = $_GET['action'];
}
else {
    $action = 'home'; //acción por default si no envian
}

// parsea la accion 
$params = explode('/', $action);


$propiedadController = new PropiedadController();
$ciudadController = new CiudadController();
$loginController = new LoginController();

// determina que camino seguir según la acción
switch ($params[0]) {
    case 'home':
        $propiedadController->showHome();
        break;
    case 'ciudades':
        $ciudadController->showCiudades();
        break;
    case 'createPropiedad':
        $propiedadController->addPropiedad();
        break;
    case 'deletePropiedad':
        $propiedadController->deletePropiedad($params[1]);
        break;
    case 'viewPropiedad':
        $propiedadController->viewPropiedad($params[1]);
        break;
    case 'updatePropiedad':
        $propiedadController->updatePropiedad($params[1]);
        break;       
    case 'createCiudad':
        $ciudadController->addCiudad();
        break;
    case 'deleteCiudad':
        $ciudadController->deleteCiudad($params[1]);
        break;
    case 'viewCiudad':
        $ciudadController->viewCiudad($params[1]);
        break;
    case 'updateCiudad':
        $ciudadController->updateCiudad($params[1]);
        break;      
    case 'login':
        $loginController->login();
        break;     
    case 'logout':
        $loginController->logout();
        break;      
    case 'verify':
        $loginController->verifyLogin();
        break;  
    default:
        echo('404 Page not found');
        break;
}
