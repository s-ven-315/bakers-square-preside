<cfscript>
    relationship = args.connected ?: QueryNew("");
    follower = args.follower ?: QueryNew("");
    following = args.following ?: QueryNew("");
</cfscript>

<cfoutput>
  <div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##followerModal">#follower.recordCount# Follower</button>
  </div>
  <div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="##followingModal">#following.recordCount# Following</button>
  </div>

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
</cfoutput>
