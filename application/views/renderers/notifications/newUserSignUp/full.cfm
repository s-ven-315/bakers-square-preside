<cfoutput>
    <h2>New user sign up</h2>
    <table border="1">
        <tr>
            <td>Login Id:</td>
            <td>#args.login_id ?: ""#</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>#args.email_address?:""#</td>
        </tr>
    </table>
</cfoutput>