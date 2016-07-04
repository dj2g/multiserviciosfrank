<?php

class compras extends Main{
       Private $table='compras';

    public function nuevo($datos) {
        //var_dump($datos);exit();
        //$r = $this->insert($this->table, $datos);
        $data=array(
            'idproveedor'=>$datos["idproveedor"],
            'idtipodoc'=>$datos["idtipodoc"],
            'fechacompra'=>date('Y-m-d'),
            'nrodoc'=>$datos["nrodoc"],
            'igv'=>0,
            'fechaemision'=>date('Y-m-d'),
            'total'=>$datos["nrodoc"],
            'estado'=>1
            );

        $compras = $this->insert($this->table, $data);
       $lastid= $this->lastid($this->table);
       

        for($i=0;$i<count($datos["idproducto"]);$i++){
            $datadetalles=array(
            'idproducto'=>$datos["idproducto"][$i],
            'idcompra'=>$lastid[0]["id"],
            'cantidad'=>$datos["cantidad"][$i],
            'precio'=>$datos["precio"][$i],
            'confirmar'=>date('Y-m-d'),
            'estado'=>1
            );   
            $r = $this->insert("detcompras", $datadetalles);
            $add = $this->addstock($datos["idproducto"][$i],$datos["cantidad"][$i]);
            
            $dataKardex=array(
             'idproducto'=>$datos["idproducto"][$i],
             'fecha'=>date('Y-m-d'),
             'detalle'=>'COMPRA AL Contado Boleta N°'.$datos["nrodoc"],
             'cantidadEntrada'=>$datos["cantidad"][$i],
             'precioEntrada'=>$datos["precio"][$i],
             'totalEntrada'=>(int)($datos["precio"][$i])*(int)($datos["cantidad"][$i]),
             'cantidadSalida'=>0,
             'precioSalida'=>0,
             'totalSalida'=>0,
            'estado'=>1
                );
            $kardex = $this->insert("kardexproductos",$dataKardex);
        }

        $idpagos=$this->PagosCompras($lastid[0]["id"],$datos["total"]);
        $idmovimiento=$this->movimientoDinero($datos["total"],2);

            $this->movimientoDineroPago($idpagos,$idmovimiento,$datos["total"]);
        return json_encode("OK");
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
    public function allForTable($array)
    {
        $query ="SELECT concat(nombres,'',apellidos) AS DisplayText ,id as Value FROM ".$this->table." WHERE estado=1";

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
