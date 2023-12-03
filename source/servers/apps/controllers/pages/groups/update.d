module servers.apps.controllers.pages.groups.update;

@safe:
import servers.apps;

class DGroupsUpdatePageController : DPageController {
  mixin(ControllerThis!("GroupsUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(GroupsUpdateView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("GroupsUpdatePageController"));
