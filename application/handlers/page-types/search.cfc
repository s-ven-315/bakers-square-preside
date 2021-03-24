component {

	property name="searchService"       inject="SearchService";
	property name="websiteLoginService" inject="websiteLoginService";
	property name="recipeService"       inject="RecipeService";

	private function index( event, rc, prc, args = {} ) {
		args.category       = rc.category ?: "";


		args.searchResults  = _getSearchResult( argumentCollection=arguments ) ?: queryNew("");


		return renderView(
			  view          = 'page-types/search/index'
			, presideObject = 'search'
			, id            = event.getCurrentPageId()
			, args          = args
		)
	}

	// public string function resultSection( event, rc, prc, args={} ) {

	// 	prc.searchResults  = _getSearchResult( argumentCollection = arguments );
	// 	var pageData       = presideObjectService.selectData(
	// 			objectName   = "supplier_directory"
	// 		, selectFields = [ "show_service_filter", "show_product_filter" ]
	// 	);

	// 	args.show_service_filter       = pageData.show_service_filter       ?: true;
	// 	args.show_product_filter       = pageData.show_product_filter       ?: true;

	// 	return renderView(
	// 			view     = "/page-types/search/_resultSection"
	// 		, noLayout = true
	// 		, args     = args
	// 	);
	// }
	
	private query function _getSearchResult( event, rc, prc, args={} ) {
		var maxRows  = rc.maxRows ?: "";
		var pageSize = isNumeric( maxRows )       && maxRows <= 999999 ? maxRows : 20;
		var page     = isNumeric( rc.page ?: "" ) && rc.page <= 999999 ? rc.page : 1;
		var q        = rc.q       ?: "";
		var category = args.category        ?: "";
		var searchResults = queryNew("");

		if (category == "user") {
			searchResults = searchService.getUser(
				q = q
			)	
		}

		if (category == "recipe") {
			searchResults = searchService.getRecipe(
				q = q
			)	
		}

		return searchResults;
	}
}