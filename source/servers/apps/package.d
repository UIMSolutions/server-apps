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

/* public { // Apps
		import apps.automotive;
		import apps.bim;
		import apps.cms;
		import apps.contacts;
		import apps.crm;
		import apps.ecm;
		import apps.educations;
		import apps.gis;
		import apps.grundschutz;
		import apps.hcm;
		import apps.healthcare;
		import apps.inventories;
		import apps.marketing;
		import apps.modeller;
		import apps.photomanager;
		import apps.portals;
		import apps.privacy;
		import apps.projects;
		import apps.retail;
		import apps.scm;
		import apps.services;
		import apps.systems;
		import apps.threats;
		import apps.timesheet;
		import apps.todos;
		import apps.transportation;
		import apps.uml;
		import apps.warehouse;
		import apps.workflows;
} */

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
    .rootPath("/")
    .layout(CentralLayout)
    .addRoute(Route("apps", HTTPMethod.GET, MainIndexPageController))
    .addRoute(Route("login", HTTPMethod.GET, LoginPageController))
    .addRoute(Route("login2", HTTPMethod.GET, Login2PageController))
    .addRoute(Route("logout", HTTPMethod.GET, LogoutPageController))
    .addRoute(Route("signin", HTTPMethod.GET, SignInPageController))
    .addRoute(Route("signinlink", HTTPMethod.GET, SignInLinkPageController))
    .addRoute(Route("signup", HTTPMethod.GET, SignUpPageController));

// Didn't work
/*   static import core.runtime;
  void* lib = core.runtime.Runtime.loadLibrary("apps/libvibetest.so");
  if (lib is null) {
    writeln("library not loaded");
    return;
  }
  writeln("library loaded"); */
  
}
