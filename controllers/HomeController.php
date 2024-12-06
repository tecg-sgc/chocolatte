<?php

class HomeController extends BaseController
{
    public function show()
    {
        return $this->view('home', [
            'welcome' => 'Bienvenue chez',
            'title' => 'Chocolatte',
            'employees' => Employee::getHomepageEmployees(),
            'review_title' => 'Ce qu\'en pensent nos clients',
            'reviews' => Review::getHomepageReviews(),
            'categories' => $this->getMenuCategories(),
        ]);
    }

    protected function getMenuCategories()
    {
        $categories = ProductCategory::getHomepageMainCategories();

        foreach ($categories as $indexMainCategories => $category) {
            $category->subcategories = ProductCategory::getHomepageSubCategories($category);

            foreach($category->subcategories as $indexSubCategories => $subcategory) {
                $subcategory->products = Product::getHomepageProducts($subcategory);

                if(! $subcategory->products) {
                    unset($category->subcategories[$indexSubCategories]);
                }
            }

            if(! $category->subcategories) {
                unset($categories[$indexMainCategories]);
            }
        }

        return $categories;
    }
}
