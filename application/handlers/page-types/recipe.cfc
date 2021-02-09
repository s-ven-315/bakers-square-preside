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
      
        var pageId = siteTreeService.addPage(
            title = rc.recipeName
            , slug = REReplaceNoCase(rc.recipeName, "[^a-z0-9]", "-", "ALL")
            , page_type = "recipe"
            , parent_page = url.pageId
        );

        var recipeDetail = {
            owner = currentUserId
            , serving = rc.serving
            , prepare_time = rc.prepareTime
            , cooking_time = rc.cookTime
            , id = pageId
        }

        recipeService.updateDetail( argumentCollection = recipeDetail);
      
        setNextEvent(
			url= event.buildLink(page="#pageId#")
		);
    }

}