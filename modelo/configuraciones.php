<?php

class configuraciones extends Main{
       Private $table='configs';

     public function todos(){
            $r = $this->select($this->table);
        return $r;
    }


}

?>