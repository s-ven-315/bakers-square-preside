/**
 * @nolabel true
 */

component {
    property name="follower" dbtype="varchar" relationship="many-to-one" relatedTo="website_user" type="string";
    property name="following" dbtype="varchar" relationship="many-to-one" relatedTo="website_user" type="string";
    property name="connected" dbtype="boolean" type="boolean";
}