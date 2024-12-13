<?php

class Menu extends BaseModel
{
    public function location($location)
    {
        return $this->first('SELECT `menus`.`id`,`menus`.`location`, `menus`.`title` FROM `menus` WHERE `menus`.`location` = :location LIMIT 1;', [
            'location' => $location,
        ]);
    }

    public function linksForMenu($menu)
    {
        return $this->get('SELECT `pages`.`slug` AS "page", `sections`.`slug` AS "section", `menu_page`.`label`, `menu_page`.`title`, `menu_page`.`target` FROM `menu_page` JOIN `pages` ON `menu_page`.`page_id` = `pages`.`id` LEFT JOIN `sections` ON `menu_page`.`section_id` = `sections`.`id` WHERE `menu_page`.`menu_id` = :menu ORDER BY `menu_page`.`order` ASC;', [
            'menu' => $menu->id,
        ]);
    }
}
