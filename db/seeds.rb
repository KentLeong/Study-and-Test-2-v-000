# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:"jugunyong@yahoo.com", username:"Eric", password:"ec257816", role: 3)
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




    Concept.create(name:"Addition", subcategory_id:1, description:"Adding numbers")
      Question.create(inquest:"What is 1 + 1", answer: "2", concept_id:1, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 5 + 2", answer: "7", concept_id:1, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 6 + 4", answer: "10", concept_id:1, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 8 + 17", answer: "25", concept_id:1, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 2 + 1", answer: "3", concept_id:1, user_id:1, qtype: 0, difficulty: 1)
    Concept.create(name:"Subtraction", subcategory_id:1, description:"subtracting numbers")
      Question.create(inquest:"What is 5 - 1", answer: "4", concept_id:2, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 51 - 22", answer: "29", concept_id:2, user_id:1, qtype: 0, difficulty: 2)
      Question.create(inquest:"What is 6 - 5", answer: "1", concept_id:2, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 2 - 11", answer: "9", concept_id:2, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 12 - 9", answer: "3", concept_id:2, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 5 - 41", answer: "-37", concept_id:2, user_id:1, qtype: 0, difficulty: 2)
      Question.create(inquest:"What is 9 - 17", answer: "-8", concept_id:2, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 2 - 5", answer: "-3", concept_id:2, user_id:1, qtype: 0, difficulty: 1)
    Concept.create(name:"Division", subcategory_id:1, description:"dividing numbers")
      Question.create(inquest:"What is 10 / 1", answer: "10", concept_id:3, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 66 / 22", answer: "3", concept_id:3, user_id:1, qtype: 0, difficulty: 2)
      Question.create(inquest:"What is 10 / 5", answer: "2", concept_id:3, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 12 / 2", answer: "6", concept_id:3, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 78 / 2", answer: "39", concept_id:3, user_id:1, qtype: 0, difficulty: 2)
      Question.create(inquest:"What is 20 / 4", answer: "5", concept_id:3, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 75 / 5", answer: "13", concept_id:3, user_id:1, qtype: 0, difficulty: 1)
    Concept.create(name:"Multiplication", subcategory_id:1, description:"multiplying numbers")
      Question.create(inquest:"What is 5 * 1", answer: "5", concept_id:4, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 24 * 10", answer: "240", concept_id:4, user_id:1, qtype: 0, difficulty: 2)
      Question.create(inquest:"What is 6 * 5", answer: "30", concept_id:4, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 2 * 11", answer: "22", concept_id:4, user_id:1, qtype: 0, difficulty: 1)
      Question.create(inquest:"What is 150 * 2", answer: "300", concept_id:4, user_id:1, qtype: 0, difficulty: 2)
      Question.create(inquest:"What is 8 * 7", answer: "56", concept_id:4, user_id:1, qtype: 0, difficulty: 2)

    Concept.create(name:"Pythagorean Theorem", subcategory_id:2, description:"doing math numbers")
