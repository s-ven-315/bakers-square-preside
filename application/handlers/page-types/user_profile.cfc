component {
    property name="websiteUserService" inject="WebsiteUserService";
    property name="userService" inject="userService";
    property name="websiteLoginService" inject="WebsiteLoginService";

    private function index(event, rc, prc, args={} ){
        args.currentUserId = websiteLoginService.getLoggedInUserId() ?: "";
        var targetUserId = event.getPageProperty("title");
        args.userProfile = userService.getUserProfile(
            target_user = targetUserId
        )
        args.connected = userService.getRelationship(
            login_user = args.currentUserId
            , target_user = args.userProfile.id
        )
        args.follower = userService.getFollower(target_user = args.userProfile.id);
        args.following = userService.getFollowing(target_user=args.userProfile.id);
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
			url= event.buildLink(page="#url.pageId#")
		);
    }

    public function follow( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";
        var targetUserId = userService.getUserProfile(target_user = url.userId);

        userService.updateRelationship(
            login_user = currentUserId
            , target_user = targetUserId.id
        );

        setNextEvent(
			url= event.buildLink(page="#targetUserId.profile#")
		);

    }
}