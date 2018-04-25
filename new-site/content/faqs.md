<section id="faqs">
    <div class="header_gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h1 class="section_heading_blue fractal_white">{{ title }}</h1>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
          {{ let
            renderQ = q: ''
              <div class="col-md-offset-2 col-md-8 col-xs-12">
                <h2 class="sub_heading_blue">${q.question}</h2>
                <p>${q.answer}</p>
              </div>
            '';
          in
            lib.concatMapStringsSep "\n" renderQ faqs.questions
          }}
        </div>
    </div>

    <div class="footer_background">
        <div class="footer_content_faqs">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-center">
                            <h1 class="section_heading_white">Got another question?</h1>
                            <p class="text_white">
                                Contact us at ${faqs.email}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
