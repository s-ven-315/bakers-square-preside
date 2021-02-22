component {
    property name="recipeService" inject="RecipeService";

    private function index(event, rc, prc, args={} ){

        args.recipeDetail = recipeService.getDetail(
            recipeId = url.recipeId
        )
      
        return renderView(
            view = 'page-types/session/index'
            , args = args
        )
    }

}