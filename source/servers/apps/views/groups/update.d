module servers.apps.views.groups.update;

@safe:
import servers.apps;

class DGroupsUpdateView : DView {
  mixin(ViewThis!("GroupsUpdateView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DGroupsUpdateView~":DGroupsUpdateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Groups -> Update")
    ].toH5;
  }
}
mixin(ViewCalls!("GroupsUpdateView"));
