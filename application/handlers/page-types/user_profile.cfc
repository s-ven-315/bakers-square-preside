component {
    property name="websiteUserService"  inject="WebsiteUserService";
    property name="userService"         inject="userService";
    property name="websiteLoginService" inject="WebsiteLoginService";
    property name="recipeService"       inject="RecipeService";

    public function index( event, rc, prc, args = {} ){
		args.userId   = prc.userId ?: "";

        if (args.userId == ""){
            return event.setView( view = "/page-types/user_profile/notFound" );
        }

        args.currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

		event.initializeDummyPresideSiteTreePage();

        args.userProfile = userService.getUserProfile( targetUserId = args.userId )

        args.connected = userService.getRelationship(
              currentUserId   = args.currentUserId
            , targetUserId  = args.userId
        )
        args.follower = userService.getFollower( targetUserId = args.userId );

        args.following = userService.getFollowing( targetUserId = args.userId );

        args.recipe = recipeService.getRecipe( targetUserId = args.userId );

        args.likedRecipe = recipeService.getLikedRecipe( targetUserId = args.userId );

        event.setView( view = "/page-types/user_profile/index", args = args );

    }

    public function edit( event, rc, prc, args = {} ){
        var formData = event.getCollectionForForm();
        var currentUserId = websiteLoginService.getLoggedInUserId();

        var userData = {
              display_name    = rc.profileName
            , id            = currentUserId
        }

        websiteUserService.updateUserDetail( argumentCollection = userData );
      
        setNextEvent(
			url = event.buildLink( userId = currentUserId )
		);
    }

    public function follow( event, rc, prc, args = {} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        userService.updateRelationship(
              currentUserId   = currentUserId
            , targetUserId  = rc.targetUserId
        );

        setNextEvent(
            url = event.buildLink( userId = rc.targetUserId )
		);

    }
}