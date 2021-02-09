component {

    property name="websiteUserService" inject="WebsiteUserService";

    private function index(event, rc, prc, args={} ){
        return renderView(
            view = 'page-types/signup/index'
            , presideObject = 'signup'
            , id = event.getCurrentPageId()
            , args = args
        )

    }
}