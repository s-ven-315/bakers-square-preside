component {

    property name="websiteLoginService" inject="websiteLoginService";
    property name="siteTreeService" inject="siteTreeService";
    property name="recipeService" inject="RecipeService";

    private function index(event, rc, prc, args={} ){
        args.recipeDetail = recipeService.getDetail(
            id = event.getCurrentPageId()
        )

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

    public function edit( event, rc, prc, args={} ){
        var currentUserId = websiteLoginService.getLoggedInUserId();

        var recipeDetail = {
            name = rc.recipeName
            , serving = rc.serving
            , prepare_time = rc.prepareTime
            , cooking_time = rc.cookTime
            , id = rc.id
        }

        if (recipeService.isExisting(user_id = currentUserId, name = rc.recipeName)) {
            setNextEvent(
			    url= event.buildLink(page="#rc.id#")
		    );
        }

        recipeService.updateDetail( argumentCollection = recipeDetail);

        siteTreeService.editPage(
            id = rc.id
            , title = rc.recipeName
            , slug = lCase(REReplaceNoCase(rc.recipeName, "[^a-z0-9]", "-", "ALL"))
        )
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
}