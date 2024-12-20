<?php

class HomeController extends BaseController
{
    public function show()
    {
        $page = $this->getHomepage();

        return $this->view($page->template, [
            'page' => $page,
            'employees' => Employee::getHomepageEmployees(),
            'reviews' => Review::getHomepageReviews(),
            'categories' => $this->getMenuCategories(),
        ]);
    }

    protected function getHomepage()
    {
        $page = Page::getHomepage();

        $page->navigation = $this->getMainNavigation();
        $page->sections = Section::getSectionsForPage($page);

        foreach ($page->sections as $section) {
            $section->content = json_decode($section->content);
        }

        return $page;
    }

    protected function getMainNavigation()
    {
        $menu = Menu::getMenuForLocation('header');

        $menu->links = Menu::getLinksForMenu($menu);

        foreach($menu->links as $link) {
            $link->url = 'http://sgc-chocolatte.test/'.$link->page.($link->section ? '#'.$link->section : '');
        }

        return $menu;
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
