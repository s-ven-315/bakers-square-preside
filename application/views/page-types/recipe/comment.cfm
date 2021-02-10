<cfoutput>
    <div>
        <cfif IsFeatureEnabled( "websiteusers" )>
            <cfif IsLoggedIn()>
                <form action="#event.buildLink(linkTo="page-types.recipe.comment")#" method="POST">
                  <input type="hidden" name="recipe" value="#args.recipeDetail.id#">
                  <input type="hidden" name="pageId" value="#event.getCurrentPageId()#">
                  <input type="text" name="comment">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </cfif>
          </cfif>
    </div>
    <div>
        <p>#args.comment.recordCount# Comments</p>
        <cfif args.comment.recordCount>
            <ul class="liked-list">
              <cfloop query="#args.comment#">
                <li class="liked-user">
                <p><a href="#event.buildLink(page="#args.comment.user#")#">#args.comment.login_id#</a></p>
                <p>#args.comment.comment#</p>
                </li>
              </cfloop>
            </ul>
          </cfif>
    </div>
</cfoutput>