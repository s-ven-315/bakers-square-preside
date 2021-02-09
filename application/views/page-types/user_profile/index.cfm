<cfscript>
    userProfile = args.userProfile ?: QueryNew("");
    currentUserId = args.currentUserId;
    relationship = args.connected ?: QueryNew("");
</cfscript>

<cfoutput>
    <cfif currentUserId EQ userProfile.id>
      #renderView(view = 'page-types/user_profile/edit_profile_btn')#
      #renderView(view = 'page-types/user_profile/new_recipe_btn')#
    </cfif>
    
    <cfif userProfile.recordCount>
        <div class="user-profile">
            <h3>#userProfile.display_name#</h3>
            <p>@#userProfile.login_id#</p>
            <cfif IsFeatureEnabled( "websiteusers" )>
              <cfif IsLoggedIn()>
                <cfif currentUserId NEQ userProfile.id>
                  <form action="#event.buildLink(linkTo="page-types.user_profile.follow", queryString="userId=#event.getPageProperty("title")#")#" method="POST">
                    <button>
                      <cfif relationship.recordCount EQ 0 || relationship.connected EQ 0>
                        Follow
                      <cfelse>
                        Unfollow
                      </cfif>
                    </button>
                  </form>
                </cfif>
              </cfif>
            </cfif>
        </div>
    </cfif>
    
    <div class="follow-section">
      #renderView(view = 'page-types/user_profile/relationship_list', args=args)#
    </div>
</cfoutput>