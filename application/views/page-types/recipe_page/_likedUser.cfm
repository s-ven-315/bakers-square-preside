<cfoutput>
  	<div>
		<p>Likes (#args.likedUser.recordCount#)</p>
		<cfif args.likedUser.recordCount>
			<ul class="liked-list">
				<cfloop query="#args.likedUser#">
					<li class="liked-user">
						<p>
							<a href="#event.buildLink( userId = id )#">#login_id#</a>
						</p>
					</li>
				</cfloop>
			</ul>
		</cfif>
    </div>
</cfoutput>