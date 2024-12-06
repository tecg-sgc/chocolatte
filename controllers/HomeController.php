<?php

class HomeController extends BaseController
{
    public function show()
    {
        return $this->view('home', [
            'pre' => 'Bienvenue chez',
            'title' => 'Chocolatte',
            'employees' => Employee::getHomepageEmployees(),
            'reviews' => Review::getHomepageReviews(),
            'categories' => $this->getMenuCategories(),
        ]);
    }

    protected function getMenuCategories()
    {
        $categories = ProductCategory::getHomepageMainCategories();

        foreach ($categories as $mainCategoryIndex => $category) {
            $category->subcategories = ProductCategory::getHomepageSubCategories($category);

            foreach($category->subcategories as $subCategoryIndex => $subcategory) {
                $subcategory->products = Product::getHomepageProducts($subcategory);

                if(! $subcategory->products) {
                    unset($category->subcategories[$subCategoryIndex]);
                }
            }

            if(! $category->subcategories) {
                unset($categories[$mainCategoryIndex]);
            }
        }

        return $categories;
    }
}
