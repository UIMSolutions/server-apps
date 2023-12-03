module servers.apps.server;

@safe:
import servers.apps;

class DAppsServer : DServer {
}
auto AppsServer() { return new DAppsServer; }