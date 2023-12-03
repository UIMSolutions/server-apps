module servers.apps.views.groups.index;

@safe:
import servers.apps;

class DGroupsIndexView : DView {
  mixin(ViewThis!("GroupsIndexView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DGroupsIndexView~":DGroupsIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Groups -> Index")
    ].toH5;
  }
}
mixin(ViewCalls!("GroupsIndexView"));
