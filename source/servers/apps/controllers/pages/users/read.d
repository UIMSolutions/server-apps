module servers.apps.controllers.pages.users.read;

@safe:
import servers.apps;

class DUsersReadPageController : DPageController {
  mixin(ControllerThis!("UsersReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(UsersReadView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("UsersReadPageController"));
