/**
 * @nolabel true
 */

component {
    property name="user" dbtype="varchar" relationship="many-to-one" relatedTo="website_user" type="string";
    property name="recipe" dbtype="varchar" relationship="many-to-one" relatedTo="recipe" type="string";
    property name="liked" dbtype="boolean" type="boolean" ;
}