<cfoutput>
    <form id="booking-form" action="#event.buildLink( linkTo = "page-types.signup.signup" )#" class="form form-horizontal" method="POST">
        <input type="hidden" name="parentPage" value="#event.getPageProperty( "parent_page" )#">
        #renderForm(
              formName         = "page-types.signup"
            , context          = "website"
            , formId           = "signup"
            , validationResult = rc.validationResult ?: ""
            , savedData		   = rc.formData ?: {}
        )#
        <input type="submit" value="Register" />
        <a href="#event.buildLink( page="login" )#">Already have an account? Login here</a>

    </form>
</cfoutput>