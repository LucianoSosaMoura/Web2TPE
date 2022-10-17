<?php
require_once "libs/smarty/Smarty.class.php";

class PropiedadView{

    function __construct() {
        $this->smarty = new Smarty();
    }


function showPropiedades($propiedades) {
    // inicializo Smarty y asigno las variables para mostrar
    $smarty = new Smarty();
    $smarty->assign('titulo',"Lista de propiedades");
    $smarty->assign('propiedades', $propiedades);
  
    $smarty->display('templates/listadoPropiedades.tpl'); // muestro el template   
  }

    function showHome($propiedades, $ciudades) {
    // inicializo Smarty y asigno las variables para mostrar
    $smarty = new Smarty();
    $smarty->assign('titulo',"Lista de propiedades");
    $smarty->assign('propiedades', $propiedades);
    $smarty->assign('ciudades', $ciudades);

    $smarty->display('templates/listadoPropiedades.tpl'); // muestro el template   
    }

    function showPropiedad($propiedad) {
        // Instancio Smarty
        $this->smarty->assign('propiedad', $propiedad);
        $this->smarty->assign('titulo', "Listado de propiedades");

        $this->smarty->display('templates/detallePropiedad.tpl');
    }
}

