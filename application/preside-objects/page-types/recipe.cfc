/**
 * @allowedParentPageTypes user_profile
 * @showInSiteTree false
 * @sitetreeGridFields page.title
 */

component {
    property name="owner" relationship="many-to-one" relatedTo="website_user";
}