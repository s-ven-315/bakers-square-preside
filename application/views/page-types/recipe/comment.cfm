<cfoutput>
    <div>
        <p>Comments (#args.comment.recordCount#)</p>
        <cfif args.comment.recordCount>
              <cfloop query="#args.comment#">
                <div>
                    <span></span><a href="#event.buildLink(page="#args.comment.profile#")#">#args.comment.login_id#</a></span>
                    <span>#args.comment.comment#</span>
                </div>
              </cfloop>
        </cfif>
    </div>
    <div>
      <cfif IsFeatureEnabled( "websiteusers" )>
          <cfif IsLoggedIn()>
              <form action="#event.buildLink(linkTo="page-types.recipe.comment")#" method="POST">
                <input type="hidden" name="recipe" value="#args.recipeDetail.id#">
                <input type="hidden" name="pageId" value="#event.getCurrentPageId()#">
                <input type="text" name="comment" placeholder="Leave a comment">
                <button type="submit" class="btn btn-primary">Submit</button>
              </form>
          </cfif>
        </cfif>
  </div>
</cfoutput>