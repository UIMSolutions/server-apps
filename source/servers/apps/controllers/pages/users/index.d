module servers.apps.controllers.pages.users.index;

@safe:
import servers.apps;

class DUsersIndexPageController : DPageController {
  mixin(ControllerThis!("UsersIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(UsersIndexView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("UsersIndexPageController"));
