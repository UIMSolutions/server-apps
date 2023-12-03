module servers.apps;

import std;

public import uim.servers;
import vibe.d;
mixin ImportUim;

public import colored;

// Additional imports
public import uim.jsonbase;
public import uim.entitybase;
public import uim.models;
public import uim.apps;

// Required models
public import models.systems;

// Used layouts
public import layouts.tabler;


public { // Owining packages
  import servers.apps.server;
  import servers.apps.controllers;
  import servers.apps.layouts;
  import servers.apps.views;
}

static this() {
  thisServer = AppsServer
    .rootPath("/");
  
	thisServer
		.defaultLayout(CentralLayout);

	if (thisServer.defaultLayout) {
		debug writeln("Server has Layout");
	}
	else {
		debug writeln("Server has no Layout");
	}

	with(thisServer) {
		addControllers([
			"server.index.page": IndexPageController,
    	"server.login.page": LoginPageController,
    	"server.login2.page": Login2PageController,
    	"server.logout.page": LogoutPageController,
    	"server.signin.page": SignInPageController,
    	"server.signinlink.page": SignInLinkPageController,
    	"server.signup.page": SignUpPageController,
    	"server.login.action": LoginActionController,
    	"server.login2.action": Login2ActionController,
    	"server.signin.action": SignInActionController,
    	"server.signup.action": SignUpActionController,

    	"server.users.index":  UsersIndexPageController,
    	"server.users.create": UsersCreatePageController,
    	"server.users.read": 	 UsersReadPageController,
    	"server.users.update": UsersUpdatePageController,
    	"server.users.delete": UsersDeletePageController,

    	"server.groups.index":  GroupsIndexPageController,
    	"server.groups.create": GroupsCreatePageController,
    	"server.groups.read": 	GroupsReadPageController,
    	"server.groups.update": GroupsUpdatePageController,
    	"server.groups.delete": GroupsDeletePageController
		]);
    addRoutes(
			Route("", HTTPMethod.GET, controller("server.index.page")),
			Route("/", HTTPMethod.GET, controller("server.index.page")),
			Route("apps", HTTPMethod.GET, controller("server.index.page")),
    	Route("login", HTTPMethod.GET, controller("server.login.page")),
    	Route("login2", HTTPMethod.GET, controller("server.login2.page")),
    	Route("logout", HTTPMethod.GET, controller("server.logout.page")),
    	Route("signin", HTTPMethod.GET, controller("server.signin.page")),
    	Route("signinlink", HTTPMethod.GET, controller("server.signinlink.page")),
    	
			// Actions
			Route("signup", HTTPMethod.GET, controller("server.signup.page")),
    	Route("login_action", HTTPMethod.POST, controller("server.login.action")),
    	Route("login2_action", HTTPMethod.POST, controller("server.login2.action")),
    	Route("signin_action", HTTPMethod.POST, controller("server.signin.action")),
    	Route("signup_action", HTTPMethod.POST, controller("server.signup.action")),

			// Users
    	Route("users", 				HTTPMethod.GET, controller("server.users.index")),
    	Route("users/create", HTTPMethod.GET, controller("server.users.create")),
    	Route("users/read",   HTTPMethod.GET, controller("server.users.read")),
    	Route("users/update", HTTPMethod.GET, controller("server.users.update")),
    	Route("users/delete", HTTPMethod.GET, controller("server.users.delete")),

			// Groups
    	Route("groups", 			 HTTPMethod.GET, controller("server.groups.index")),
    	Route("groups/create", HTTPMethod.GET, controller("server.groups.create")),
    	Route("groups/read",   HTTPMethod.GET, controller("server.groups.read")),
    	Route("groups/update", HTTPMethod.GET, controller("server.groups.update")),
    	Route("groups/delete", HTTPMethod.GET, controller("server.groups.delete"))
		);
	}

	debug writeln("Create Database");
	auto entityBase = EntityBase;
	debug writeln("jBase");
	auto jsonbase = new DJSBFileBase("../../DATABASES/uim");
	debug writeln("Loading...");
	jsonbase.load();
	debug writeln("Import");
	entityBase.importDatabase(jsonbase);
	// debug writeln("Found Tenants:", entityBase.countEntityTenants);

// Didn't work
/*   static import core.runtime;
  void* lib = core.runtime.Runtime.loadLibrary("apps/libvibetest.so");
  if (lib is null) {
    writeln("library not loaded");
    return;
  }
  writeln("library loaded"); */
}
