module servers.apps.views.users.delete_;

@safe:
import servers.apps;

class DUsersDeleteView : DView {
  mixin(ViewThis!("UsersDeleteView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DUsersDeleteView~":DUsersDeleteView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Users -> Delete")
    ].toH5;
  }
}
mixin(ViewCalls!("UsersDeleteView"));
