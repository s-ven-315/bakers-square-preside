/**
 * @presideService
 */

component {

    public any function init() {

        return this;

    }

    public function getUserProfile(
        required string target_user
    ){
        return $getPresideObject("website_user").selectData(
            selectFields = [
                "display_name"
                , "login_id"
                , "id"
            ]
            , filter = {"login_id" = arguments.target_user}
        )
    }

    public function getFollower(
        required string target_user
    ){
        return $getPresideObject("relationship").selectData(
            selectFields = ["follower"]
            , filter = "following = :following and connected = :connected"
            , filterParams = {
                "following" = arguments.target_user
                , "connected" = 1
            }
        )
    }

    public function getFollowing(
        required string target_user
    ){
        return $getPresideObject("relationship").selectData(
            selectFields = ["following"]
            , filter = "follower = :follower and connected = :connected"
            , filterParams = {
                "follower" = arguments.target_user
                , "connected" = 1
            }
        )
    }

    public function getRelationship(
        required string login_user
        , required string target_user
    ){
        return $getPresideObject("relationship").selectData(
            selectFields = ["connected"]
            , filter = "follower = :follower and following = :following"
            , filterParams = {
                "follower" = arguments.login_user
                , "following" = arguments.target_user
            }
        )
    }

    public function updateRelationship(
        required string login_user
        , required string target_user
    ){
        var relationship = getRelationship(login_user = arguments.login_user, target_user = arguments.target_user);
        if (relationship.connected EQ ""){
            // new follow
            $getPresideObject("relationship").insertData(
                data = {
                    follower = arguments.login_user
                    , following = arguments.target_user
                    , connected = 1
                }
            )
        } else {
            // not following (to refollow)
            if (relationship.connected EQ 0) {
                $getPresideObject("relationship").updateData(
                    data = {
                        connected = 1
                    }
                    , filter = "follower = :follower and following = :following"
                    , filterParams = {
                        "follower" = arguments.login_user
                        , "following" = arguments.target_user
                    }
                )
            }
            else if (relationship.connected EQ 1) {
                // already follow (to unfollow)
                $getPresideObject("relationship").updateData(
                    data = {
                        connected = 0
                    }
                    , filter = "follower = :follower and following = :following"
                    , filterParams = {
                        "follower" = arguments.login_user
                        , "following" = arguments.target_user
                    }
                )
            }
        }
    }
    
}