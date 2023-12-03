module servers.apps.views.users.create;

@safe:
import servers.apps;

class DUsersCreateView : DView {
  mixin(ViewThis!("UsersCreateView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DUsersCreateView~":DUsersCreateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Server -> Users -> Create")
    ].toH5;
  }
}
mixin(ViewCalls!("UsersCreateView"));
