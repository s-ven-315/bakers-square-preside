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
    <div class="recipe-step-detail">
        <p>Recipe Steps:</p>
        <ol>
            <cfloop list="#recipeDetail.steps#" item="stepsitem" index="idx">
                <div style="display:flex">
                    <li key="#idx#">#stepsitem#</li>
                </div>
            </cfloop>
        </ol>
        #renderView(view='page-types/recipe/edit_step', args=args)#
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
        #renderView(view='page-types/recipe/edit_ingr', args=args)#
    </div>
</cfoutput>