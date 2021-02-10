component {
    property name="recipeService" inject="RecipeService";

    private function index(event, rc, prc, args={} ){

        args.recipeDetail = recipeService.getDetail(
            id = url.recipeId
        )
      
        return renderView(
            view = 'page-types/session/index'
            , args = args
        )
    }

}