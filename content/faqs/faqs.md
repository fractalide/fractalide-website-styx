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
