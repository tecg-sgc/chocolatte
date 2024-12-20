<?php

class HomeController extends BaseController
{
    public function show()
    {
        $page = $this->getHomepage();

        return $this->view($page->template, [
            'page' => $page,
            'welcome' => 'Bienvenue chez',
            'title' => 'Chocolatte',
            'employees' => Employee::getHomepageEmployees(),
            'review_title' => 'Ce qu\'en pensent nos clients',
            'reviews' => Review::getHomepageReviews(),
            'categories' => $this->getMenuCategories(),
        ]);
    }

    protected function getHomepage()
    {
        $page = Page::getHome();

        $page->sections = Section::getPageSections($page);

        foreach($page->sections as $section) {
            $section->content = json_decode($section->content);
        }

        $page->navigation =  $this->getNavigation();

        return $page;
    }

    protected function getNavigation()
    {
        $menu = Menu::getLocation('header');
        $menu->links = Menu::getLinksForMenu($menu);

        foreach($menu->links as $link) {
            $link->url = 'http://sgc-chocolatte.test/'.$link->page.($link->section ? '#'.$link->section : '');
        }

        return $menu;
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
