<cfscript>
    userProfile = args.userProfile ?: QueryNew("");
    currentUserId = args.currentUserId;
    relationship = args.connected ?: QueryNew("");
    follower = args.follower ?: QueryNew("");
    following = args.following ?: QueryNew("");
</cfscript>

<cfoutput>
    <cfif currentUserId EQ userProfile.login_id>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##editProfileModal">
        Edit Profile
    </button>
    <div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="editProfileModalLabel">Change Profile Name</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="#event.buildLink(linkTo="page-types.user_profile.edit")#" method="POST">
                <div class="modal-body">
                        <div class="form-group">
                            <input name="profileName" type="text" placeholder="New Profile Name">
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Save</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                </div>
            </form>
          </div>
        </div>
      </div>
    </cfif>
    <cfif userProfile.recordCount>
        <div class="user-profile">
            <h3>#userProfile.display_name#</h3>
            <p>@#userProfile.login_id#</p>
            <cfif currentUserId NEQ userProfile.login_id>
              <form action="#event.buildLink(linkTo="page-types.user_profile.follow", queryString="userId=#event.getPageProperty("title")#")#" method="POST">
                <button>
                  <cfif relationship.recordCount EQ 0 || relationship.connected EQ 0>
                    Follow
                  <cfelse>
                    Unfollow
                  </cfif>
                </button>
              </form>
            </cfif>
        </div>
    </cfif>
    <div class="follow-section">
        <p>#follower.recordCount# Follower</p>
        <p>#following.recordCount# Following</p>
    </div>
</cfoutput>