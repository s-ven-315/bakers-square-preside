<cfscript>
    userProfile = args.userProfile ?: QueryNew("");
    currentLoginUser = args.currentLoginUser
</cfscript>

<cfoutput>
    <cfif currentLoginUser EQ userProfile.id>
	<form name="edit-profile" action="#event.buildLink(linkTo="page-types.user_profile._edit")#" method="GET">
        <button class="edit-profile-prompt">Edit Profile</button>
    </form>
    </cfif>
    <cfif userProfile.recordCount>
        <div class="user-profile">
            <h3>#userProfile.display_name#</h3>
            <p>@#userProfile.login_id#</p>
            <cfif currentLoginUser NEQ userProfile.id>
                <button>Follow</button>
            </cfif>
        </div>
    </cfif>
</cfoutput>