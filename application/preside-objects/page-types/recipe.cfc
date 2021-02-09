/**
 * @allowedParentPageTypes user_profile
 * @showInSiteTree false
 * @sitetreeGridFields page.title
 */

component {
    property name="owner" relationship="many-to-one" relatedTo="website_user";
    property name="serving" dbtype="integer";
    property name="prepare_time" dbtype="integer";
    property name="cooking_time" dbtype="integer";
}