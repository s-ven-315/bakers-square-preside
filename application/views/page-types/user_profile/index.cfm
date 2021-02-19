<cfscript>
    event.include("css-userProfile");
    userProfile = args.userProfile ?: QueryNew("");
    currentUserId = args.currentUserId;
    relationship = args.connected ?: QueryNew("");
    recipe = args.recipe ?: QueryNew("");
    likedRecipe = args.likedRecipe ?: QueryNew("");
</cfscript>

<cfoutput>
    
    <div class="profile-page-container">

    <cfif userProfile.recordCount>
      <div class="profile-container">

        <div class="user-profile">
            <h3>#userProfile.display_name#</h3>
            <p>@#userProfile.login_id#</p>
        </div>
        <div class="follow-container">
          #renderView(view = 'page-types/user_profile/_followerRelationship', args=args)#
        </div>
        <cfif IsFeatureEnabled( "websiteusers" )>
          <cfif IsLoggedIn()>
            <cfif currentUserId NEQ userProfile.id>
              <form action="#event.buildLink(linkTo="page-types.user_profile.follow")#" method="POST">
                <input type="hidden" name="targetUserId" value="#userProfile.id#">
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
        <cfif currentUserId EQ userProfile.id>
          #renderView(view = 'page-types/user_profile/_editProfile')#
        </cfif>
      </div>
    </cfif>
    <div class="user-recipe-outer-container">
      <cfif currentUserId EQ userProfile.id>
        #renderView(view = 'page-types/user_profile/_newRecipe')#
      </cfif>
      <div class="user-recipe-inner-container">
        <div class="user-recipe">
          <h4>#userProfile.display_name#'s Recipes (#recipe.recordCount#)</h4>
          <div class="user-recipe-list">
            <cfloop query=#recipe#>
              <li class="user-recipe-list">
                <h5><a href="#event.buildLink(recipeId = id, userId = owner)#">#name#</a></h5>
              </li>
            </cfloop>
          </div>
        </div>
        <div class="user-liked-recipe">
          <h4>#userProfile.display_name#'s Liked Recipes (#likedRecipe.recordCount#)</h4>
          <div class="user-recipe-list">
            <cfloop query=#likedRecipe#>
              <li class="user-recipe-list">
                <h5><a href="#event.buildLink(recipeId = id, userId = owner)#">#name#</a></h5>
              </li>
            </cfloop>
          </div>
        </div>
      </div>
    </div>
</div>

</cfoutput>