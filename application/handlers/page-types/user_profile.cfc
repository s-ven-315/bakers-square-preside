component {
    property name="websiteUserService" inject="WebsiteUserService";
    property name="userService" inject="userService";

    private function index(event, rc, prc, args={} ){
        return renderView(
            view = 'page-types/user_profile/index'
            , presideObject = 'user_profile'
            , id = event.getCurrentPageId()
            , args = args
        )

    }
}