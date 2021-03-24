/**
 * @presideService
 */

 component {
 	// CONSTRUCTOR
	/**
	 * @elasticSearchEngine.inject     ElasticSearchEngine
	 * @elasticSearchApiWrapper.inject ElasticSearchApiWrapper
	 */

	public any function init(
		  required any elasticSearchEngine
		, required any elasticSearchApiWrapper
	) {
		_setElasticSearchEngine( arguments.elasticSearchEngine     );
		_setElasticSearchApi(    arguments.elasticSearchApiWrapper );

		return this;
	}

	// Public methos
	public query function getUser(
		  string  q                = ""
	) {
		var selectFields = [
			  "id"
			, "login_id"
			, "email_address"
			, "display_name"
		];
		
		var filter       = "1=1";
		var filterParams = {};
		if( len( trim( arguments.q ) ) ) {
			filter         &= " AND ( website_user.display_name like :q OR website_user.login_id like :q )";
			filterParams.q = { value="%#arguments.q#%", type="varchar" };
		}

		return $getPresideObject( "website_user" ).selectData(
			  selectFields = selectFields
			, filter       = filter
			, filterParams = filterParams
		);
		
	}

	public query function getRecipe(
		  string  q                = ""
	) {
		var selectFields = [
			  "id"
			, "name"
			, "owner.id as ownerId"
			, "owner.display_name as display_name"
			, "serving"
			, "cooking_time"
			, "prepare_time"
		];

		var filter       = "1=1";
		var filterParams = {};
		if( len( trim( arguments.q ) ) ) {
			filter         &= " AND ( recipe.name like :q )";
			filterParams.q = { value="%#arguments.q#%", type="varchar" };
		}

		return $getPresideObject( "recipe" ).selectData(
			  selectFields = selectFields
			, filter       = filter
			, filterParams = filterParams
		);
		
	}

	// GETTERS AND SETTERS
	private any function _getElasticSearchEngine() {
		return _elasticSearchEngine;
	}
	private void function _setElasticSearchEngine( required any elasticSearchEngine ) {
		_elasticSearchEngine = arguments.elasticSearchEngine;
	}

	private any function _getElasticSearchApi() {
		return _elasticSearchApi;
	}
	private void function _setElasticSearchApi( required any elasticSearchApiWrapper ) {
		_elasticSearchApi = arguments.elasticSearchApiWrapper;
	}
 }