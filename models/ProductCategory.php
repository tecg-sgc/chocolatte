<?php

class ProductCategory extends BaseModel
{
    public function homepageMainCategories()
    {
        return $this->get('SELECT `product_categories`.`id`,`product_categories`.`pre`,`product_categories`.`title` FROM `product_categories` WHERE `product_categories`.`parent_id` IS NULL ORDER BY `product_categories`.`order`;');
    }

    public function homepageSubCategories($category)
    {
        return $this->get('SELECT `product_categories`.`id`,`product_categories`.`pre`,`product_categories`.`title` FROM `product_categories` WHERE `product_categories`.`parent_id` = :category ORDER BY `product_categories`.`order`;', [
            'category' => $category->id,
        ]);
    }
}
