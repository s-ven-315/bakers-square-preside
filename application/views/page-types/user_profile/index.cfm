<cfscript>
    userProfile = args.userProfile ?: QueryNew("");
    currentUserId = args.currentUserId;
    relationship = args.connected ?: QueryNew("");
    recipe = args.recipe ?: QueryNew("");
    likedRecipe = args.likedRecipe ?: QueryNew("");
</cfscript>

<cfoutput>
    <cfif currentUserId EQ userProfile.id>
      #renderView(view = 'page-types/user_profile/edit_profile')#
      #renderView(view = 'page-types/user_profile/new_recipe')#
    </cfif>
    
    <cfif userProfile.recordCount>
        <div class="user-profile">
            <h3>#userProfile.display_name#</h3>
            <p>@#userProfile.login_id#</p>
            <cfif IsFeatureEnabled( "websiteusers" )>
              <cfif IsLoggedIn()>
                <cfif currentUserId NEQ userProfile.id>
                  <form action="#event.buildLink(linkTo="page-types.user_profile.follow")#" method="POST">
                    <input type="hidden" name="userId" value="#userProfile.login_id#">
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
    <h4>#userProfile.display_name#'s Recipes (#recipe.recordCount#)</h4>
    <div class="recipe-list">
      <cfloop query=#recipe#>
        <li class="recipe-list">
					<h5><a href="#event.buildLink(page=id)#">#name#</a></h5>
				</li>
      </cfloop>
    </div>
    <h4>#userProfile.display_name#'s Liked Recipes (#likedRecipe.recordCount#)</h4>

    #renderViewlet(event='page-types.recipe.index')#
</cfoutput>