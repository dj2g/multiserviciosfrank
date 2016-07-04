<?php

class tipo_productos extends Main{
        Private $table='tipoproductos';

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
           
            return $r;
    }
     public function allForTable($array)
    {
        $query ="SELECT descripcion AS DisplayText ,id as Value FROM ".$this->table." WHERE estado=1";

        $data = $this->getConsultaQuery($query);
        
        $rows = array();

        $ini = array();
        $ini["DisplayText"] = '--Seleccione--';
        $ini['Value'] = '';
        $rows[] = $ini;

        for($i=0;$i<count($data);$i++) {
            $eil = array();
            $eil["DisplayText"] = $data[$i]["DisplayText"];
            $eil["Value"] = $data[$i]["Value"]; 
            $rows[$i] = $eil;
        }

        $jTableResult = array();
        $jTableResult['Result'] = "OK";
        $jTableResult['Options'] = $rows;
        return json_encode($jTableResult);
    }
}

?>
