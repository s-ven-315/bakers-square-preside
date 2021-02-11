/**
 * @nolabel true
 */


component {
    property name="recipe" relationship="many-to-one" relatedTo="recipe";
    property name="user" relationship="many-to-one" relatedTo="website_user";
    property name="comment" dbtype="text";
}