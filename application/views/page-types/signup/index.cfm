<cfoutput>
    <form id="booking-form" action="#event.buildLink(linkTo="page-types.signup.signup")#" class="form form-horizontal" method="POST">
        #renderForm(
            formName         = "page-types.signup"
            , context          = "website"
            , formId           = "signup"
            , validationResult = rc.validationResult ?: ""
            , savedData		   = rc.formData ?: {}
        )#
        <input type="submit" value="Register" />
        <a href="#event.buildLink()#">Already have an account? Login here</a>

    </form>
</cfoutput>