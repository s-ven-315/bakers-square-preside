component extends="coldbox.system.Interceptor" {

    property name="presideObjectService"    inject="provider:PresideObjectService";
    property name="notificationService"     inject="provider:notificationService";
    property name="websiteUserService"      inject="WebsiteUserService";


    public void function postInsertObjectData( required struct interceptData ) {
        var objectName  = arguments.interceptData.objectName    ?: "";
        var id          = arguments.interceptData.id            ?: "";
        var data        = arguments.interceptData.data          ?: {};
        
        switch( objectName ){
            case 'website_user':
           
            notificationService.createNotification(
                topic = "newUserSignUp"
                , type = "INFO"
                , data = {
                    login_id = data.login_id
                    , email_address = data.email_address
                }
                );
            break;
        }
    }
}

