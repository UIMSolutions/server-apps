module servers.apps.views.groups.delete_;

@safe:
import servers.apps;

class DGroupsDeleteView : DView {
  mixin(ViewThis!("GroupsDeleteView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DGroupsDeleteView~":DGroupsDeleteView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Groups -> Delete")
    ].toH5;
  }
}
mixin(ViewCalls!("GroupsDeleteView"));
