module servers.apps.server;

@safe:
import servers.apps;

class DAppsServer : DServer, ILayoutManager, ISessionManager {
  mixin LayoutManagerTemplate;
  mixin SessionManagerTemplate;

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    _layouts = LayoutContainer;
    _sessions = SesssionContainer;
  }
}
auto AppsServer() { return new DAppsServer; }