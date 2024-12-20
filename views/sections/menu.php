<section class="menu-section section-padding" id="<?= $section->slug; ?>">
    <div class="container">
        <div class="row">

            <?php foreach($categories as $index => $category): ?>
            <div class="col-lg-6 col-12 mb-4 mb-lg-0">
                <div class="menu-block-wrap">
                    <div class="text-center mb-4 pb-lg-2">
                        <em class="text-white"><?= $category->pre; ?></em>
                        <h4 class="text-white"><?= $category->title; ?></h4>
                    </div>

                    <?php foreach($category->subcategories as $index => $subcategory): ?>
                    <div class="my-4">
                        <em class="text-white"><?= $subcategory->pre; ?></em>
                        <h4 class="text-white"><?= $subcategory->title; ?></h4>
                    </div>

                    <?php foreach($subcategory->products as $index => $product): ?>
                    <div class="menu-block my-4">
                        <div class="d-flex">
                            <h6><?= $product->name; ?>
                                <?php if($product->tag): ?>
                                <span class="badge ms-3"><?= $product->tag; ?></span>
                                <?php endif; ?>
                            </h6>
                        
                            <span class="underline"></span>

                            <?php if($product->discount): ?>
                                <strong class="text-white ms-auto"><del>€<?= number_format($product->price / 100, 2, ',', ' '); ?></del></strong>
                                <strong class="ms-2">€<?= number_format($product->discount / 100, 2, ',', ' '); ?></strong>
                            <?php else: ?>
                                <strong class="ms-auto">€<?= number_format($product->price / 100, 2, ',', ' '); ?></strong>
                            <?php endif; ?>
                        </div>

                        <div class="border-top mt-2 pt-2">
                            <small><?= $product->description; ?></small>
                        </div>
                    </div>
                    <?php endforeach; ?>
<!-- 
                    <div class="menu-block my-4">
                        <div class="d-flex">
                            <h6>
                                Toasted Waffle
                            </h6>
                        
                            <span class="underline"></span>

                            <strong class="text-white ms-auto"><del>$16.50</del></strong>

                            <strong class="ms-2">$12.00</strong>
                        </div>

                        <div class="border-top mt-2 pt-2">
                            <small>Brewed coffee and steamed milk</small>
                        </div>
                    </div>

                    <div class="menu-block">
                        <div class="d-flex">
                            <h6>Fried Chips
                                <span class="badge ms-3">Recommend</span>
                            </h6>
                        
                            <span class="underline"></span>

                            <strong class="ms-auto">$15.0</strong>
                        </div>

                        <div class="border-top mt-2 pt-2">
                            <small>Rich Milk and Foam</small>
                        </div>
                    </div>

                    <div class="menu-block my-4">
                        <div class="d-flex">
                            <h6>Pancakes</h6>
                        
                            <span class="underline"></span>

                            <strong class="ms-auto">$12.50</strong>
                        </div>

                        <div class="border-top mt-2 pt-2">
                            <small>Fresh brewed coffee and steamed milk</small>
                        </div>
                    </div>

                    <div class="menu-block">
                        <div class="d-flex">
                            <h6>Banana Cakes</h6>
                        
                            <span class="underline"></span>

                            <strong class="ms-auto">$18.0</strong>
                        </div>

                        <div class="border-top mt-2 pt-2">
                            <small>Rich Milk and Foam</small>
                        </div>
                    </div> -->
                <?php endforeach; ?>
                </div>
            </div>
            <?php endforeach; ?>

        </div>
    </div>
</section>