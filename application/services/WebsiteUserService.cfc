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

        if (len(newId)){
            _getSiteTreeService().addPage(
                title = username
                , slug = username
                , page_type = "user_profile"
                , parent_page = "0C02D9B9-5BBF-4839-83FB4C54FEB2E2D4"
            )
          
        }

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

}