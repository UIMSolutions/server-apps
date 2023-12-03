module servers.apps.controllers.pages.groups.index;

@safe:
import servers.apps;

class DGroupsIndexPageController : DPageController {
  mixin(ControllerThis!("GroupsIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(GroupsIndexView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("GroupsIndexPageController"));
