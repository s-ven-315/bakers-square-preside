/**
 * @showInSiteTree false
 * @sitetreeGridFields page.title
 */

component {
    property name="owner" relationship="many-to-one" relatedTo="website_user";
    property name="name" dbtype="varchar";
    property name="serving" dbtype="integer";
    property name="prepare_time" dbtype="integer";
    property name="cooking_time" dbtype="integer";
    property name="steps" dbtype="longtext";
    property name="ingredients" dbtype="longtext";
}