<cfoutput>
    <div>
        <cfif IsFeatureEnabled( "websiteusers" )>
            <cfif IsLoggedIn()>
                <form action="#event.buildLink(linkTo="page-types.recipe.like")#" method="POST">
                  <input type="hidden" name="recipeId" value="#args.recipeDetail.id#">
                  <input type="hidden" name="pageId" value="#event.getCurrentPageId()#">
                  <button>
                    <cfif args.liked.recordCount EQ 0 || args.liked.liked EQ 0>
                      Like
                    <cfelse>
                      Unlike
                    </cfif>
                  </button>
                </form>
            </cfif>
          </cfif>
    </div>
    <div>
        <p>#args.likedUser.recordCount# Likes</p>
        <cfif args.likedUser.recordCount>
            <ul class="liked-list">
              <cfloop query="#args.liked#">
                <li class="liked-user">
                <p><a href="#event.buildLink(page="#args.likedUser.profile#")#">#args.likedUser.login_id#</a></p>
                </li>
              </cfloop>
            </ul>
          </cfif>
    </div>
</cfoutput>