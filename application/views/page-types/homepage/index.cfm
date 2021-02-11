<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfoutput>
	<div class="jumbotron">
		<h2>Get your chef hat on!</h2>
		<button class="homepage-signup"><a href="#event.buildLink( page="signup")#">Get Started</a></button>
	</div>

	#args.main_content#
</cfoutput>