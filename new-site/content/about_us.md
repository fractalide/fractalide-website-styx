<section id="about_us">
    <div class="header_background">
        <div class="header_content_stack">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        <div class="text-center">
                            <h1 class="section_heading_blue fractal_white">About us</h1>
                            <p class="text_white">
                                Fractalide started life as a Master Thesis in Université catholique de Louvain under Professor Peter Van Roy back in 2014. Since then the project has undergone multiple rewrites in different programming languages, with new functionality and realizations. Every contribution helps us complete this undertaking. Thank you.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="team">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="text-center">
                    <h1 class="section_heading_blue fractal_blue">Team</h1>
                </div>
            </div>
        </div>
        <div class="row">
          {{ let
            renderMember = member: ''
              <div class="col-md-4 col-xs-12 text-center team_member">
                <img src="/img/${member.image}" />
                <h2 class="sub_heading_blue">${member.name}</h2>
                <p>${member.title}</p>
                ${lib.concatMapStringsSep "\n" renderNetwork member.networks}
              </div> <!-- team_member -->
            '';
            renderNetwork = network: ''
              <a href="${network.url}" target="_blank" rel="external">
                <img src="/img/${network.icon}" width="30px" />
              </a>
            '';
          in
            lib.concatMapStringsSep "\n" renderMember (lib.sortBy "weight" "asc" team)
          }}
        </div>
    </div>
</section>
<section id="vision">
    <div class="footer_gradient">
        <div class="container content_vision">
            <div class="row">
                <div class="col-md-12">
                    <div class="text-center">
                        <h1 class="section_heading_blue fractal_white">Vision</h1>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-offset-2 col-md-8 col-xs-12">
                    <h2 class="sub_heading_white">Fractalide is a marketplace of reusable components that can be used with graphical programming tools to build a solution to virtually any problem.</h2>
                    <p>
                        Currently it is unintuitive for non-technical end users to interact with published cryptocontracts. For this reason cryptocontracts will not easily reach mainstream.
                    </p>
                    <p>
                        End users expect a convenient one-click platform that delivers user friendly yet secure third party applications which are designed to use cryptocontracts. This platform can be broken down into three parts: building, distribution and the blockchain interaction parts.
                    </p>
                    <p>
                        The vision is to build a platform that makes the building and distribution of blockchain friendly applications laughably easy.
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-offset-2 col-md-4 col-xs-12" >
                    <h2 class="sub_heading_white">Hyperflow</h2>
                    <p>
                        Hyperflow is a Rapid Application Development (RAD) platform. It facilitates the creation of applications and components that interact with smart contracts which can be published on.
                    </p>
                </div>
                <div class="col-md-4 col-xs-12">
                    <h2 class="sub_heading_white">Fractalmarket</h2>
                    <p>
                        Fractalmarket is a cryptocontract app marketplace. It aims to be the main marketplace that allows buying and selling of cryptocontract applications between third party vendors and end users.
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>
