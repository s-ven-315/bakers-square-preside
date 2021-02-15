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
                , "id"
                , 'serving'
                , 'prepare_time'
                , 'cooking_time'
                , 'owner.id as owner_id'
                , 'owner.user_profile as owner_profile'
                , 'owner.display_name as owner_name'
                , 'owner.login_id as owner_username'
                , 'steps'
                , 'ingredients'
            ]
            , filter = {id = arguments.id}
        )
    }
    public function getDetailByOwner(
        required string owner_id
    ){
        return $getPresideObject('recipe').selectData(
            selectFields = [
                'page.title'
                , 'id'
                , 'serving'
                , 'prepare_time'
                , 'cooking_time'
                , 'name'
                , 'owner.id as owner_id'
                , 'owner.user_profile as owner_profile'
                , 'owner.display_name as owner_name'
                , 'owner.login_id as owner_username'
                , 'steps'
                , 'ingredients'
            ]
            , filter = {owner = arguments.owner_id}
        )
    }

    public function createRecipe(
        required string owner
        , required string name
        , required serving
        , required prepare_time
        , required cooking_time
        , required string id
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                name = arguments.name
                , owner = arguments.owner
                , serving = arguments.serving
                , prepare_time = arguments.prepare_time
                , cooking_time = arguments.cooking_time
            }
            , filter = { id = arguments.id }
        )
    }
    public function updateName(
        required string name
        , required string id
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                name = arguments.name
            }
            , filter = {id = arguments.id}
        )
    }
    public function updateDetail(
        required serving
        , required prepare_time
        , required cooking_time
        , required string id
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                serving = arguments.serving
                , prepare_time = arguments.prepare_time
                , cooking_time = arguments.cooking_time
            }
            , filter = {id = arguments.id}
        )
    }

    // check is the recipe exist, one user cannot have 2 recipes with same name
    public function isExisting(
        required string user_id
        , required string name
    ){
        var filter = {
            owner = arguments.user_id
            , name = arguments.name
        }
        return $getPresideObject('recipe').dataExists(filter=filter);
    }

    // update steps
    public function updateSteps(
        required string id
        , required steps
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                steps = arguments.steps
            }
            , filter = { id = arguments.id}
        )
    }
    // update ingredients
    public function updateIngr(
        required string id
        , required ingr
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                ingredients = arguments.ingr
            }
            , filter = { id = arguments.id}
        )
    }
    // get liked
    public function getLike(
        required string login_user
        , required string recipe
    ){
        return $getPresideObject("recipe_like").selectData(
            selectFields = ["liked"]
            , filter = "user = :user and recipe = :recipe"
            , filterParams = {
                "user" = arguments.login_user
                , "recipe" = arguments.recipe
            }
        )
    }

    public function updateLike(
        required string login_user
        , required string recipe
    ){
        var relationship = getLike(login_user = arguments.login_user, recipe = arguments.recipe);
        if (relationship.liked EQ ""){
            // new like
            $getPresideObject("recipe_like").insertData(
                data = {
                    user = arguments.login_user
                    , recipe = arguments.recipe
                    , liked = 1
                }
            )
        } else {
            // re-like
            if (relationship.liked EQ 0) {
                $getPresideObject("recipe_like").updateData(
                    data = {
                        liked = 1
                    }
                    , filter = "user = :user and recipe = :recipe"
                    , filterParams = {
                        "user" = arguments.login_user
                        , "recipe" = arguments.recipe
                    }
                )
            }
            else if (relationship.liked EQ 1) {
                // unlike
                $getPresideObject("recipe_like").updateData(
                    data = {
                        liked = 0
                    }
                    , filter = "user = :user and recipe = :recipe"
                    , filterParams = {
                        "user" = arguments.login_user
                        , "recipe" = arguments.recipe
                    }
                )
            }
        }
    }

    public function getLikedUser(
        required string recipe
    ){
        return $getPresideObject('recipe_like').selectData(
            selectFields = [
                'user'
                , 'user.login_id'
                , 'user.user_profile as profile'
            ]
            , filter = {
                recipe = arguments.recipe
                , liked = 1
            }
        )
    }

    public function getLikedRecipe(
        required string user
    ){
        return $getPresideObject('recipe_like').selectData(
            selectFields = [
                'recipe'
                , 'recipe.id'
                , 'recipe.name'
                , 'recipe$owner.display_name as owner_name'
            ]
            , filter = {
                user = arguments.user
                , liked = 1
            }
        )
    }
    
    public function getComment(
        required string recipe
    ){
        return $getPresideObject('recipe_comment').selectData(
            selectFields = [
                'user'
                , 'user.login_id'
                , 'user.user_profile as profile'
                , 'comment'
            ]
            , filter = {recipe = arguments.recipe}
        )
    }

    public function newComment(
        required string recipe
        , required string user
        , required string comment
    ){
        return $getPresideObject('recipe_comment').insertData(
            data = {
                recipe = arguments.recipe
                , user = arguments.user
                , comment = arguments.comment
            }
        )
    }

    public function deleteRecipe(
        required string id
    ){
        var deleteLike = $getPresideObject('recipe_like').deleteData(
            filter = {recipe = arguments.id}
        )
        if (deleteLike){
            return $getPresideObject('recipe').deleteData(
                filter = {id = arguments.id}
            )
        }
        return 0;
    }
}