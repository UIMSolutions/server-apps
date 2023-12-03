module servers.apps.controllers.pages.groups.delete_;

@safe:
import servers.apps;

class DGroupsDeletePageController : DPageController {
  mixin(ControllerThis!("GroupsDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(GroupsDeleteView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("GroupsDeletePageController"));
