module servers.apps.views.users.update;

@safe:
import servers.apps;

class DUsersUpdateView : DView {
  mixin(ViewThis!("UsersUpdateView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DUsersUpdateView~":DUsersUpdateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Users -> Update")
    ].toH5;
  }
}
mixin(ViewCalls!("UsersUpdateView"));
