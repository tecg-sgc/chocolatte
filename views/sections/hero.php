<section class="hero-section d-flex justify-content-center align-items-center" id="section_1">

    <div class="container">
        <div class="row align-items-center">

            <div class="col-lg-6 col-12 mx-auto">
                <em class="small-text"><?= $section->content->pre; ?></em>
                
                <h1><?= $section->content->title; ?></h1>

                <p class="text-white mb-4 pb-lg-2"><?= $section->content->catchphrase; ?></p>

                <a class="btn custom-btn custom-border-btn smoothscroll me-3" href="#section_2">
                    Our Story
                </a>

                <a class="btn custom-btn smoothscroll me-2 mb-2" href="#section_3"><strong>Check Menu</strong></a>
            </div>

        </div>
    </div>

    <div class="hero-slides"></div>
</section>