<cfoutput>
    <button type="button" class="btn btn-primary new-recipe" data-toggle="modal" data-target="##createRecipeModal">
        Add New Recipe
      </button>
      <div class="modal fade new-recipe-form" id="createRecipeModal" tabindex="-1" role="dialog" aria-labelledby="createRecipeModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="createRecipeModalLabel">Create New Recipe</h5>
              </div>
              <form action="#event.buildLink(linkTo="page-types.recipe_page.create")#" method="POST">
                  <div class="modal-body">
                    <div class="form-group">
                      <div>
                        <label for="recipeName">Recipe Name</label>
                        <input name="recipeName" type="text" >
                      </div>
                      <div>
                        <label for="serving">Serving</label>
                        <input name="serving" type="number" >
                      </div>
                      <div>
                        <label for="prepareTime">Preparation Time</label>
                        <input name="prepareTime" type="number" >
                      </div>
                      <div>
                        <label for="cookTime">Cooking Time</label>
                        <input name="cookTime" type="number" >
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                      <button type="submit" class="btn btn-primary">Create</button>
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                  </div>
              </form>
            </div>
          </div>
        </div>
</cfoutput>