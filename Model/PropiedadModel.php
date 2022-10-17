<?php
class PropiedadModel{
    
    private $db;
    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=db_tpe;charset=utf8', 'root', ''); 
        
    }

    public function getPropiedades(){
        $sentencia = $this->db->prepare("SELECT propiedades.*, ciudades.nombre as idCiudad FROM propiedades INNER JOIN ciudades ON propiedades.idCiudad = ciudades.idCiudad");
        $sentencia->execute();
        return $sentencia->fetchAll(PDO::FETCH_OBJ);
    }

    public function addPropiedad($operacion, $descripcion, $precio, $idCiudad){
        $sentencia = $this->db->prepare("INSERT INTO propiedades(operacion, descripcion, precio, idCiudad) VALUES (?,?,?,?)");
        $sentencia->execute(array($operacion, $descripcion, $precio, $idCiudad));
    }

    public function deletePropiedad($idPropiedad){
        $sentencia = $this->db->prepare("DELETE FROM propiedades WHERE idPropiedad=?");
        $sentencia->execute(array($idPropiedad));
    }
    function getPropiedad($idPropiedad){
        $sentencia = $this->db->prepare("SELECT propiedades.*, ciudades.nombre as idCiudad FROM propiedades INNER JOIN ciudades ON propiedades.idCiudad = ciudades.idCiudad WHERE idPropiedad=?");
        $sentencia->execute(array($idPropiedad));
        $propiedad = $sentencia->fetch(PDO::FETCH_OBJ);
        return $propiedad;

    }
    function updatePropiedad($operacion, $descripcion, $precio, $idCiudad, $id){
        $sentencia = $this->db->prepare("UPDATE propiedades SET operacion=?,descripcion=?,precio=?, idCiudad=? WHERE idPropiedad=?");
        $sentencia->execute(array($operacion, $descripcion, $precio, $idCiudad, $id));
    }
}