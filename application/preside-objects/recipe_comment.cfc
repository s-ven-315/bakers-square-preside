/**
 * @nolabel true
 */


component {
    property name="recipe" relationship="many-to-one" relatedTo="recipe" type="string";
    property name="user" relationship="many-to-one" relatedTo="website_user" type="string";
    property name="comment" dbtype="text" type="string";
}