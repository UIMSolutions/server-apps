module servers.apps.layouts.central;

@safe:
import servers.apps;

string brandName = "Sicherheitsschmiede";
string brandLogo = "/img/headerlogo.png";

class DCentralLayout : DLayout {
  this() { super(); }

  override void initialize(Json configSettings = Json(null)) {
    debug writeln("Initialize 'CentralLayout'"); 
    super.initialize(configSettings);
 
    // Default settings
    this
      .name("CentralLayout"); 
    
    debug writeln("Add navigation"); 
    this
      .navigation(
        MVCNavigation.fixedTop(true));

    debug writeln("Add footer"); 
    this    
      .footer(
        MVCPageFooter);

    this.CMSPageBody(
      UIMPageBody(
          UIMContainer.size("xl")( 
            // Content here
          )
        )
    );           
   
  }

  mixin(OProperty!("DH5Obj", "CMSPageHeader"));
  mixin(OProperty!("DH5Obj", "CMSPageBody"));
  mixin(OProperty!("DH5Obj", "CMSFooter"));
  mixin(OProperty!("DH5Obj", "CMSSecondNavbar"));
  mixin(OProperty!("DH5Obj", "CMSMainNavbar"));

	override string render(IPageController controller, string content, STRINGAA someOptions = null) { 
    debug writeln(someOptions);

		debugMethodCall(moduleName!DCentralLayout~":DCentralLayout("~this.name~")::render(DPageController controller, string content, STRINGAA someOptions = null)");
		super.render(controller, content, someOptions);

    debug writeln(someOptions);

    this.CMSSecondNavbar(
      H5Div(["navbar-expand-md"], 
        H5Div("navbar-menu", ["collapse navbar-collapse"],
          H5Div(["navbar navbar-light"], 
            (someOptions.get("logonMode", null) == "Authorized" ? 
              UIMContainer.size("xl")(
                H5Ul(["navbar-nav"],       
                  UIMNavItem( 
                    UIMNavLink.link("/")( 
                      UIMNavLinkIcon(["d-md-none d-lg-inline-block"]).icon("home"),
                      UIMNavLinkTitle.title("Start")
                    )
                  ),
                  UIMNavItem(["active dropdown"], 
                    UIMNavLink(["dropdown-toggle"], ["href":"#navbar-base", "data-bs-toggle":"dropdown", "data-bs-auto-close":"outside", 
                      "role":"button", "aria-expanded":"false"], 
                      UIMNavLinkIcon(["d-md-none d-lg-inline-block"]).icon("package"),
                      UIMNavLinkTitle.title("Central")
                    ),
                    UIMDropdownMenu(
                      UIMDropdownItem.link("/apps")("Apps"),
                      UIMDropdownItem.link("/favorites")("Favoriten"),
                      UIMDropdownItem.link("/users")("Benutzer"),
                    )
                  )
                ),
                H5Div(["my-2 my-md-0 flex-grow-1 flex-md-grow-0 order-first order-md-last"], 
                  H5Form(["action":"./", "method":"get", "autocomplete":"off", "novalidate":""], 
                    UIMInputIcon( 
                      UIMInputAddon.icon("search"),
                      UIMTextInput(["value":"", "placeholder":"Search…", "aria-label":"Search in website"]) 
                    )
                  )                
                ) 
              )
              : null
            )
          )
        )
      )
    );

    this.CMSMainNavbar(
      H5Header(["navbar navbar-expand-md navbar-light d-print-none"], 
        UIMContainer.size("xl")( 
          H5Button(["navbar-toggler"], ["type":"button", "data-bs-toggle":"collapse", "data-bs-target":"#navbar-menu"], H5Span(["navbar-toggler-icon"])),
/*           UIMNavbarNav(["flex-row order-md-first"], 
          ), */
          H5H1(["navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3"], 
            H5A(["href":"."], 
              H5Img(["navbar-brand-image"], ["src":brandLogo, "width":"110", "height":"32", "alt":brandName])
            )
          ),
          UIMNavbarNav(["flex-row order-md-last"], 
            H5Div(["d-none d-md-flex"], 
              UIMNavLink(["px-0 hide-theme-dark"], ["href":"?theme=dark", "data-bs-toggle":"tooltip", "data-bs-placement":"bottom", "aria-label":"Enable dark mode"], 
                tablerIcon("moon")),                
              UIMNavLink(["px-0 hide-theme-light"], ["href":"?theme=light", "data-bs-toggle":"tooltip", "data-bs-placement":"bottom", "aria-label":"Enable light mode"], 
                tablerIcon("sun")),
              UIMNavItem(["dropdown d-none d-md-flex me-3"], 
                UIMNavLink(["px-0"], ["href":"#", "data-bs-toggle":"dropdown", "tabindex":"-1", "aria-label":"Show notifications"], 
                  H5String(tablerIcon("bell")), UIMBadge(["bg-red"])),
                H5Div(["dropdown-menu dropdown-menu-arrow dropdown-menu-end dropdown-menu-card"], 
                  UIMCard(
                    UIMCardHeader( 
                      H5H3(["card-title"], "Last updates")),
                    H5Div(["list-group list-group-flush list-group-hoverable"], 
                      H5Div(["list-group-item"], 
                        UIMRow(["align-items-center"], 
                          UIMCol.sizes("auto")( H5Span(["status-dot status-dot-animated bg-red d-block"])),
                          H5Div(["col text-truncate"], 
                            H5A(["text-body d-block"], ["href":"#"], "Example 1"),
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              "Change deprecated html tags to text decoration classes (#29604)"
                            )
                          ),
                          UIMCol.sizes("auto")( 
                            H5A(["list-group-item-actions"], ["href":"#"], 
                              tablerIcon("star")
                            )
                          )
                        )
                      ),
                      H5Div(["list-group-item"], 
                        UIMRow(["align-items-center"], 
                          UIMCol.sizes("auto")( H5Span(["status-dot d-block"])),
                          H5Div(["col text-truncate"], 
                            H5A(["text-body d-block"], ["href":"#"], "Example 2"),
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              "justify-content:between ⇒ justify-content:space-between (#29734)"
                            )
                          ),
                          UIMCol.sizes("auto")( 
                            H5A(["list-group-item-actions show"], ["href":"#"], tablerIcon("star"))
                          )
                        )
                      ),
                      H5Div(["list-group-item"], 
                        UIMRow(["align-items-center"], 
                          UIMCol.sizes("auto")( H5Span(["status-dot d-block"])),
                          H5Div(["col text-truncate"], 
                            H5A(["text-body d-block"], ["href":"#"], "Example 3"),
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              "Update change-version.js (#29736)"
                            )
                          ),
                          UIMCol.sizes("auto")( 
                            H5A(["list-group-item-actions"], ["href":"#"], 
                              tablerIcon("star")
                            )
                          )
                        )
                      ),
                      H5Div(["list-group-item"], 
                        UIMRow(["align-items-center"], 
                          UIMCol.sizes("auto")( H5Span(["status-dot status-dot-animated bg-green d-block"])),
                          H5Div(["col text-truncate"], 
                            H5A(["text-body d-block"], ["href":"#"], "Example 4"),
                            H5Div(["d-block text-muted text-truncate mt-n1"], 
                              "Regenerate package-lock.json (#29730)"
                            )
                          ),
                          UIMCol.sizes("auto")( 
                            H5A(["list-group-item-actions"], ["href":"#"], tablerIcon("star"))
                          )
                        )
                      )
                    )
                  )
                )
              )
            ),
            UIMNavItem(["dropdown"], 
              UIMNavLink(["d-flex lh-1 text-reset p-0"], ["data-bs-toggle":"dropdown", "href":"#", "aria-label":"Open user menu", "aria-expanded":"false"], 
                H5Span(["avatar avatar-sm"], ["style":"background-image: url(./static/avatars/000m.jpg)"]),
                H5Div(["d-none d-xl-block ps-2"], 
                  H5Div("ONS"), H5Div(["mt-1 small text-muted"], "Architect")
                )
              ),
              H5Div(["dropdown-menu dropdown-menu-end dropdown-menu-arrow"], 
                UIMDropdownItem.link("/status")("Status"),
                UIMDropdownItem.link("/profile")("Profile"),
                UIMDropdownItem.link("/feedback")("Feedback"),
                UIMDropdownDivider,
                UIMDropdownItem.link("/settings")("Settings"),
                UIMDropdownItem.link("/logout")("Logout")
              )
            )
          )
        )
      )      
    );

    this.CMSFooter(
      UIMFooter.transparent(true)( 
        UIMContainer.size("xl")( 
          UIMRow(["text-center align-items-center flex-row-reverse"], 
            H5Div(["col-lg-auto ms-lg-auto"], 
              H5Ul(["list-inline list-inline-dots mb-0"], 
                H5Li(["list-inline-item"], H5A(["link-secondary"], ["href":"./docs/index.html"], "Documentation")),
                H5Li(["list-inline-item"], H5A(["link-secondary"], ["href":"./license.html"], "License")),
                H5Li(["list-inline-item"], H5A(["link-secondary"], ["href":"https://github.com/tabler/tabler", "target":"_blank", "rel":"noopener"], "Source code")),
                H5Li(["list-inline-item"], 
                  H5A(["link-secondary"], ["href":"https://github.com/sponsors/codecalm", "target":"_blank", "rel":"noopener"], 
                    tablerIcon("heart")~" Sponsor"
                  )
                )
              )
            ),
            H5Div(["col-12 col-lg-auto mt-3 mt-lg-0"], 
              H5Ul(["list-inline list-inline-dots mb-0"], 
                H5Li(["list-inline-item"], 
                  H5String("Copyright © 2022"),
                  H5A(["link-secondary"], ["href":"."], "Tabler"),.
                  H5String(" All rights reserved.")
                ),
                H5Li(["list-inline-item"], 
                  "Generated 2022-09-24 09:54 UTC"
                )
              )
            )
          )
        )
      )
    );

		if (application) {
      debug writeln("Found application");
			someOptions["rootPath"] = application.rootPath;      
			foreach(k,v; application.parameters) if (k !in someOptions) someOptions[k] = v; }

		// creating HTML page
		auto myHtml = H5Html
		.attributes("lang", someOptions.get("lang", "en")).attributes("dir", someOptions.get("dir", "ltr"));
		
    // Head part of HTML
    auto headContent = 
      (someOptions.get("title", null) ? "<title>" ~ someOptions.get("title", null) ~ "</title>":null)~
		  (myMetas.asString~someOptions.get("metas", null))~
		  (myLinks.asString~someOptions.get("links", null))~
		  ("link" in someOptions ? someOptions["link"] : null)~
		  (myStyles.asString~someOptions.get("styles", null))~
		  ("style" in someOptions ? H5Style(someOptions["style"]).toString : null);

    auto myHead = H5Head(headClasses, headAttributes, headContent);

		// Body part of HTML
		auto bodyContent = 
      UIMPage( 
        CMSMainNavbar,
        CMSSecondNavbar,
        UIMPageWrapper( 
          CMSPageHeader,
          UIMPageBody( 
            UIMContainer.size("xl")( 
              (this.layout ?  this.layout.render(controller, content, someOptions) : content)
            )
          ),
          CMSFooter
        )
      ).toString~
      (myScripts.asString~someOptions.get("script", null));

		auto myBody = H5Body(bodyClasses, bodyAttributes, bodyContent);

    return myHtml
      .head(myHead)
      .body_(myBody)
      .toString;
	}
  // #endregion render
}
auto CentralLayout() { return new DCentralLayout; }