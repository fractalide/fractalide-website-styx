<section id="roadmap">
    <div class="header_gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h1 class="section_heading_blue fractal_white">Roadmap</h1>
                    </div>
                </div>
                <div class="col-md-offset-2 col-md-8">
                    <div class="text-center">
                        <p class="text_dark_blue">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                        <p class="text_dark_blue">
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="roadmap">
      {{ let
        iconBaseURL = "/img/roadmap-min/";
        upperCase = ["A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N"]
                    ++ ["O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"];
        lowerCase = ["a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n"]
                    ++ ["o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"];
        stringToId = builtins.replaceStrings (upperCase ++ [" "]) (lowerCase ++ ["_"]); 
        renderRelease = (release: with release; let
          output = ''
            <div class="roadmap_fractal text-center">
              <img src="../img/roadmap-min/fractal-min.png"/>
              <h2 class="text_dark_blue">${title}</h2>
              <p class="text_dark_blue">
                ${description}
              </p>
              ${if !(release ? features) then ''
                  <div class="roadmap_container">
                    <div class="roadmap_line"></div>
                  </div>
                '' else lib.concatMapStringsSep "\n" renderFeature features
              }
            </div>
          '';
          renderFeature = (feature:
            let
              progress = builtins.toString feature.progress-bar;
              id = stringToId "release ${release.title} feature ${feature.title}";
              work_done = if feature ? "Work Done" then feature."Work Done" else null;
            in with feature;
            ''
              <div class="roadmap_spot">
                <img src="${iconBaseURL}spot-min.png"/>
              </div>
              <div class="roadmap_container">
                <div class="roadmap_line"></div>
                <div class="roadmap_step">
                  <h2 class="sub_heading_blue">${title}</h2>
                </div>
                <div class="roadmap_line_fill"></div>
                <div class="roadmap_info">
                  <div class="roadmap_progress">
                    <p>Progress <span class="pull-right">${progress}%</span></p>
                    <div class="progress">
                      <div class="progress-bar" role="progressbar" aria-valuenow="${progress}"
                           aria-valuemin="0" aria-valuemax="100" style="width: ${progress}%;">
                        <span class="sr-only">${progress}% Complete</span>
                      </div>
                    </div>
                  </div>  <!-- roadmap_progress -->
                  <div class="roadmap_detail">
                    <a role="button" data-toggle="collapse" href="#${id}_objectives"
                       aria-expanded="false" aria-controls="${id}">
                        <i class="fa fa-dot-circle-o" aria-hidden="true"></i> Objectives <i class="fa fa-chevron-up" aria-hidden="true"></i>
                    </a>
                    <div class="collapse" id="${id}_objectives">
                      ${if (feature ? Objectives) && ((builtins.length Objectives) > 0) then
                        if (builtins.length Objectives) > 1 then ''
                          <ul>
                        '' + lib.concatMapStringsSep "\n"
                          (objective: "<li>${objective}</li>") Objectives + ''

                          </ul>
                        '' else ''
                          <p>${builtins.elemAt objective 0}</p>
                        ''
                      else ""}
                    </div>
                  </div> <!-- roadmap_detail -->
                  <div class="roadmap_detail">
                    <a role="button" data-toggle="collapse" href="#${id}_workdone"
                       aria-expanded="false" aria-controls="${id}">
                        <i class="fa fa-check-circle" aria-hidden="true"></i> Work Done <i class="fa fa-chevron-up" aria-hidden="true"></i>
                    </a>
                    <div class="collapse" id="${id}_workdone">
                      ${if (builtins.isList work_done) && ((builtins.length work_done) > 0) then
                        if builtins.length work_done > 1 then ''
                          <ul>
                        '' + (lib.concatMapStringsSep "\n"
                          (done_item: "<li>${done_item}</li>") work_done) + ''

                          </ul>
                        '' else "<p>${builtins.elemAt work_done 0}</p>"
                      else ""}
                    </div>
                  </div> <!-- roadmap_detail -->
                </div> <!-- roadmap_info -->
              </div> <!-- roadmap_container -->
            '');
          in
            output);
       in
         lib.concatMapStringsSep "\n" renderRelease changelog.Fractalide-Releases.releases
       }}
        <div class="roadmap_end">
            <div class="roadmap_line_end"></div>
            <div class="roadmap_fractal text-center align-text-bottom">
                <img src="../img/roadmap-min/fractal-min.png"/>
            </div>
        </div>
    </div>
    <div class="footer_background roadmap_footer">
        <div class="footer_content_roadmap">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="text-center">
                            <h1 class="section_heading_white">Fractalide</h1>
                            <p class="text_white">
                                Your smart contract app marketplace
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
