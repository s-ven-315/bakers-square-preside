component {

    property name="websiteUserService" inject="WebsiteUserService";
    property name="websiteLoginService" inject="websiteLoginService";
    property name="siteTreeService" inject="siteTreeService";

    private function index(event, rc, prc, args={} ){

        if (websiteLoginService.isLoggedIn()){
            setNextEvent(
                url = event.buildLink( page="homepage" )
            )
        }

        return renderView(
            view = 'page-types/signup/index'
            , presideObject = 'signup'
            , id = event.getCurrentPageId()
            , args = args
        )

    }

    public function signup( event, rc, prc, args={} ){
        var formData = event.getCollectionForForm();
        var validationResult = validateForms();

        if ( formData.password != formData.confirm_password ){
            validationResult.addError( fieldName="password", message="cms:error:password_not_same");
            validationResult.addError( fieldName="confirm_password", message="cms:error.password_not_same");
        }

        if( websiteUserService.isExistingUser( email = formData.email ) ){
			validationResult.addError( fieldName="email" , message="This email already exists. Please use another email.");	
		}

		if( websiteUserService.isExistingUser( username = formData.username ) ){
			validationResult.addError( fieldName="username" , message="This username already exists. Please use a different username.");	
        }
        
        if ( !validationResult.validated() ){
            setNextEvent(
                url = event.buildLink(page="signup")
                , persistStruct = {
                    validationResult=validationResult
                    , error=true
                    , formData=formData
                }
            )
        } else {
            try {
                var websiteUserData = {
                    username = formData.username
                  , email = formData.email
                  , pageId = pageId
                }

                var userId = websiteUserService.saveUser( argumentCollection = websiteUserData );
                
                websiteLoginService.changePassword( 
                    password = formData.password
                    , userId = userId
                );

                websiteLoginService.login(
                    loginId            = formData.username
			        , password         = formData.password
                );
            }catch(any e){
                writeDump(e)
                abort;
            }
            
        }

        setNextEvent(
            url = event.buildLink( page="homepage" )
            , persistStruct = {
                success = true
                , username = formData.username
                , email = formData.email
            }
        );

    }
}