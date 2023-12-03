module servers.apps.views.users.read;

@safe:
import servers.apps;

class DUsersReadView : DView {
  mixin(ViewThis!("UsersReadView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DUsersReadView~":DUsersReadView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Users -> Read")
    ].toH5;
  }
}
mixin(ViewCalls!("UsersReadView"));
