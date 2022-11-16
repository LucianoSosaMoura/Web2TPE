<?php
    include_once 'Model\PropiedadModel.php';
    include_once 'View\PropiedadView.php';
    include_once 'Model\CiudadModel.php';
    include_once "Helpers\AuthHelper.php";


    class PropiedadController {
        private $model;
        private $modelC;
        private $view;
        private $authHelper;

        function __construct(){
           $this->model = new PropiedadModel();
           $this->modelC = new CiudadModel();
           $this->view = new PropiedadView();
           $this->authHelper = new authHelper();
        }
        

    public function showHome() {
        $propiedades = $this->model->getPropiedades();
        $ciudades = $this->modelC->getCiudades();
        $this->view->showHome($propiedades, $ciudades);
    }

    
    public function addPropiedad() {
        // TODO: validar entrada de datos
        $this->authHelper->checkLoggedIn();

        if (!empty($_POST['operacion']) && !empty($_POST['descripcion']) && !empty($_POST['precio']) && !empty($_POST['idCiudad'])){
        $operacion = $_POST['operacion'];
        $descripcion = $_POST['descripcion'];
        $precio = $_POST['precio'];
        $idCiudad = $_POST['idCiudad'];

        $this->model->addPropiedad($operacion, $descripcion, $precio, $idCiudad);
        header("Location: " . BASE_URL); 
        }
        else {
            header("Location: " . BASE_URL);
        };
    }
   
    public function deletePropiedad($idPropiedad) {
        $this->authHelper->checkLoggedIn();
        $this->model->deletePropiedad($idPropiedad);
        header("Location: " . BASE_URL);
    }

    public function viewPropiedad($idPropiedad) {
    $propiedad = $this->model->getPropiedad($idPropiedad);
    $this->view->showPropiedad($propiedad);
    }

    function updatePropiedad($id){
        $this->authHelper->checkLoggedIn();

        if (!empty($_POST['operacion']) && !empty($_POST['descripcion']) && !empty($_POST['precio']) && !empty($_POST['idCiudad'])){
            $operacion = $_POST['operacion'];
            $descripcion = $_POST['descripcion'];
            $precio = $_POST['precio'];
            $idCiudad = $_POST['idCiudad'];
       
            $this->model->updatePropiedad($operacion, $descripcion, $precio, $idCiudad, $id);
            header("Location: " . BASE_URL);
        }
        else {
            header("Location: " . BASE_URL);
        };

    }

}