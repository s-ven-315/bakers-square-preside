/**
 * @presideService
 */

component {

    public any function init() {

        return this;

    }
    public function getDetail(
        required string id
    ){
        return $getPresideObject('recipe').selectData(
            selectFields = [
                'page.title'
                , 'serving'
                , 'prepare_time'
                , 'cooking_time'
                , 'owner.id as owner_id'
                , 'owner.user_profile as owner_profile'
                , 'owner.display_name as owner_name'
                , 'owner.login_id as owner_username'
            ]
            , filter = {id = arguments.id}
        )
    }
    public function updateDetail(
        required string owner
        , required serving
        , required prepare_time
        , required cooking_time
        , required string id
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                owner = arguments.owner
                , serving = arguments.serving
                , prepare_time = arguments.prepare_time
                , cooking_time = arguments.cooking_time
            }
            , filter = { id = arguments.id }
        )
    }
}