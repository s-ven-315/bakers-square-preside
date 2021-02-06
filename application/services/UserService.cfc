/**
 * @presideService
 */

component {

    public any function init() {

        return this;

    }

    public function getUserProfile(
        required string display_name
    ){
        return $getPresideObject("website_user").selectData(
            selectFields = [
                "website_user.display_name"
                , "website_user.login_id"
                , "website_user.id"
            ]
            , filter = {"website_user.display_name" = arguments.display_name}
        )
    }
}