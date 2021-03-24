<cfscript>
	queryString = rc.q ?: "";
</cfscript>

<cfoutput>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<form action="#event.buildLink( page="search" )#" method="get" class="filter-form" >

					<div class="filter-form">
						<div class="form-group text-center mod-button-style">
							<div class="form-field two-columns">
								<div class="radio mod-button">
									<input type="radio" id="category-recipe" name="category" value="recipe" data-toggle="finder">
									<label for="category-recipe" class="u-text-transform-none">Recipe</label>
								</div>
								<div class="radio mod-button">
									<input type="radio" id="category-user" name="category" value="user" data-toggle="finder">
									<label for="category-user" class="u-text-transform-none" >User</label>
								</div>
							</div>
						</div>
					</div>
					<input type="text" name="q" class="form-control" placeholder="Search here" value="#queryString#" />
					<button type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
</cfoutput>