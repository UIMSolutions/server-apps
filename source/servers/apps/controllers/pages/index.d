module servers.apps.controllers.pages.index;

@safe:
import servers.apps;

class DIndexPageController : DPageController {
  mixin(ControllerThis!("IndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(MainIndexView(this));
    
    this
      .addChecks(HasHTTPSessionCheck/* , HasSessionCheck */);
  }
}
mixin(ControllerCalls!("IndexPageController"));
