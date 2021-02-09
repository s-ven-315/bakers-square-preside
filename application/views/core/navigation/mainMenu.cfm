<cfscript>
	args.menuItems = args.menuItems ?: [];
</cfscript>
<cfoutput>
    <cfloop array="#( args.menuItems ?: [] )#" index="i" item="item">
        <li class="<cfif item.active>active </cfif><cfif item.children.len()>dropdown</cfif>">
            <a href="#event.buildLink( page=item.id )#" class="<cfif item.children.len()>dropdown-toggle</cfif>" <cfif item.children.len()>data-toggle="dropdown"</cfif>>#item.title#</a>
            <cfif item.children.len()>
                <ul class="dropdown-menu" role="menu">
                    #renderView( view='/core/navigation/mainMenu', args={ menuItems=item.children } )#
                </ul>
            </cfif>
        </li>
    </cfloop>
</cfoutput>