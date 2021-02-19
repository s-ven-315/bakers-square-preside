/**
 * @presideService
 */

component {

    public any function init() {

        return this;

    }
    public function getDetail(
        required string recipeId
    ){
        return $getPresideObject('recipe').selectData(
           filter = {id = arguments.recipeId}
        )
    }

    public function getRecipe(
        required string targetUserId
        , string recipeName = ""
    ){
        var filter = "owner = :owner";
        
        var filterParams = {"owner" = arguments.targetUserId}

        if( len( arguments.recipeName ?: '' ) ){
			filter &= " AND name = :name";
			filterParams["name"] = arguments.recipeName;
        }

        return $getPresideObject('recipe').selectData(
            filter = filter
            , filterParams = filterParams
        )
    }
    
    public function createRecipe(
        required string owner
        , required string name
        , required serving
        , required prepare_time
        , required cooking_time
    ){
        return $getPresideObject('recipe').insertData(
            data = {
                name = arguments.name
                , owner = arguments.owner
                , serving = arguments.serving
                , prepare_time = arguments.prepare_time
                , cooking_time = arguments.cooking_time
            }
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
        required string userId
        , required string recipeName
    ){
        return $getPresideObject('recipe').dataExists(
            filter = {
                owner = arguments.userId
                , name = arguments.recipeName
            }
        );
    }

    // update steps
    public function updateSteps(
        required string recipeId
        , required steps
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                steps = arguments.steps
            }
            , filter = { id = arguments.recipeId}
        )
    }
    // update ingredients
    public function updateIngredients(
        required string recipeId
        , required ingredients
    ){
        return $getPresideObject('recipe').updateData(
            data = {
                ingredients = arguments.ingredients
            }
            , filter = { id = arguments.recipeId}
        )
    }
    // get liked
    public function getLike(
        required string userId
        , required string recipeId
    ){
        return $getPresideObject("recipe_like_relationship").selectData(
            filter = {
                user = arguments.userId
                , recipe = arguments.recipeId
            }
        )
    }

    public function updateLike(
        required string userId
        , required string recipeId
    ){
        var relationship = getLike(userId = arguments.userId, recipeId = arguments.recipeId);
        if (relationship.liked EQ ""){
            // new like
            $getPresideObject("recipe_like_relationship").insertData(
                data = {
                    user = arguments.userId
                    , recipe = arguments.recipeId
                    , liked = true
                }
            )
        } else {
            // re-like
            if (relationship.liked EQ false) {
                $getPresideObject("recipe_like_relationship").updateData(
                    data = {
                        liked = true
                    }
                    , filter = {
                        user = arguments.userId
                        , recipe = arguments.recipeId
                    }
                )
            }
            else if (relationship.liked EQ true) {
                // unlike
                $getPresideObject("recipe_like_relationship").updateData(
                    data = {
                        liked = false
                    }
                    , filter = {
                        user = arguments.userId
                        , recipe = arguments.recipeId
                    }
                )
            }
        }
    }

    public function getLikedUser(
        required string recipeId
    ){
        return $getPresideObject('recipe_like_relationship').selectData(
            selectFields = [
                'user.login_id'
                , 'user.id'
            ]
            , filter = {
                recipe = arguments.recipeId
                , liked = true
            }
        )
    }

    public function getLikedRecipe(
        required string user
    ){
        return $getPresideObject('recipe_like_relationship').selectData(
            filter = {
                user = arguments.user
                , liked = true
            }
        )
    }
    
    public function getComment(
        required string recipeId
    ){
        return $getPresideObject('recipe_comment').selectData(
            selectFields = [
                'user.id'
                , 'user.login_id'
                , 'comment'
            ]
            , filter = {recipe = arguments.recipeId}
        )
    }

    public function newComment(
        required string recipeId
        , required string userId
        , required string comment
    ){
        return $getPresideObject('recipe_comment').insertData(
            data = {
                recipe = arguments.recipeId
                , user = arguments.userId
                , comment = arguments.comment
            }
        )
    }

    public function deleteRecipe(
        required string recipeId
    ){
        $getPresideObject('recipe_like_relationship').deleteData(
            filter = {recipe = arguments.recipeId}
        )
        
        return $getPresideObject('recipe').deleteData(id = arguments.recipeId)
    }
}