/**
 * Sticker bundle configuration file. See: http://sticker.readthedocs.org/
 */
component {

	public void function configure( bundle ) {

		bundle.addAssets(
			  directory   = "/"
			, match       = function( filepath ){ return ReFindNoCase( "\.(js|css)$", filepath ); }
			, idGenerator = function( filepath ){
				var fileName = ListLast( filePath, "/" );
				var id       = ListLast( filename, "." ) & "-" & ReReplace( filename, "\.(js|css)$", "" );
				return id;
			  }
		);

		bundle.asset( "css-bootstrap" ).before( "*" );
		bundle.asset( "js-bootstrap" ).dependsOn( "js-jquery" );
		bundle.addAsset( id="js-modalEdit", path="/js/specific/recipe/modalEdit.js");
		bundle.addAsset( id="css-userProfile", path="/css/page-types/userProfile.css");
		bundle.addAsset( id="css-recipe", path="/css/page-types/recipe.css");
		bundle.addAsset( id="css-session", path="/css/page-types/session.css");
	}

}