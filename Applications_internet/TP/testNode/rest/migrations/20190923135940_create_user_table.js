
exports.up = function(knex) {
	return knex.schema.createTable('users', table => {
		table.increments('id').unsigned().primary()
		table.string('fullname').notNull()
		table.string('email').notNull()

	})
};

exports.down = function(knex) {
  
};
