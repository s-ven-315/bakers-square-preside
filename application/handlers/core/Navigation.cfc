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

    private function mainMenu( event, rc, prc, args={} ){
        args.menuItems = [
            {
                "id"       : "F9923DE1-9B2D-4544-A4E7F8E198888211",
                "title"    : "News",
                "active"   : true,
                "children" : []
            },
            {
                "id"       : "F9923DE1-9B2D-4544-A4E7F8E198888A6F",
                "title"    : "About us",
                "active"   : false,
                "children" : [
                    {
                        "id"       : "F9923DE1-9B2D-4544-A4E7F8E198888000",
                        "title"    : "Our team",
                        "active"   : false,
                        "children" : []
                    },
                    {
                        "id"       : "F9923DE1-9B2D-4544-A4E7F8E198888FF8",
                        "title"    : "Our offices",
                        "active"   : false,
                        "children" : []
                    },
                    {
                        "id"       : "F9923DE1-9B2D-4544-A4E7F8E1988887FE",
                        "title"    : "Our ethos",
                        "active"   : false,
                        "children" : []
                    }
                ]
            },
            {
                "id"       : "F9923DE1-9B2D-4544-A4E7F8E19888834A",
                "title"    : "COntact us",
                "active"   : false,
                "children" : []
            }
        ]
        
        
        return renderView(
            view = 'core/navigation/mainMenu'
            , args = args
        )
    }
}