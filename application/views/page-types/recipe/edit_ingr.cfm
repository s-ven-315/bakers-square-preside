<cfscript>
    event.include("js-modalEdit");
    var ingr = args.recipeDetail.ingredients;
</cfscript>
<cfset cfIngr=#ingr#>
<cfoutput>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##editIngrModal">
        Edit Ingredients
    </button>
    <div class="modal fade" id="editIngrModal" tabindex="-1" role="dialog" aria-labelledby="editIngrModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="editIngrModalLabel">Recipe Ingredients</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <div class="ingr-list">
                    <ul class="ingr-list-ul list-group">
                        <cfloop list="#ingr#" item="ingrItem" index="idx">
                            <div style="display:flex">
                                <button class="delete-listitem">Delete</button>
                                <li key="#idx#" class="list-group-item">#ingrItem# </li>
                            </div>
                        </cfloop>
                    </ul>
                </div>
            </div>
            <form id="edit-ingr-form" action="#event.buildLink(linkTo="page-types.recipe.ingr")#" method="POST">
                <div class="modal-body">
                        <div class="form-group">
                          <input type="hidden" value=#event.getCurrentPageId()# name="id">
                          <input type="hidden" name="ingr" class="ingr-submit">
                          <input class="ingr-input" type="text" placeholder="Add Ingredient">
                          <button type="button" class="btn btn-primary add-more-ingr">Add</button>
                        </div>
                    </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button type="button" class="btn btn-secondary reset-btn-ingr" data-dismiss="modal">Cancel</button>
                </div>
            </form>
          </div>
        </div>
    </div>
    <script type="text/javascript" language="JavaScript">
        var #ToScript(cfIngr, "jsIngr")#;
        let addBtnIngr = document.querySelector('.add-more-ingr');
        var str = jsIngr;
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
            str += ',' + input;
            let submitThis = document.querySelector('.ingr-submit').value = str;
        })

        let resetBtnIngr = document.querySelector('.reset-btn-ingr');
        resetBtnIngr.addEventListener('click', function(){
            window.location.reload()
        })
    </script>
</cfoutput>
<cfscript>
    event.include("js-addMore");
</cfscript>
