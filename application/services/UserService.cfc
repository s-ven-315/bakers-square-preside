/**
 * @presideService
 */

component {

	public any function init() {

		return this;

	}

	public function getUserProfile(
		required string targetUserId
	){
		return $getPresideObject( "website_user" ).selectData( id = arguments.targetUserId )
	}
	
	// get user Id using login_id for routing handler
	public function getUserId( required string userLoginId ){
		return $getPresideObject( "website_user" ).selectData(
			  selectFields = [ "id" ]
			, filter = { login_id = arguments.userLoginId }
		)
	}

	public function getFollower(
		required string targetUserId
	){
		return $getPresideObject( "follower_relationship" ).selectData(
			  selectFields = [
				  'follower.login_id'
				, 'follower.id'
			  ]
			, filter = {
				  following = arguments.targetUserId
				, connected = true
			  }
		)
	}

	public function getFollowing(
		required string targetUserId
	){
		return $getPresideObject( "follower_relationship" ).selectData(
			  selectFields = [
				  'following.login_id'
				, 'following.id'
			  ]
			, filter = {
				  follower  = arguments.targetUserId
				, connected = true
			  }
		)
	}

	public function getRelationship(
		  required string currentUserId
		, required string targetUserId
	){
		return $getPresideObject( "follower_relationship" ).selectData(
			filter = {
				  follower  = arguments.currentUserId
				, following = arguments.targetUserId
			}
		)
	}

	public function updateRelationship(
		  required string currentUserId
		, required string targetUserId
	){
		var relationship = getRelationship( currentUserId = arguments.currentUserId, targetUserId = arguments.targetUserId );
		if (relationship.connected EQ ""){
			// new follow
			$getPresideObject( "follower_relationship" ).insertData(
				data = {
					  follower 	= arguments.currentUserId
					, following = arguments.targetUserId
					, connected = true
				}
			)
		} else {
			// not following (to refollow)
			if (relationship.connected EQ false) {
				$getPresideObject( "follower_relationship" ).updateData(
					  data = { connected = true }
					, filter = "follower = :follower and following = :following"
					, filterParams = {
						  "follower"    = arguments.currentUserId
						, "following"   = arguments.targetUserId
					  }
				)
			}
			else if (relationship.connected EQ true) {
				// already follow (to unfollow)
				$getPresideObject( "follower_relationship" ).updateData(
					  data = { connected = false }
					, filter = "follower = :follower and following = :following"
					, filterParams = {
						  "follower"    = arguments.currentUserId
						, "following"   = arguments.targetUserId
					  }
				)
			}
		}
	}
	
}