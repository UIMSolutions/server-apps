module servers.apps.controllers.pages.groups.create;

@safe:
import servers.apps;

class DGroupsCreatePageController : DPageController {
  mixin(ControllerThis!("GroupsCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .view(GroupsCreateView(this));
    
    this
      .addChecks(HasHTTPSessionCheck, HasSessionCheck);
  }
}
mixin(ControllerCalls!("GroupsCreatePageController"));
