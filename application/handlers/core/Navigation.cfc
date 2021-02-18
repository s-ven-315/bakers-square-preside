component {

    property name="userService" inject="userService";
    property name="websiteLoginService" inject="WebsiteLoginService";


    private function mainNavigation(event, rc, prc, args={} ){
        var loggedIn = websiteLoginService.getLoggedInUserDetails() ?: "";
        args.currentUserId = loggedIn.login_id ?: "";

        args.userProfile = userService.getUserProfile(
            target_user = args.currentUserId
        )

        return renderView(
            view = 'core/navigation/mainNavigation'
            , args = args
        )

    }

}