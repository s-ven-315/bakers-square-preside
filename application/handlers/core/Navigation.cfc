component {

    property name="userService" inject="userService";
    property name="websiteLoginService" inject="WebsiteLoginService";


    private function mainNavigation(event, rc, prc, args={} ){
        args.currentUserId = websiteLoginService.getLoggedInUserId() ?: "";
        args.userProfile = userService.getUserProfile(targetUserId = args.currentUserId);

        return renderView(
            view = 'core/navigation/mainNavigation'
            , args = args
        )

    }

}