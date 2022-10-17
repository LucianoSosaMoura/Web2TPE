<?php
   include_once 'Model\CiudadModel.php';
   include_once 'View\CiudadView.php';
   include_once "Helpers\AuthHelper.php";

    class CiudadController {
        private $model;
        private $view;
        private $authHelper;

        function __construct(){
           $this->model = new CiudadModel();
           $this->view = new CiudadView();
           $this->authHelper = new authHelper();
        }

        public function showCiudades() {
            $ciudades = $this->model->getCiudades();
            $this->view->showCiudades($ciudades);
        }
        
        public function addCiudad() {
            // TODO: validar entrada de datos
            $this->authHelper->checkLoggedIn();
            $nombre = $_POST['nombre'];
            $provincia = $_POST['provincia'];
            $cantidadHabitantes = $_POST['cantidadHabitantes'];

            $this->model->addCiudad($nombre, $provincia, $cantidadHabitantes);

            header("Location: " . BASE_URL."ciudades"); 
        }
    
        public function deleteCiudad($idCiudad) {
            $this->authHelper->checkLoggedIn();
            $this->model->deleteCiudad($idCiudad);
            header("Location: " . BASE_URL ."ciudades");
        }
        public function viewCiudad($idCiudad) {
            $idCiudad = $this->model->viewCiudad($idCiudad);
            $this->view->viewCiudad($idCiudad);
        }
        function updateCiudad($id){
            $this->authHelper->checkLoggedIn();
            $nombre = $_POST['nombre'];
            $provincia = $_POST['provincia'];
            $cantidadHabitantes = $_POST['cantidadHabitantes'];
            $this->model->updateCiudad($nombre, $provincia, $cantidadHabitantes, $id);
            header("Location: " . BASE_URL ."ciudades");
        }

    }