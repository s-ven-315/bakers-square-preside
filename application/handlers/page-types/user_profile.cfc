component {
    property name="websiteUserService" inject="WebsiteUserService";
    property name="userService" inject="userService";
    property name="websiteLoginService" inject="WebsiteLoginService";

    private function index(event, rc, prc, args={} ){
        args.currentUserId = websiteLoginService.getLoggedInUserDetails().login_id ?: "";
        var targetUserId = event.getPageProperty("title")
        args.userProfile = userService.getUserProfile(
            user_id = targetUserId
        )
        args.connected = userService.getRelationship(
            login_user = args.currentUserId
            , target_user = targetUserId
        )

        return renderView(
            view = 'page-types/user_profile/index'
            , presideObject = 'user_profile'
            , id = event.getCurrentPageId()
            , args = args
        )
    }

    public function edit( event, rc, prc, args={} ){
        var formData = event.getCollectionForForm();
        var currentUserId = websiteLoginService.getLoggedInUserId()

        var userData = {
            display_name = rc.profileName
            , login_id = currentUserId
        }

        websiteUserService.updateUserDetail( argumentCollection = userData );

        setNextEvent(
			url= event.buildLink(page="user_profile")
		);
    }

    public function follow( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserDetails().login_id ?: "";
        var targetUserId = url.userId;

        userService.updateRelationship(
            login_user = currentUserId
            , target_user = targetUserId
        );

        setNextEvent(
			url= event.buildLink(page="#currentUserId#")
		);

    }
}