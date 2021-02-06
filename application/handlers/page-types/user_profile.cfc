component {
    property name="websiteUserService" inject="WebsiteUserService";
    property name="userService" inject="userService";
    property name="websiteLoginService" inject="WebsiteLoginService";

    private function index(event, rc, prc, args={} ){
        args.userProfile = userService.getUserProfile(
            display_name = event.getPageProperty("title")
        )

        args.currentLoginUser = websiteLoginService.getLoggedInUserId() ?: "";

        return renderView(
            view = 'page-types/user_profile/index'
            , presideObject = 'user_profile'
            , id = event.getCurrentPageId()
            , args = args
        )
    }

    public void function edit( event, rc, prc, args={} ){
        event.setLayout( "adminModalDialog" );
        event.setView( "admin/widgets/browserDialog" );
        // return renderView(
        //     view = 'page-types/user_profile/_edit'
        //     , presideObject = 'user_profile'
        //     , id = event.getCurrentPageId()
        //     , args = args
        // )
    }
}