component {
    property name="websiteUserService" inject="WebsiteUserService";
    property name="userService" inject="userService";
    property name="websiteLoginService" inject="WebsiteLoginService";
    property name="recipeService" inject="RecipeService";

    private function index(event, rc, prc, args={} ){
        args.currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        args.userProfile = userService.getUserProfile(
            targetUserId = url.userId
        )
        args.connected = userService.getRelationship(
            currentUserId = args.currentUserId
            , targetUserId = url.userId
        )
        args.follower = userService.getFollower(targetUserId = url.userId);
        args.following = userService.getFollowing(targetUserId=url.userId);
        return renderView(
            view = 'page-types/user_profile/index'
            , presideObject = 'user_profile'
            , id = event.getCurrentPageId()
            , args = args
        )
    }

    public function edit( event, rc, prc, args={} ){
        var formData = event.getCollectionForForm();
        var currentUserId = websiteLoginService.getLoggedInUserId();

        var userData = {
            display_name = rc.profileName
            , id = currentUserId
        }

        websiteUserService.updateUserDetail( argumentCollection = userData );
      
        setNextEvent(
			url= event.buildLink(page="user_profile", queryString="userId=#currentUserId#")
		);
    }

    public function follow( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        userService.updateRelationship(
            currentUserId = currentUserId
            , targetUserId = rc.targetUserId
        );

        setNextEvent(
            url= event.buildLink(page="user_profile", queryString="userId=#rc.targetUserId#")
		);

    }
}