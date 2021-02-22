<cfscript>
	userProfile = args.userProfile ?: QueryNew("");
	currentUserId = args.currentUserId;
</cfscript>

<cfoutput>
	<cfif IsFeatureEnabled( "websiteusers" )>
		<cfif IsLoggedIn()>
			<li class="nav-user">
				<button class="dropdown-toggle" data-toggle="dropdown">#userProfile.login_id#</button>
				<ul class="dropdown-menu" role="menu">
					<li>
						<a href="#event.buildLink( userId=currentUserId)#">
							Profile Page
						</a>
					</li>
					<li>
						<a href="#event.buildLink( linkTo="login.logout" )#">
							#translateResource( "cms:cms.navigation.logout" )#
						</a>
					</li>
				</ul>
			</li>
		<cfelse>
			<li>
				<a class="nav-signup" href="#event.buildLink( page="signup")#">
					Sign Up
				</a>
			</li>
			<li class="nav-login">
				<a href="#event.buildLink( page="login" )#">
					#translateResource( "cms:cms.navigation.login" )#
				</a>
			</li>
		</cfif>
	</cfif>
</cfoutput>

