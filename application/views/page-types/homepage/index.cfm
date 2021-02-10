<cfparam name="args.title"        type="string" field="page.title"        editable="true" />
<cfparam name="args.main_content" type="string" field="page.main_content" editable="true" />

<cfoutput>
	<div class="jumbotron">
		<h2>Get your chef hat on!</h2>
		<button>Get Started</button>
	</div>

	#args.main_content#
</cfoutput>