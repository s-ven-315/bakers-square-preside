component implements="preside.system.services.routeHandlers.iRouteHandler" output=false singleton=true{
    // constructor
	/**
	 * @userService.inject userService
	 */
    public any function init( required any userService ) output=false {
        _setUserService(arguments.userService);
    }
    // match(): return true if the incoming URL path should be handled by this route handler
    public boolean function match( required string path, required any event ) output=false{
        return reFindNoCase("^/user/.*?\.html", arguments.path);
    }

    // translate(): take an incoming URL and translate it - use the ColdBox event object to set variables and the current event
    public void function translate( required string path, required any event ) output=false{
        var rc  = event.getCollection();
		var prc = event.getCollection( private=true );

		var userLoginId = ReReplace( arguments.path, "^/user\/(.*?)\.html$", "\1" );
        
        prc.userId = _getUserService().getUserId(userLoginId).id ?: "";

		rc.event = "page-types.user_profile.index";

    }

    // reverseMatch(): return true if the incoming set of arguments passed to buildLink() should be handled by this route handler
    public boolean function reverseMatch( required struct buildArgs, required any event ) output=false {
        return Len( Trim( buildArgs.userId ?: "" ) );
    }

    // build(): take incoming buildLink() arguments and return a URL string
    public string function build( required struct buildArgs, required any event ) output=false {
        if ( len(buildArgs.userId?:"")){
            var userDetail = _getUserService().getUserProfile(buildArgs.userId) ?: QueryNew("");
            return event.getSiteUrl() & "/user/#userDetail.login_id#.html";
        }
    }

    // private getter & setter
    private any function _getUserService() output=false {
		return _userService;
	}
	private void function _setUserService( required any userService ) output=false {
		_userService = arguments.userService;
	}
}