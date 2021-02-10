/**
 * @nolabel true
 */

component {
    property name="user" dbtype="varchar" relationship="many-to-one" relatedTo="website_user";
    property name="recipe" dbtype="varchar" relationship="many-to-one" relatedTo="recipe";
    property name="liked" dbtype="tinyint";
}