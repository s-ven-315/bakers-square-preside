/**
 * @nolabel true
 */

component {
    property name="follower" dbtype="varchar" relationship="many-to-one" relatedTo="website_user";
    property name="following" dbtype="varchar" relationship="many-to-one" relatedTo="website_user";
    property name="connected" dbtype="tinyint";
}