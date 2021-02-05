/**
 * @allowedParentPageTypes homepage
 * @showInSiteTree false
 * @sitetreeGridFields page.title
 */

component {
    property name="email" relationship="one-to-one" relatedTo="website_user";
    property name="followers" relationship="many-to-many" relatedTo="user_profile";
}