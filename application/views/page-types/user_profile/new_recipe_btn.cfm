<cfoutput>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##createRecipeModal">
        Add New Recipe
      </button>
      <div class="modal fade" id="createRecipeModal" tabindex="-1" role="dialog" aria-labelledby="createRecipeModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="createRecipeModalLabel">Create New Recipe</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <form action="#event.buildLink(linkTo="page-types.user_profile.edit")#" method="POST">
                  <div class="modal-body">
                          <div class="form-group">
                              <input name="recipeName" type="text" placeholder="Recipe Name">
                              <input name="serving" type="number" placeholder="Serving">
                              <input name="prepareTime" type="number" placeholder="Preparation Time">
                              <input name="cookTime" type="number" placeholder="Cooking Time">
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