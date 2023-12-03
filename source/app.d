import vibe.vibe;
import servers.apps;

mixin DefaultConfig!("server-apps");
mixin ReadConfig;
void main(string[] args) {
  readConfig();
  mixin GetoptConfig;
  
	auto router = new URLRouter;	
	debug writeln("SetRouterDefault!()");
  mixin(SetRouterDefault!());

  debug writeln("--- Set default layout");
  thisServer.defaultLayout(CentralLayout);

  debug writeln("--- Register router");
	thisServer.registerRouter(router);
  
  auto myApps = AppRegistry.apps;
  debug writeln ("%s registered apps".format(myApps.length));
  thisServer.addApps(myApps); 
  // myApps.each!(myApp => myApp.manager(thisServer)); // Work around
  debug writeln ("%s apps in server".format(thisServer.apps.length));
  
  debug writeln("--- Set HTTP");
  mixin(SetHTTP!());
	runApplication();
}