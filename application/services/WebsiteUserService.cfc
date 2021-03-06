/**
 * @presideService
 * @singleton
 */

component {
	public any function init() {
		return this;
	}

	public string function saveUser(
		  required string username
		, required string email
	) {
		var newId = $getPresideObject( 'website_user' ).insertData(
			data = {
				  login_id 		= arguments.username
				, email_address = arguments.email
				, display_name 	= arguments.username
			}
		);
		var userData = $getPresideObject( 'website_user' ).selectData( id=newId )

		return newId;
	}

	public boolean function isExistingUser(
		  string email = ""
		, string username = ""
	){
		var filter = {}
		
		if ( !len( arguments.email & arguments.username ) ) return false;
		if ( len( arguments.email ) ) filter.email_address = arguments.email;
		if ( len( arguments.username ) ) filter.login_id = arguments.username;

		return $getPresideObject( 'website_user' ).dataExists( filter = filter );
	}

	public function updateUserDetail(
		  required string display_name
		, required string id
	){
		return $getPresideObject( 'website_user' ).updateData(
			  data = { display_name = arguments.display_name }
			, id = arguments.id
		)
	}
}