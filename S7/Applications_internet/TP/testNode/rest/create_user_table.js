exports.up = function (db, Promise) {

	return db.schema.createTable('users', table => {
		table.increments('id').unsigned().primary()
		table.string('fullname').notNull()
		table.string('email').notNull()

	})
}

exports.down = function (db, Promise) {

}