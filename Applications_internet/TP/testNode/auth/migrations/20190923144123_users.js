
exports.up = function(knex) {
	return knex.schema.createTable('users', table => {
		table.increments('id').unsigned().primary()
		table.string('email').notNull()
		table.string('password')
		table.bool('active').default(false)

	})
};

exports.down = function(knex) {
  
};
