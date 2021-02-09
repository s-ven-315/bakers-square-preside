<cfscript>
    userProfile = args.userProfile ?: QueryNew("");
    currentUserId = args.currentUserId;
    relationship = args.connected ?: QueryNew("");
    follower = args.follower ?: QueryNew("");
    following = args.following ?: QueryNew("");
</cfscript>

<cfoutput>
    <cfif currentUserId EQ userProfile.id>
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
            <form action="#event.buildLink(linkTo="page-types.user_profile.edit", queryString="pageId=#event.getCurrentPageId()#")#" method="POST">
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
            <cfif IsFeatureEnabled( "websiteusers" )>
              <cfif IsLoggedIn()>
                <cfif currentUserId NEQ userProfile.id>
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
              </cfif>
            </cfif>
        </div>
    </cfif>
    
    <div class="follow-section">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##followerModal">#follower.recordCount# Follower</button>
        <div class="modal fade" id="followerModal" tabindex="-1" role="dialog" aria-labelledby="followerModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="followerModalLabel">Follower</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <cfif follower.recordCount>
                  <ul class="follower-list">
                    <cfloop query="follower">
                      <li class="follower-listitem">
                      <p><a href="#event.buildLink(page="#follower.user_profile#")#">#follower.login_id#</a></p>
                      </li>
                    </cfloop>
                  </ul>
                </cfif>
              </div>
            </div>
          </div>
        </div>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##followingModal">#following.recordCount# Following</button>
        <div class="modal fade" id="followingModal" tabindex="-1" role="dialog" aria-labelledby="followingModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="followingModalLabel">Following</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <cfif following.recordCount>
                  <ul class="following-list">
                    <cfloop query="following">
                      <li class="following-listitem">
                      <p><a href="#event.buildLink(page="#following.user_profile#")#">#following.login_id#</a></p>
                      </li>
                    </cfloop>
                  </ul>
                </cfif>
              </div>
            </div>
          </div>
        </div>
      </div>
</cfoutput>