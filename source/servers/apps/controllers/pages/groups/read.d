module servers.apps.controllers.pages.groups.read;

@safe:
import servers.apps;

class DGroupsReadPageController : DPageController {
  mixin(ControllerThis!("GroupsReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(GroupsReadView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("GroupsReadPageController"));
