# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:"jugunyong@yahoo.com", username:"Eric", password:"ec257816")
Category.create(name:"Math")
Category.create(name:"Vocab")
Category.create(name:"Books")
Category.create(name:"Movies")
Category.create(name:"Science")


Subcategory.create(name:"Algebra", category_id: 1)
Subcategory.create(name:"Geometry", category_id: 1)
Subcategory.create(name:"Pre-Algebra", category_id: 1)
Subcategory.create(name:"Calculous", category_id: 1)


Subcategory.create(name:"General", category_id: 2)
Subcategory.create(name:"Computer Science", category_id: 2)

Subcategory.create(name:"Harry Potter and the Philosopher's Stone", category_id: 3)

Subcategory.create(name:"Harry Potter and the Philosopher's Stone", category_id: 4)

Subcategory.create(name:"Biology", category_id: 5)


Concept.create(name:"Addition", subcategory_id:1)
Concept.create(name:"Subtraction", subcategory_id:1)
Concept.create(name:"Division", subcategory_id:1)

Concept.create(name:"Pythagorean Theorem", subcategory_id:2)
