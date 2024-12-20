<?php

class Page extends BaseModel
{
    public function homepage()
    {
        return $this->first('SELECT `pages`.`id`, `pages`.`template`, `pages`.`title` FROM `pages` WHERE (`pages`.`slug` = "/" OR `pages`.`slug` = "" OR `pages`.`slug` IS NULL);');
    }
}
