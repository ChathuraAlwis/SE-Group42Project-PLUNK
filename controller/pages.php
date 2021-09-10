<?php

    class Page{

        private $path;
        
        public function __construct($path){
            $this->path = $path;
        }

        public function show(){
            header('location:' . $this->path);
            exit();
        }

    }

?>