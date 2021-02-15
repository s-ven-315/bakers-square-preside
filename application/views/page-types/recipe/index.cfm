<cfscript>
    event.include("css-recipe");
    recipeDetail = args.recipeDetail ?: QueryNew("");
    currentUserId = args.currentUserId;
    likedUser = args.getLikedUser?: QUeryNew("")
    liked = args.liked ?: QueryNew("");
    comment = args.comment ?: QueryNew("");
    var steps = []
    for (item in listToArray(recipeDetail.steps, ";")) { 
        steps.append(item)
    } 
    var ingr=[]
    for (item in listToArray(recipeDetail.ingredients, ";")) { 
        ingr.append(item)
    } 
</cfscript>
<cfoutput>
    
    <div class="recipe-container">
        <div class="recipe-owner-detail">
            <h2>#recipeDetail.title#</h2>
            <button class="recipe-owner-link"><a href="#event.buildLink(page="#recipeDetail.owner_profile#")#">By #recipeDetail.owner_name# @#recipeDetail.owner_username#</a></button>
            <cfif event.isOwner(recipe_id = recipeDetail.id, current_user = currentUserId)>
                #renderView(view = 'page-types/recipe/edit_name', args=args)#
            </cfif>
        </div>
        <div class="recipe-basic-detail">
            <p>#recipeDetail.serving# Servings</p>
            <p>Preparation Time: #recipeDetail.prepare_time# Minutes</p>
            <p>Cooking Time: #recipeDetail.cooking_time# Minutes</p>
        </div>
        <div class="recipe-action">
            <button class="recipe-session-btn">
                <a href="#event.buildLink(page="session", queryString="recipeId=#args.recipeDetail.id#")#">
                    Start Baking
                </a>
            </button>
            <cfif IsFeatureEnabled( "websiteusers" )>
                <cfif IsLoggedIn()>
                    <form action="#event.buildLink(linkTo="page-types.recipe.like")#" method="POST">
                        <input type="hidden" name="recipeId" value="#args.recipeDetail.id#">
                        <input type="hidden" name="pageId" value="#event.getCurrentPageId()#">
                        <button class="recipe-like-btn">
                            <cfif args.liked.recordCount EQ 0 || args.liked.liked EQ 0>
                                Like
                            <cfelse>
                                Liked
                            </cfif>
                        </button>
                    </form>
                </cfif>
            </cfif>
            <cfif event.isOwner(recipe_id = recipeDetail.id, current_user = currentUserId)>
                #renderView(view = 'page-types/recipe/edit_detail', args=args)#
                #renderView(view = 'page-types/recipe/delete', args=args)#
            </cfif>
        </div>
    </div>
    <div class="recipe-detail-container">
        <div class="recipe-step-ingr-container">
            <h3>Steps & Ingredients</h3>
            <div class="recipe-step-detail">
                <p>Recipe Steps:</p>
                <ol>
                    <cfloop index="i" from="1" to="#arrayLen(steps)#">
                        <div>
                            <li>#steps[i]#</li>
                        </div>
                    </cfloop>
                </ol>
                <cfif event.isOwner(recipe_id = recipeDetail.id, current_user = currentUserId)>
                        #renderView(view = 'page-types/recipe/edit_step', args=args)#
                </cfif>
            </div>
            <div class="recipe-ingredient-detail">
                <p>Recipe Ingredients:</p>
                <ul>
                    <cfloop index="i" from="1" to="#arrayLen(ingr)#">
                        <div>
                            <li>#ingr[i]#</li>
                        </div>
                    </cfloop>
                </ul>
                <cfif event.isOwner(recipe_id = recipeDetail.id, current_user = currentUserId)>
                        #renderView(view = 'page-types/recipe/edit_ingr', args=args)#
                </cfif>
            </div>
        </div>
        <div class="recipe-like-comment-container">
            <h3>Likes & Comments</h3>
            #renderView(view='page-types/recipe/like', args=args)#
            #renderView(view='page-types/recipe/comment', args=args)#
        </div>
    </div>
   
</cfoutput>
