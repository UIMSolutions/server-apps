module servers.apps.controllers.pages.users.create;

@safe:
import servers.apps;

class DUsersCreatePageController : DPageController {
  mixin(ControllerThis!("UsersCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(UsersCreateView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("UsersCreatePageController"));
