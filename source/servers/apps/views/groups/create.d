module servers.apps.views.groups.create;

@safe:
import servers.apps;

class DGroupsCreateView : DView {
  mixin(ViewThis!("GroupsCreateView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DGroupsCreateView~":DGroupsCreateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Groups -> Create")
    ].toH5;
  }
}
mixin(ViewCalls!("GroupsCreateView"));
