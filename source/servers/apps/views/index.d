module servers.apps.views.index;

@safe:
import servers.apps;

class DMainIndexView : DView {
  mixin(ViewThis!("MainIndexView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DMainIndexView~"DMainIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("APP CMS -> Index")
    ].toH5;
  }
}
mixin(ViewCalls!("MainIndexView"));
