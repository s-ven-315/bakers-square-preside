component {

    property name="websiteLoginService" inject="websiteLoginService";
    property name="siteTreeService" inject="siteTreeService";
    property name="recipeService" inject="RecipeService";

    private function index(event, rc, prc, args={} ){

        args.currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        args.recipeDetail = recipeService.getDetail(
            id = event.getCurrentPageId()
        )
        args.liked = recipeService.getLike(
            login_user = args.currentUserId
            , recipe = args.recipeDetail.id
        )
        args.likedUser = recipeService.getLikedUser(recipe=args.recipeDetail.id)

        args.comment = recipeService.getComment(recipe=args.recipeDetail.id)

        return renderView(
            view = 'page-types/recipe/index'
            , presideObject = 'recipe'
            , id = event.getCurrentPageId()
            , args = args
        )
    }

    public function create( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId();
        
        if (recipeService.isExisting(user_id = currentUserId, name = rc.recipeName)) {
            setNextEvent(
			    url= event.buildLink(page="#rc.pageId#")
		    );
        }
        
        var pageId = siteTreeService.addPage(
            title = rc.recipeName
            , slug = lCase(REReplaceNoCase(rc.recipeName, "[^a-z0-9]", "-", "ALL"))
            , page_type = "recipe"
            , parent_page = rc.pageId
        );

        var recipeDetail = {
            owner = currentUserId
            , name = rc.recipeName
            , serving = rc.serving
            , prepare_time = rc.prepareTime
            , cooking_time = rc.cookTime
            , id = pageId
        }

        recipeService.createRecipe( argumentCollection = recipeDetail);
      
        setNextEvent(
			url= event.buildLink(page="#pageId#")
		);
    }
    // update recipe name (do not allow to have recipe with same name)
    public function editName (event,rc, prc, args={}){
        var currentUserId = websiteLoginService.getLoggedInUserId();

        if (recipeService.isExisting(user_id = currentUserId, name = rc.recipeName)) {
            setNextEvent(
			    url= event.buildLink(page="#rc.id#")
		    );
        }
        recipeService.updateName( name = rc.recipeName, id = rc.id );

        siteTreeService.editPage(
            id = rc.id
            , title = rc.recipeName
            , slug = lCase(REReplaceNoCase(rc.recipeName, "[^a-z0-9]", "-", "ALL"))
        )

        setNextEvent(
			url= event.buildLink(page="#rc.id#")
		);
    }
    // update recipe detail (except name)
    public function edit( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId();

        var recipeDetail = {
            serving = rc.serving
            , prepare_time = rc.prepareTime
            , cooking_time = rc.cookTime
            , id = rc.id
        }

        recipeService.updateDetail( argumentCollection = recipeDetail);

      
        setNextEvent(
			url= event.buildLink(page="#rc.id#")
		);
    }
    // update steps
    public function step( event, rc, prc, args={} ){
        var recipeSteps = {
            steps = rc.steps
            , id = rc.id
        }

        recipeService.updateSteps( argumentCollection = recipeSteps)

        setNextEvent(
			url= event.buildLink(page="#rc.id#")
		);
    }
    // update ingredients
    public function ingr( event, rc, prc, args={} ){
        var recipeSteps = {
            ingr = rc.ingr
            , id = rc.id
        }

        recipeService.updateIngr( argumentCollection = recipeSteps)

        setNextEvent(
			url= event.buildLink(page="#rc.id#")
		);
    }

    // like recipe
    public function like( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        var recipeLike = {
            login_user = currentUserId
            , recipe = rc.recipeId
        }

        recipeService.updateLike( argumentCollection = recipeLike )

        setNextEvent(
            url = event.buildLink( page="#rc.pageId#" )
        )
    }

    // comment on a recipe
    public function comment( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId() ?: "";

        var newComment = {
            user = currentUserId
            , recipe = rc.recipe
            , comment = rc.comment
        }

        recipeService.newComment(argumentCollection = newComment)

        setNextEvent(
            url = event.buildLink( page="#rc.pageId#" )
        )
    }

    // delete a recipe
    public function delete( event, rc, prc, args={} ){
        siteTreeService.trashPage(id = rc.pageId)

        recipeService.deleteRecipe(id = rc.pageId)

        setNextEvent(
            url = event.buildLink( page="#rc.parentPageId#" )
        )
    }
}