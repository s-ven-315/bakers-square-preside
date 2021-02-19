/**
 * @nolabel true
 */

component {
    property name="owner" dbtype="varchar" type="string" relationship="many-to-one" relatedTo="website_user";
    property name="name" dbtype="varchar" type="string";
    property name="serving" dbtype="integer" type="integer";
    property name="prepare_time" dbtype="integer" type="integer";
    property name="cooking_time" dbtype="integer" type="integer";
    property name="steps" dbtype="longtext" type="string";
    property name="ingredients" dbtype="longtext" type="string";
}