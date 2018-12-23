initialize
initializeAvatar
	avatar := TAvatarUser new.
	avatar userID: userID.
	avatar harness: self.
	avatar snapshots: snapshots.
	avatar loadAvatar: 'Content/Avatars/WhiteRabbit.mdl'.
