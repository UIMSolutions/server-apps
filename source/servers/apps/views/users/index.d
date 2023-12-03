module servers.apps.views.users.index;

@safe:
import servers.apps;

class DUsersIndexView : DView {
  mixin(ViewThis!("UsersIndexView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DUsersIndexView~":DUsersIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Users -> Index")
    ].toH5;
  }
}
mixin(ViewCalls!("UsersIndexView"));
