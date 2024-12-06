<?php

class Product extends BaseModel
{
    public function homepageProducts($category)
    {
        return $this->get('SELECT `products`.`name`, `products`.`description`, `products`.`tag`, `products`.`price`, `products`.`discount` FROM `products` WHERE `product_category_id` = :category ORDER BY `products`.`price`;', [
            'category' => $category->id
        ]);
    }
}
