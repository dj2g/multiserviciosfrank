<?php

class productos extends Main{
       Private $table='productos';

    public function inserta($datos) {
        $r = $this->insert($this->table, $datos);
        return $r;
    }

    public function actualiza($datos) {
        $r = $this->update($this->table, $datos);
        return $r;
    }


    public function elimina($id) {
        $r = $this->delete($this->table,$id);
        return $r;
    }
     public function getTipoProducto($id){
        return $this->get($this->table,$id);
    }
     public function todos(){
            $r = $this->select($this->table);
        return $r;
    }

    public function buscar($data,$params){
        $r=$this->search($this->table,$data,$params);
         //var_dump($r);exit();
            return $r;
    }
    public function typehead($data){
            $r=$this->typeheadlike($this->table,$data,['descripcion'],"descripcion ");
            return $r;
    }

    public function typehead2($data){
            $r=$this->typeheadlike2($this->table,$data,['descripcion'],"descripcion,'->S/',precio");
            return $r;
    }

}

?>
