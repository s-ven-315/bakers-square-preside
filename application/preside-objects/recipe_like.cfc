/**
 * @nolabel true
 */

component {
    property name="user" dbtype="varchar" relationship="many-to-one" relatedTo="website_user" required=true;
    property name="recipe" dbtype="varchar" relationship="many-to-one" relatedTo="recipe" required=true;
    property name="liked" dbtype="tinyint" required=true;
}