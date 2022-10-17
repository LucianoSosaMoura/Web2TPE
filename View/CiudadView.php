<?php
require_once "libs/smarty/Smarty.class.php";

class CiudadView{

    function __construct() {
        $this->smarty = new Smarty();
    }

    function showCiudades($ciudades) {
        // inicializo Smarty y asigno las variables para mostrar
        $smarty = new Smarty();
        $smarty->assign('titulo',"Lista de ciudades");
        $smarty->assign('ciudades', $ciudades);
      
        $smarty->display('templates/listadoCiudades.tpl'); // muestro el template   
    }

    function viewCiudad($idCiudad) {
      // inicializo Smarty y asigno las variables para mostrar
      $smarty = new Smarty();
      $smarty->assign('titulo',"Lista de propiedades por ciudad");
      $smarty->assign('propiedades', $idCiudad);
    
      $smarty->display('templates/propiedadesCiudad.tpl'); // muestro el template   
    }

}
    