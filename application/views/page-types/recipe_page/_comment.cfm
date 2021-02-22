<cfoutput>
	<div>
		<p>Comments ( #args.comment.recordCount# )</p>
		<cfif args.comment.recordCount>
			<cfloop query="#args.comment#">
				<div>
					<span><a href="#event.buildLink( userId = id )#">#login_id#</a></span>
					<span>#comment#</span>
				</div>
			</cfloop>
		</cfif>
	</div>
	<div>
		<cfif IsFeatureEnabled( "websiteusers" )>
			<cfif IsLoggedIn()>
				<form action="#event.buildLink( linkTo = "page-types.recipe_page.comment" )#" method="POST">
					<input type="hidden" name="ownerId" value="#args.recipeDetail.owner#">
					<input type="hidden" name="recipeId" value="#args.recipeDetail.id#">
					<input type="text" name="comment" placeholder="Leave a comment">
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</cfif>
		</cfif>
	</div>
</cfoutput>