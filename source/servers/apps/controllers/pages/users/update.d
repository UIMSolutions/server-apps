module servers.apps.controllers.pages.users.update;

@safe:
import servers.apps;

class DUsersUpdatePageController : DPageController {
  mixin(ControllerThis!("UsersUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(UsersUpdateView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("UsersUpdatePageController"));
