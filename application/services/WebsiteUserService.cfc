/**
 * @presideService
 * @singleton
 */

component {
    /**
    * @sitetreeService.inject SitetreeService
    */
    public any function init(
        required any sitetreeService,
    ) {
        _setSitetreeService(arguments.sitetreeService);
    }

    public string function saveUser(
        required string username
        , required string email
    ) {
        var newId = $getPresideObject('website_user').insertData(
            data = {
                login_id = arguments.username
                , email_address = arguments.email
                , display_name = arguments.username
            }
        );

        return newId;
    }

    public boolean function isExistingUser(
        string email = ""
        , string username = ""
    ){
        var filter = {}
        if ( !len(arguments.email & arguments.username)) return false;
        if (len(arguments.email)) filter.email_address = arguments.email;
        if (len(arguments.username)) filter.login_id = arguments.username;

        return $getPresideObject('website_user').dataExists( filter = filter );
    }

    private any function _getSiteTreeService() {
        return _sitetreeService;
    }

    private void function _setSiteTreeService( required any sitetreeService ) {
        _sitetreeService = arguments.sitetreeService
    }

    public function updateUserDetail(
        required string display_name
        , required string login_id
    ){
        return $getPresideObject('website_user').updateData(
            data = {
                display_name = arguments.display_name
                
            }
            , filter = {id = arguments.login_id}
        )
    }
}