module servers.apps.views.groups.read;

@safe:
import servers.apps;

class DGroupsReadView : DView {
  mixin(ViewThis!("GroupsReadView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DGroupsReadView~":DGroupsReadView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Groups -> Read")
    ].toH5;
  }
}
mixin(ViewCalls!("GroupsReadView"));
