<cfoutput>
  <div>
        <p>Likes (#args.likedUser.recordCount#)</p>
        <cfif args.likedUser.recordCount>
            <ul class="liked-list">
              <cfloop query="#args.liked#">
                <li class="liked-user">
                <p><a href="#event.buildLink(page="#args.likedUser.profile#")#">#args.likedUser.login_id#</a></p>
                </li>
              </cfloop>
            </ul>
          </cfif>
    </div>
</cfoutput>