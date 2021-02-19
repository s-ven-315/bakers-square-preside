component {

    property name="websiteLoginService" inject="websiteLoginService";
    property name="recipeService" inject="RecipeService";

    public function index(event, rc, prc, args={} ){

        args.currentUserId = websiteLoginService.getLoggedInUserId() ?: "";
        args.recipeId = prc.recipeId ?:"";
    
        if (args.recipeId == ""){
            return event.setView( view="/page-types/recipe_page/notFound", args=args );
        }

        args.recipeDetail = recipeService.getDetail(
            recipeId = args.recipeId
        )

        args.likedRelationship = recipeService.getLike(
            userId = args.currentUserId
            , recipeId = args.recipeId
        )

        args.likedUser = recipeService.getLikedUser(recipeId = args.recipeId)

        args.comment = recipeService.getComment(recipeId = args.recipeId)
        event.setView( view="/page-types/recipe_page/index", args=args );

    }

    public function create( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId();
        
        if (recipeService.isExisting(userId = currentUserId, recipeName = rc.recipeName)) {
            setNextEvent(
			    url= event.buildLink(userId = currentUserId)
		    );
        }
        
        var recipeDetail = {
            owner = currentUserId
            , name = rc.recipeName
            , serving = rc.serving
            , prepare_time = rc.prepareTime
            , cooking_time = rc.cookTime
        }

        var newRecipeId = recipeService.createRecipe( argumentCollection = recipeDetail);
      
        setNextEvent(
			url= event.buildLink(recipeId = newRecipeId, userId = currentUserId)
		);
    }
    // update recipe name (do not allow to have recipe with same name)
    public function editRecipeName (event,rc, prc, args={}){
        if (recipeService.isExisting(userId = rc.ownerId, recipeName = rc.recipeName)) {
            setNextEvent(
			    url= event.buildLink(recipeId = rc.recipeId, userId = rc.ownerId)
		    );
        }
        recipeService.updateName( name = rc.recipeName, id = rc.recipeId );

        setNextEvent(
			url= event.buildLink(recipeId = rc.recipeId, userId = rc.ownerId)
		);
    }
    // update recipe detail (except name)
    public function editDetail( event, rc, prc, args={} ){
        var recipeDetail = {
            serving = rc.serving
            , prepare_time = rc.prepareTime
            , cooking_time = rc.cookTime
            , id = rc.id
        }

        recipeService.updateDetail( argumentCollection = recipeDetail);

      
        setNextEvent(
			url= event.buildLink(recipeId = rc.id, userId = rc.ownerId)
		);
    }
    // update steps
    public function updateSteps( event, rc, prc, args={} ){
        var recipeSteps = {
            steps = rc.steps
            , recipeId = rc.recipeId
        }

        recipeService.updateSteps( argumentCollection = recipeSteps)

        setNextEvent(
			url= event.buildLink(recipeId = rc.recipeId, userId = rc.ownerId)
		);
    }
    // update ingredients
    public function updateIngredients( event, rc, prc, args={} ){
        var recipeIngredients = {
            ingredients = rc.ingredients
            , recipeId = rc.recipeId
        }

        recipeService.updateIngredients( argumentCollection = recipeIngredients)

        setNextEvent(
			url= event.buildLink(recipeId = rc.recipeId, userId = rc.ownerId)
		);
    }

    // like recipe
    public function like( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        var recipeLike = {
            userId = currentUserId
            , recipeId = rc.recipeId
        }

        recipeService.updateLike( argumentCollection = recipeLike )

        setNextEvent(
			url= event.buildLink(recipeId = rc.recipeId, userId = rc.ownerId)
		);
    }

    // comment on a recipe
    public function comment( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        var newComment = {
            userId = currentUserId
            , recipeId = rc.recipeId
            , comment = rc.comment
        }

        recipeService.newComment(argumentCollection = newComment)

        setNextEvent(
			url= event.buildLink(recipeId = rc.recipeId, userId = rc.ownerId)
		);
    }

    // delete a recipe
    public function delete( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";
        
        recipeService.deleteRecipe(id = rc.recipeId)

        setNextEvent(
            url = event.buildLink( userId = currentUserId )
        )
    }
}