<cfscript>
	event.include("css-recipe");
	recipeDetail = args.recipeDetail ?: QueryNew("");
	currentUserId = args.currentUserId;
	likedUser = args.getLikedUser?: QUeryNew("")
	likedRelationship = args.likedRelationship ?: QueryNew("");
	comment = args.comment ?: QueryNew("");
	var steps = listToArray(recipeDetail.steps, ";")
	var ingr= listToArray(recipeDetail.ingredients, ";")
</cfscript>

<cfoutput>
	<div class="recipe-container">
		<div class="recipe-owner-detail">
			<h2>#recipeDetail.name#</h2>
			<button class="recipe-owner-link">
				<a href="#event.buildLink(userId = recipeDetail.owner)#">
					By #recipeDetail.login_id#
				</a>
			</button>
			<cfif event.isOwner( recipe_id = recipeDetail.id, current_user = currentUserId )>
				#renderView( view = 'page-types/recipe_page/_editRecipeName', args = args )#
			</cfif>
		</div>
		<div class="recipe-basic-detail">
			<p>#recipeDetail.serving# Servings</p>
			<p>Preparation Time: #recipeDetail.prepare_time# Minutes</p>
			<p>Cooking Time: #recipeDetail.cooking_time# Minutes</p>
		</div>
		<div class="recipe-action">
			<button class="recipe-session-btn">
				<a href="#event.buildLink( page = "session", queryString="recipeId=#recipeDetail.id#" )#">
					Start Baking
				</a>
			</button>
			<cfif IsFeatureEnabled( "websiteusers" )>
				<cfif IsLoggedIn()>
					<form action="#event.buildLink( linkTo = "page-types.recipe_page.like" )#" method="POST">
						<input type="hidden" name="ownerId" value="#recipeDetail.owner#">
						<input type="hidden" name="recipeId" value="#recipeDetail.id#">
						<button class="recipe-like-btn">
							<cfif args.likedRelationship.recordCount EQ 0 || args.likedRelationship.liked EQ 0>
								Like
							<cfelse>
								Liked
							</cfif>
						</button>
					</form>
				</cfif>
			</cfif>
			<cfif event.isOwner( recipe_id = recipeDetail.id, current_user = currentUserId )>
				#renderView( view = 'page-types/recipe_page/_editDetail', args = args)#
				#renderView( view = 'page-types/recipe_page/_delete', args = args)#
			</cfif>
		</div>
	</div>
	<div class="recipe-detail-container">
		<div class="recipe-step-ingr-container">
			<h3>Steps & Ingredients</h3>
			<div class="recipe-step-detail">
				<p>Recipe Steps:</p>
				<ol>
					<cfloop index="item" array=#steps#>
						<div>
							<li>#item#</li>
						</div>
					</cfloop>
				</ol>
				<cfif event.isOwner( recipe_id = recipeDetail.id, current_user = currentUserId )>
					#renderView( view = 'page-types/recipe_page/_editSteps', args = args)#
				</cfif>
			</div>
			<div class="recipe-ingredient-detail">
				<p>Recipe Ingredients:</p>
				<ul>
					<cfloop index="item" array=#ingr#>
						<div>
							<li>#item#</li>
						</div>
					</cfloop>
				</ul>
				<cfif event.isOwner( recipe_id = recipeDetail.id, current_user = currentUserId )>
					#renderView( view = 'page-types/recipe_page/_editIngredients', args = args)#
				</cfif>
			</div>
		</div>
		<div class="recipe-like-comment-container">
			<h3>Likes & Comments</h3>
			#renderView( view = 'page-types/recipe_page/_likedUser', args = args)#
			#renderView( view = 'page-types/recipe_page/_comment', args = args)#
		</div>
	</div>

</cfoutput>