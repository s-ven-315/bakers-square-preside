<cfscript>
    recipeDetail = args.recipeDetail ?: QueryNew("")
</cfscript>
<cfoutput>
    <h2>#recipeDetail.title#</h2>
    #renderView(view = 'page-types/recipe/edit_detail')#
    <div class="recipe-owner-detail">
        <button><a href="#event.buildLink(page="#recipeDetail.owner_profile#")#">By #recipeDetail.owner_name# @#recipeDetail.owner_username#</a></button>
    </div>
    <div class="recipe-basic-detail">
        <p>#recipeDetail.serving# Servings</p>
        <p>Preparation Time: #recipeDetail.prepare_time# Minutes</p>
        <p>Cooking Time: #recipeDetail.cooking_time# Minutes</p>
    </div>
</cfoutput>