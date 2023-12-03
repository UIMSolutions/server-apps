module servers.apps.controllers.pages.users.delete_;

@safe:
import servers.apps;

class DUsersDeletePageController : DPageController {
  mixin(ControllerThis!("UsersDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(UsersDeleteView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("UsersDeletePageController"));
