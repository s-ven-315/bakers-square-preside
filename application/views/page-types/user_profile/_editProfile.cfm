<cfoutput>
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="##editProfileModal">
		Edit Profile
	</button>
	<div class="modal fade edit-profile-form" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editProfileModalLabel">Change Profile Name</h5>
				</div>
				<form action="#event.buildLink( linkTo = "page-types.user_profile.edit" )#" method = "POST">
					<div class="modal-body">
						<div class="form-group">
							<input type="hidden" name="pageId" value="#event.getCurrentPageId()#" />
							<input name="profileName" type="text" placeholder="New Profile Name">
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Save</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</cfoutput>