<cfoutput>
    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="##deleteRecipeModal">
        Delete Recipe
    </button>
    <div class="modal fade" id="deleteRecipeModal" tabindex="-1" role="dialog" aria-labelledby="deleteRecipeModalLabel" aria-hidden="true">
        <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteRecipeModalLabel">Delete Recipe</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="delete-recipe-form" action="#event.buildLink(linkTo="page-types.recipe_page.delete")#" method = "POST">
					<div class="modal-body">
						<p>Are you sure you want to delete this <strong style="text-transform:uppercase">#args.recipeDetail.name#</strong> recipe?</p>
						<div class="form-group">
							<input type="hidden" name="recipeId" value="#args.recipeDetail.id#">
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-danger" type="submit">Confirm</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					</div>
				</form>
			</div>
        </div>
    </div>
</cfoutput>