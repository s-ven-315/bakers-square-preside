component implements="preside.system.services.routeHandlers.iRouteHandler" output=false singleton=true{
    // constructor
	/**
	 * @userService.inject userService
	 * @recipeService.inject recipeService
	 */
    public any function init( 
        required any userService
        , required any recipeService
    ){
        _setUserService(arguments.userService);
        _setRecipeService(arguments.recipeService);
    }
    // match(): return true if the incoming URL path should be handled by this route handler
    public boolean function match( required string path, required any event ) output=false{
        return reFindNoCase("^/user/.*?\/recipe/.*?\.html", arguments.path);
    }

    // translate(): take an incoming URL and translate it - use the ColdBox event object to set variables and the current event
    public void function translate( required string path, required any event ) output=false{
        var rc  = event.getCollection();
		var prc = event.getCollection( private=true );

		var userLoginId = ReReplace( arguments.path, "^/user\/(.*?)\/recipe\/(.*?)\.html$", "\1" );
		var recipeName = ReReplace( arguments.path, "^/user\/(.*?)\/recipe\/(.*?)\.html$", "\2" );

        recipeName = replace(recipeName, "-", " ", "ALL");

        prc.userId = _getUserService().getUserId(userLoginId).id ?: "";

        prc.recipeId = _getRecipeService().getRecipeDetailByOwnerAndName(recipeName = recipeName, userId = prc.userId ).id ?: "";

		rc.event = "page-types.recipe_page.index";

    }

    // reverseMatch(): return true if the incoming set of arguments passed to buildLink() should be handled by this route handler
    public boolean function reverseMatch( required struct buildArgs, required any event ) output=false {
        return Len( Trim( buildArgs.recipeId ?: "" ) );
    }

    // build(): take incoming buildLink() arguments and return a URL string
    public string function build( required struct buildArgs, required any event ) output=false {
        if ( len(buildArgs.recipeId?:"") && len(buildArgs.userId?:"")){
            var userDetail = _getUserService().getUserProfile(buildArgs.userId) ?: QueryNew("");
            var recipeDetail = _getRecipeService().getDetail(buildArgs.recipeId) ?: QueryNew("");
            var recipeName = REReplaceNoCase(recipeDetail.name, "[^a-z0-9]", "-", "ALL")
            return event.getSiteUrl() & "/user/#userDetail.login_id#/recipe/#recipeName#.html";
        }
    }

    // private getter & setter
    private any function _getUserService() output=false {
		return _userService;
	}
	private void function _setUserService( required any userService ) output=false {
		_userService = arguments.userService;
	}
    private any function _getRecipeService() output=false {
		return _recipeService;
	}
	private void function _setRecipeService( required any recipeService ) output=false {
		_recipeService = arguments.recipeService;
	}
}