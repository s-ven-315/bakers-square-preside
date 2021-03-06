<cfoutput>
	<button type="button" class="btn btn-primary edit-recipe-btn" data-toggle="modal" data-target="##editDetailModal">
		Edit
	</button>
	<div class="modal fade edit-recipe-form" id="editDetailModal" tabindex="-1" role="dialog" aria-labelledby="editDetailModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editDetailModalLabel">Edit Recipe</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="#event.buildLink( linkTo = "page-types.recipe_page.editDetail" )#" method = "POST">
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" name="ownerId" value="#args.recipeDetail.owner#">
							<input type="hidden" value=#args.recipeDetail.id# name="id">
							<div>
								<label for="serving">Serving</label>
								<input name="serving" type="number" value="#args.recipeDetail.serving#">
							</div>
							<div>
								<label for="prepareTime">Preparation Time</label>
								<input name="prepareTime" type="number" value="#args.recipeDetail.prepare_time#">
							</div>
							<div>
								<label for="cookTime">Cooking Time</label>
								<input name="cookTime" type="number" value="#args.recipeDetail.cooking_time#">
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