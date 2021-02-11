<cfscript>
    event.include("css-recipe");
    recipeDetail = args.recipeDetail ?: QueryNew("");
    likedUser = args.getLikedUser?: QUeryNew("")
    liked = args.liked ?: QueryNew("");
    comment = args.comment ?: QueryNew("");
</cfscript>
<cfoutput>
    <cfif IsFeatureEnabled( "websiteusers" )>
        <cfif IsLoggedIn()>
            #renderView(view = 'page-types/recipe/edit_step', args=args)#
            #renderView(view = 'page-types/recipe/edit_ingr', args=args)#
        </cfif>
    </cfif>
    <div class="recipe-container">
        <div class="recipe-owner-detail">
            <h2>#recipeDetail.title#</h2>
            <button class="recipe-owner-link"><a href="#event.buildLink(page="#recipeDetail.owner_profile#")#">By #recipeDetail.owner_name# @#recipeDetail.owner_username#</a></button>
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
                #renderView(view = 'page-types/recipe/edit_detail', args=args)#
                #renderView(view = 'page-types/recipe/delete', args=args)#
            </cfif>
        </cfif>
        </div>
    </div>
        <div class="recipe-step-detail">
            <p>Recipe Steps:</p>
            <ol>
                <cfloop list="#recipeDetail.steps#" item="stepsitem" index="idx">
                    <div style="display:flex">
                        <li key="#idx#">#stepsitem#</li>
                    </div>
            </cfloop>
        </ol>
    </div>
    <div class="recipe-ingredient-detail">
        <p>Recipe Ingredients:</p>
        <ul>
            <cfloop list="#recipeDetail.ingredients#" item="ingredient" index="idx">
                <div style="display:flex">
                    <li key="#idx#">#ingredient#</li>
                </div>
            </cfloop>
        </ul>
    </div>
    #renderView(view='page-types/recipe/like', args=args)#
    #renderView(view='page-types/recipe/comment', args=args)#
   
</cfoutput>