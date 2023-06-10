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

  thisServer
    .layout(CentralLayout)
		.register(router)
    .registerApps(
      AppRegistry.apps
    );

  writeln("Registered Apps:");
  writeln(AppRegistry.paths);
  
  mixin(SetHTTP!());
	runApplication();
}