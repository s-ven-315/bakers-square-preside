component extends="preside.system.coldboxModifications.RequestContextDecorator" {

    public boolean function isOwner( required string recipe_id, required string current_user ){
        var recipeDetail = getModel( "presideObjectService" ).selectData(
                                objectName="recipe"
                            ,   selectFields=[ "owner" ]
                            ,   filter = { "id" = arguments.recipe_id}
        )

        return ( current_user EQ recipeDetail.owner )
    }

}
