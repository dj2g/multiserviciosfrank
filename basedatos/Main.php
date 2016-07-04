<?php

class Main extends conexion {

    protected static function get_consulta($pa, $datos) {
        $bd = new conexion();
        $bd->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
        return self::procedimientoAlmacenado($pa, $datos, $bd);
    }
 protected static function get_query($sql){
      $bd=new conexion();
       $bd->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
      return self::getConsultaQuery($sql);  
    }
    // procedimiento almacenado para ejecutar consultas
    private function procedimientoAlmacenado($pa, $datos, $bd) {
        //convertimos a mayusculas los datos 
        $search  = array('á', 'é', 'í', 'ó', 'ú', 'ñ');
        $replace = array('Á', 'É', 'Í', 'Ó', 'Ú', 'Ñ');
        foreach ($datos as $key => $value) {
            $datos[$key]=str_replace($search, $replace, strtoupper($value) );
        }
        
        //arreglar archivo
        $config = parse_ini_file('config.ini', TRUE);
        $driver = $config['database']['driver'];
        switch ($driver) {
            case 'mssql': $sql = "execute ";
                break;
            case 'mysql': $sql = "call ";
                break;
            case 'pgsql': $sql = "select * from ";
                break;
            case 'oci': $sql = "execute ";
                break;
        }
        $sql = $sql . $pa . " ";
        if ($driver != 'mssql') {
            $sql = $sql . "(";
        }

        if ($datos != null) {
            for ($i = 1; $i <= count($datos); $i++) {
                $sql = $sql . "?";
                if ($i < count($datos)) {
                    $sql = $sql . ",";
                } else {
                    if ($driver != 'mssql') {
                        $sql = $sql . ")";
                    }
                }
            }
        } else {
            if ($driver != 'mssql') {
                $sql = $sql . ")";
            }
        }
//        die($sql);
        try {

            if ($driver == 'mysql') {
                //die('jajaja');
                $stmt = $bd->prepare($sql, array(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true));
            } else {
                $stmt = $bd->prepare($sql);
            }
            $j = 0;
            if ($datos != null) {
                for ($i = 0; $i < count($datos); $i++) {
                    $j++;
                    if (is_int($datos[$i])) {
                        $stmt->bindValue($j, $datos[$i], PDO::PARAM_INT);
                    }
                    if (is_string($datos[$i])) {
                        $stmt->bindValue($j, $datos[$i], PDO::PARAM_STR);
                    }
                    if (is_double($datos[$i])) {
                        $stmt->bindValue($j, $datos[$i], PDO::PARAM_INT);
                    }
                    if (is_null($datos[$i])) {
                        $stmt->bindValue($j, $datos[$i], PDO::PARAM_NULL);
                    }
                }
            }
            $stmt->execute();
            $error = $stmt->errorInfo();
            if ($driver == 'mssql') {
                if ($error[2] == '(null) [0] (severity 0) [(null)]') {
                    return array($stmt, '');
                } else {
                    $url = str_replace(' ', '_', $error[2]);
                    die("<script> window.location=\"" . BASE_URL . "error/error_bd/" . $url . "\" ; </script>");
                }
            } else {
                return array($stmt, $error[2]);
//                if($error[2]!=''){
//                    return array($stmt, $error[2]);
//                }else{
//                    $url=str_replace(' ', '_', $error[2]);
//                    die("<script> window.location=\"".BASE_URL."error/error_bd/".$url."\" ; </script>");
//                }
            }

//            return array($stmt,$error[2]);
//            return $stmt;
        } catch (PDOException $e) {
            return false;
            echo '<script>
                alert("Fallo ejecucion!: ' . $e->getMessage() . '");
                    window.location="index.php";
                </script>';
        } catch (Exception $ex) {
            return false;
            echo '<script>
                alert("Fallo ejecucion!: ' . $ex->getMessage() . '");
                    window.location="index.php";
                </script>';
        }
    }

    public function getConsultaQuery($sql){
       // $bd=new conexion();
       //$bd->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
       // $consulta = $bd->query($sql);
        //$data= $consulta->fetchAll(PDO::FETCH_ASSOC);

            $db=new conexion();
      
            $stmt = $db->query($sql);
           // $data = $stmt->fetch(PDO::FETCH_ASSOC);
        //echo $sql;exit();
        $bal = $stmt->fetchAll(PDO::FETCH_ASSOC);
        //$id = $stmt->fetch(PDO::FETCH_ASSOC);
        
        // if (!isset($data)) {
    //echo "\nPDO::errorInfo():\n";
    //print_r($bd->errorInfo()[2]);exit();
      //  }
        return $bal;
    }
    //funcion para mostrar todos los datos

    public function allData($table){
            $sql="Select * from ".$table." WHERE estado=1";
            $data=$this->getConsultaQuery($sql);
            return ($data);
    }

    public function lastid($table){
        $sql="SELECT MAX(id) AS id FROM ".$table;
        $data=$this->getConsultaQuery($sql);
        
        return ($data);
    }

    public function addstock($id,$cantidad){
        $sql="SELECT stockactual from productos WHERE id=".$id;
        $stockactual=$this->getConsultaQuery($sql);
        $stock=(int)($stockactual[0]["stockactual"])+(int)$cantidad;
        $sql2="UPDATE  productos SET stockactual=".$stock." WHERE id=".$id;
        //echo $sql2;exit();
        $stockactual=$this->getConsultaQuery($sql2);
        return "OK";
    }

     public function reststock($id,$cantidad){
        $sql="SELECT stockactual from productos WHERE id=".$id;
        $stockactual=$this->getConsultaQuery($sql);
        $stock=(int)($stockactual[0]["stockactual"])-(int)$cantidad;
        $sql2="UPDATE  productos SET stockactual=".$stock." WHERE id=".$id;
        //echo $sql2;exit();
        $stockactual=$this->getConsultaQuery($sql2);
        return "OK";
    }

    public function select($table,$sqls=null){
        if($sqls==null){
            $sql="Select * from ".$table." WHERE estado=1";

        }else{
            $sql=$sqls;
        }
        $datos = array();
        $datos['Result'] = "OK";
        $datos['Records'] = $this->getConsultaQuery($sql);
        $datos["jtPageSize"] = count($this->getConsultaQuery($sql));
        $datos["TotalRecordCount"] = count($this->getConsultaQuery($sql));
       return ($datos);
    }

    public function insert($table,$data){
        //elimino la data guardar que difierencia el estado de un registro nuevo
       // unset($data["guardar"]);
        //rescatamos a todos los atributos de la tabla
        $atributos=$this->atributos($table);
        $cadena="";
         //var_dump($atributos); exit();
        //formamos la cadena de todos los campos que vamos a insertar
        for($i=0;$i<count($data);$i++){
            if ($atributos[$i]["Field"] != 'id' && $atributos[$i]["Field"] != 'estado') {
            $cadena=$cadena."'".$data[$atributos[$i]["Field"]]."',";
        }
        }
        //eliminamos la ultima ,
        //$result = substr($cadena, 0, -1);
        //agrupamos las cadenas
        $sql="Insert into ".$table." VALUES('',".$cadena."'1')";
        // generamos la conexion PDO
       // echo $sql;exit();   
        $bd=new conexion();
        //enviamos atributos a la conexion
        $bd->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
        //ejecutamos la consulta sql del insert

        $consulta = $bd->query($sql);
        if (!$consulta) {
    echo "\nPDO::errorInfo():\n";
    print_r($bd->errorInfo()[2]);exit();
        }
        
        return json_encode(array(
                        "Result" =>"OK",
                        "Record"=>$data,
                        "Error"=>"",
                        "Message"=>""
                        ));
    }
    public function delete($table,$id)
    {
        $sql="update ".$table." set estado=0 WHERE id=".$id;
        $bd=new conexion();
        $bd->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
        
        $consulta = $bd->query($sql);
         if (!$consulta) {
    echo "\nPDO::errorInfo():\n";
    print_r($bd->errorInfo()[2]);exit();
        }
        $datos['Result'] = "OK";
       return json_encode($datos);
    }
     public function update($table,$data){
        unset($data["guardar"]);
        $atributos=$this->atributos($table);
        $cadena="";
        //var_dump($atributos);exit();
        for($i=0;$i<count($data);$i++){
            $cadena=$cadena." ".$atributos[$i]["Field"]."='".$data[$atributos[$i]["Field"]]."',";
        }
        $result = substr($cadena, 0, -1);
        $sql="update ".$table." set ".$result." WHERE id=".$data["id"];
        //echo $sql;exit();
        $bd=new conexion();
        $bd->setAttribute(PDO::ATTR_CASE, PDO::CASE_UPPER);
        $consulta = $bd->query($sql);
         if (!$consulta) {
    echo "\nPDO::errorInfo():\n";
    print_r($bd->errorInfo()[2]);exit();
        }
        $datos['Result'] = "OK";
       return json_encode($datos);
    }

    public function get($table,$id,$sqls=null) {
        if($sqls==null){
            $sql="Select * from ".$table." WHERE id=".$id." AND estado=1";
        }else{
            $sql=$sqls;
        }  
       return $this->getConsultaQuery($sql);
    }

    public function atributos($table){
        $sql = "SHOW COLUMNS FROM " . $table;
        return $this->getConsultaQuery($sql);
    }
    public function search($table,$array,$params,$sqls=null){
        /*   
           $buscar=$this->generateParams($params);
            if($array["jtStartIndex"]==NULL){
            $buscar1=1;
        }else{
            $buscar1=(int)$array["jtStartIndex"];
        }

        if($array["jtPageSize"]==NULL){
            $buscar2=10;
        }else{
            $buscar2=(int)$array["jtPageSize"];
        }
        if(!isset($array["jtSorting"])){
            $buscar3=0;
        }else{
            $buscar3=(int)$array["jtSorting"];
        }

        if($array["search"]==""){
            $buscar4="";
        }else{
            $buscar4=$array["search"];
        }
           $buscar=$this->generateParams($params);
           $like = str_replace("denys",$array["search"],$buscar);
           if($sqls==null){
           $sql="Select * from ".$table." WHERE estado=1 AND ".$like." ";
           }else{

            $sql=$sqls." AND ".$like;
           // echo $sql;exit();
           }
           //echo $sql;exit();     
            
           $cantdd="Select * from ".$table." WHERE estado=1";
           $cantidad=$this->getConsultaQuery($cantdd);
           $datos = array();
        $datos['Result'] = "OK";
        $datos['Records'] = $this->getConsultaQuery($sql);
        $datos["jtPageSize"] = count($this->getConsultaQuery($sql));
        $datos["TotalRecordCount"] = count($this->getConsultaQuery($cantidad));
        //var_dump($this->getConsultaQuery($sql));exit();
       return ($datos);
           //C return $this->getConsultaQuery($sql);
    */
      // var_dump($array["search"]);exit();
       
        if($sqls==null){

            if(!isset($array["jtStartIndex"])){
                $buscar1=1;
            }else{
                $buscar1=(int)$array["jtStartIndex"];
            }

            if(!isset($array["jtPageSize"])){
                $buscar2=10;
            }else{
                $buscar2=(int)$array["jtPageSize"];
            }
            if(!isset($array["jtSorting"])){
                $buscar3=0;
            }else{
                $buscar3=(int)$array["jtSorting"];
            }

            if(!isset($array["search"])){
            
                $buscar4="";
            }else{
                $buscar4=$array["search"];
            }
            //var_dump($array);echo $buscar4;exit();
            $preLike=$this->generateParams($params);
            $like = str_replace("denys",$buscar4,$preLike);
            $cantidad="Select * from ".$table." WHERE estado=1";
            
                
               // $sql=" SELECT * FROM ".$table." WHERE estado =1 ORDER BY ".$array["jtSorting"]." LIMIT ".$buscar1.",".$buscar2;
                //$sql=" SELECT * FROM ".$table." WHERE estado =1 LIMIT ".$buscar1.",".$buscar2;
               

                    if (isset($array["jtSorting"])) {
                            $sql=" SELECT * FROM ".$table." WHERE estado=1 AND (".$like.") ORDER BY ".$array["jtSorting"]." LIMIT ".$buscar1.",".$buscar2;
                            //echo $sql;exit();
                    }else{
                             $sql=" SELECT * FROM ".$table." WHERE estado=1 AND (".$like.") LIMIT ".$buscar1.",".$buscar2;


                    }


        }else{
            $sql=$sqls;
        }

        //echo $sql;exit();
        $datos = array();
        $datos['Result'] = "OK";
        $datos['Records'] = $this->getConsultaQuery($sql);
        $datos["jtPageSize"] = count($this->getConsultaQuery($sql));
        $datos["TotalRecordCount"] = count($this->getConsultaQuery($cantidad));
        $datos["sql"]=$sql;
        //var_dump($datos);exit();

       return json_encode($datos);
    }

    public function typeheadlike($table,$array,$params,$parametro){
         $preLike=$this->generateParams($params);
            $like = str_replace("denys",$array["query"],$preLike);
         $sql=" SELECT CONCAT(id ,'.', ".$parametro.") as value FROM ".$table." WHERE estado=1 AND (".$like.") ";
         $data=$this->getConsultaQuery($sql);
          return json_encode($data);
    }

     public function typeheadlike2($table,$array,$params,$parametro){
         $preLike=$this->generateParams($params);
            $like = str_replace("denys",$array["query"],$preLike);
         $sql=" SELECT CONCAT(id ,'.', ".$parametro.") as value FROM ".$table." WHERE estado=1 AND (".$like.") AND stockactual > 0";
         $data=$this->getConsultaQuery($sql);
          return json_encode($data);
    }

     public function generateParams($params){
        $cadena='';
        $initlike=" LIKE '%";
        $finlike="%' OR ";
        if(count($params) > 1){
            for($i=0;$i<count($params);$i++){
                $cadena=$cadena.$params[$i].$initlike.'denys'.$finlike;
            }
            $result = substr($cadena, 0, -3);
        }else{
            $result='('.$params[0]." LIKE '%denys%')";
        }

        return $result;

    }

     public function PagosCompras($idpago,$total){
             $pagos=array(
            'idcompra'=>$idpago,
            'montopagado'=>$total,
            'fecha'=>date('Y-m-d'),
            'estado'=>1
            );
             //var_dump($pagos);exit();
             $pago=$this->insert("pagocompras",$pagos);
             $lastid= $this->lastid("pagocompras");
             $id=$lastid[0]["id"];
             return $id;
    }

    public function movimientoDinero($total,$idconcepto){
        $idcaja= $this->lastid("cajas");
        $datosmovimeinto=array(
            'idcaja'=>$idcaja[0]["id"],
            'idconcepto'=>$idconcepto,
            'monto'=>$total,
            'fecha'=>date('Y-m-d'),
            'glosa'=>'Se compro nuevo producto',
            'estado'=>1
            );
         $lastid= $this->lastid("movimientodineros");
         $this->moverdineroCaja($total,$idconcepto);
             $id=$lastid[0]["id"];
            $this->insert("movimientodineros",$datosmovimeinto);
            
            return $id;
    }
    public function moverdineroCaja($total,$idconcepto){
            $sql="SELECT * FROM cajas where cajas.fechaapertura='".date('Y-m-d')."' and saldocierre=0 and estado=1";
             $saldocaja=$this->getConsultaQuery($sql);
             if($idconcepto==2){
                $stock=(int)($saldocaja[0]["saldo"])-(int)$total;
            }else{
                $stock=(int)($saldocaja[0]["saldo"])+(int)$total;
            }
        $idcaja= $this->lastid("cajas");
        $sql2="UPDATE  cajas SET saldo=".$stock." WHERE cajas.id=".$idcaja[0]["id"];
        $cajaActual=$this->getConsultaQuery($sql2);
       
       return "OK";
    }
      public function movimientoDineroPago($idpago,$idmovimiento,$total){
        
        $datos=array(
            'idmovimiento'=>$idmovimiento,
            'idpagocompra'=>$idpago,
            'fecha'=>date('Y-m-d'),
            'monto'=>$total,
            'estado'=>1
            );
         //var_dump($datos);exit();
            $this->insert("movimientos_pagocompras",$datos);
        
            return "OK";
    }

    public function PagosVentas($idpago,$total){
             $pagos=array(
            'idventa'=>$idpago,
            'montopagado'=>$total,
            'fecha'=>date('Y-m-d'),
            'estado'=>1
            );
             //var_dump($pagos);exit();
             $pago=$this->insert("pagoventas",$pagos);
             $lastid= $this->lastid("pagoventas");
             $id=$lastid[0]["id"];
             return $id;
    }
public function movimientoDineroVenta($idpago,$idmovimiento,$total){
        
        $datos=array(
            'idmovimiento'=>$idmovimiento,
            'idpagoventa'=>$idpago,
            'fecha'=>date('Y-m-d'),
            'monto'=>$total,
            'estado'=>1
            );
         //var_dump($datos);exit();
            $this->insert("movimientos_pagosventas",$datos);
        
            return "OK";
    }

}

?>