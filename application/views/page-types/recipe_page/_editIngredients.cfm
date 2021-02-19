<cfscript>
    var ingr = listToArray(args.recipeDetail.ingredients, ";")
</cfscript>
<cfset cfIngr=#args.recipeDetail.ingredients?:""#>
<cfoutput>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##editIngrModal">
        Edit Ingredients
    </button>
    <div class="modal fade" id="editIngrModal" tabindex="-1" role="dialog" aria-labelledby="editIngrModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="editIngrModalLabel">Recipe Ingredients</h5>
            </div>
            <div class="modal-body">
                <div class="ingr-list">
                    <ul class="ingr-list-ul list-group">
                        <cfloop index="i" from="1" to="#arrayLen(ingr)#">
                            <div>
                                <button class="delete-listitem">Delete</button>
                                <li class="list-group-item">#ingr[i]# </li>
                            </div>
                        </cfloop>
                    </ul>
                </div>
            </div>
            <form id="edit-ingr-form" action="#event.buildLink(linkTo="page-types.recipe_page.updateIngredients")#" method="POST">
                <div class="modal-body">
                        <div class="form-group">
                          <input type="hidden" name="ownerId" value="#args.recipeDetail.owner#">
                          <input type="hidden" value=#args.recipeDetail.id# name="recipeId">
                          <input type="hidden" name="ingredients" class="ingr-submit">
                          <input class="ingr-input" type="text" placeholder="Add Ingredient">
                          <button type="button" class="btn btn-primary add-more-ingr">Add</button>
                        </div>
                    </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary submit-btn-ingr">Save</button>
                    <button type="button" class="btn btn-secondary reset-btn-ingr" data-dismiss="modal">Cancel</button>
                </div>
            </form>
          </div>
        </div>
    </div>
    <script type="text/javascript" language="JavaScript">
        var #ToScript(cfIngr, "jsIngr")#;
        let addBtnIngr = document.querySelector('.add-more-ingr');
        var inputStr = jsIngr;
        addBtnIngr.addEventListener('click', function(){
            let input = document.querySelector('.ingr-input').value;
            let ingrUL = document.querySelector(".ingr-list-ul");
            let div = document.createElement("div")
            ingrUL.appendChild(div)
            let btn = document.createElement("button")
            btn.innerHTML = "Delete";
            btn.className="delete-listitem"
            div.appendChild(btn);
            let node = document.createElement("li");
            node.className="list-group-item";
            node.innerHTML = input;
            div.appendChild(node);
            document.querySelector('.ingr-input').value = "" ;
            inputStr += ';' + input;
            let submitThis = document.querySelector('.ingr-submit').value = inputStr;
        })

        let resetBtnIngr = document.querySelector('.reset-btn-ingr');
        resetBtnIngr.addEventListener('click', function(){
            window.location.reload()
        })

        let submitBtnIngr = document.querySelector('.submit-btn-ingr');
        submitBtnIngr.addEventListener('click', function(){
            document.querySelector('.ingr-submit').value = inputStr
        })
    </script>
</cfoutput>
<cfscript>
    event.include("js-modalEdit");
</cfscript>
