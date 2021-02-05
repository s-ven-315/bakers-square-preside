<cfscript>
    userProfile = args.userProfile ?: QueryNew("");
</cfscript>

<cfoutput>
    <cfif userProfile.recordCount>
        <div class="user-profile">
            <h3>#userProfile.display_name#</h3>
            <p>@#userProfile.username#</p>
        </div>
    </cfif>
</cfoutput>