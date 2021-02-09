<cfscript>
	mainMenu = renderViewlet( "core.navigation.mainMenu");
	userMenu = renderView( "/core/navigation/userMenu" );
</cfscript>

<cfoutput>
    <cfif IsFeatureEnabled( "websiteusers" )>
		<cfif IsLoggedIn()>
			<li>
				<a href="#event.buildLink( linkTo="login.logout" )#">
					#translateResource( "cms:cms.navigation.logout" )#
				</a>
			</li>
		<cfelse>
			<li>
				<a href="#event.buildLink( page="login" )#">
					#translateResource( "cms:cms.navigation.login" )#
				</a>
			</li>
		</cfif>
	</cfif>
	#mainMenu#
	#userMenu#
</cfoutput>