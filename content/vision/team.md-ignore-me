<div class="team_section">
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
</div>
