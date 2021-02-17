<cfoutput>
    <button type="button" class="btn btn-primary edit-recipe-btn" data-toggle="modal" data-target="##editRecipeNameModal">
        Edit Recipe Name
    </button>
    <div class="modal fade edit-recipe-form" id="editRecipeNameModal" tabindex="-1" role="dialog" aria-labelledby="editRecipeNameModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="editRecipeNameModalLabel">Edit Recipe</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="#event.buildLink(linkTo="page-types.recipe.editName")#" method="POST">
                <div class="modal-body">
                        <div class="form-group">
                          <input type="hidden" value=#event.getCurrentPageId()# name="id">
                          <div>
                            <label for="recipeName">Recipe Name</label>
                            <input name="recipeName" type="text" value="#args.recipeDetail.title#">
                          </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </form>
          </div>
        </div>
    </div>
</cfoutput>