module servers.apps.controllers.pages.index;

@safe:
import servers.apps;

class DMainIndexPageController : DSRVPageController {
  mixin(ControllerThis!("MainIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(MainIndexView(this));
  }
}
mixin(ControllerCalls!("MainIndexPageController"));
