# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:"wewef@yahoo.com", username:"Eric", password:"123456", role: 3)
User.create(email:"ewfw@yahoo.com", username:"Kevin", password:"123456", role: 2)
User.create(email:"wefwef@yahoo.com", username:"Justin", password:"123456", role: 1)

Category.create(name:"Math")
Category.create(name:"Vocab")
Category.create(name:"Books")


Subcategory.create(name:"Algebra", category_id: 1)
Subcategory.create(name:"Geometry", category_id: 1)
Subcategory.create(name:"Biology", category_id: 2)
Subcategory.create(name:"Harry Potter and the Philosopher's Stone", category_id: 3)



    Concept.create(name:"Addition", subcategory_id:1, description:"Adding numbers")
      Question.create(inquest:"What is 1 + 1", answer: "2", concept_id:1, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 5 + 2", answer: "7", concept_id:1, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 6 + 4", answer: "10", concept_id:1, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 8 + 17", answer: "25", concept_id:1, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 2 + 1", answer: "3", concept_id:1, user_id:1, difficulty: 1)
    Concept.create(name:"Subtraction", subcategory_id:1, description:"subtracting numbers")
      Question.create(inquest:"What is 5 - 1", answer: "4", concept_id:2, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 51 - 22", answer: "29", concept_id:2, user_id:1, difficulty: 2)
      Question.create(inquest:"What is 6 - 5", answer: "1", concept_id:2, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 2 - 11", answer: "9", concept_id:2, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 12 - 9", answer: "3", concept_id:2, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 5 - 41", answer: "-37", concept_id:2, user_id:1, difficulty: 2)
      Question.create(inquest:"What is 9 - 17", answer: "-8", concept_id:2, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 2 - 5", answer: "-3", concept_id:2, user_id:1, difficulty: 1)
    Concept.create(name:"Division", subcategory_id:1, description:"dividing numbers")
      Question.create(inquest:"What is 10 / 1", answer: "10", concept_id:3, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 66 / 22", answer: "3", concept_id:3, user_id:1, difficulty: 2)
      Question.create(inquest:"What is 10 / 5", answer: "2", concept_id:3, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 12 / 2", answer: "6", concept_id:3, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 78 / 2", answer: "39", concept_id:3, user_id:1, difficulty: 2)
      Question.create(inquest:"What is 20 / 4", answer: "5", concept_id:3, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 75 / 5", answer: "13", concept_id:3, user_id:1, difficulty: 1)
    Concept.create(name:"Multiplication", subcategory_id:1, description:"multiplying numbers")
      Question.create(inquest:"What is 5 * 1", answer: "5", concept_id:4, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 24 * 10", answer: "240", concept_id:4, user_id:1, difficulty: 2)
      Question.create(inquest:"What is 6 * 5", answer: "30", concept_id:4, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 2 * 11", answer: "22", concept_id:4, user_id:1, difficulty: 1)
      Question.create(inquest:"What is 150 * 2", answer: "300", concept_id:4, user_id:1, difficulty: 2)
      Question.create(inquest:"What is 8 * 7", answer: "56", concept_id:4, user_id:1, difficulty: 2)

      Concept.create(name:"Chapter 1: The Boy Who Lived", subcategory_id:4, description:"The Boy Who Lived")
        Question.create(inquest:"What drill company does Vernon Dursely work for?", answer: "Grunnings", concept_id:5, user_id:1, difficulty: 4)
        Question.create(inquest:"What is a muggle?", answer: "Non-magic folk", concept_id:5, user_id:1, difficulty: 1)
        Question.create(inquest:"Where do the Durselys live?", answer: "4 Privet Drive", concept_id:5, user_id:1, difficulty: 1)
        Question.create(inquest:"What does Dumbledore use to syphon all the street lights?", answer: "Deluminator", concept_id:5, user_id:1, difficulty: 1)
        Question.create(inquest:"Who killed Lily and James Potter?", answer: "Voldemort", concept_id:5, user_id:1, difficulty: 1)
      Concept.create(name:"Chapter 2: The Vanishing Glass", subcategory_id:4, description:"The Vanishing Glass")
        Question.create(inquest:"How long has Harry lived at the Durselys?", answer: "10 years", concept_id:6, user_id:1, difficulty: 1)
        Question.create(inquest:"Where does Harry live at the Durseyls?", answer: "The cupboard under the stairs", concept_id:6, user_id:1, difficulty: 2)
        Question.create(inquest:"What is Harry's scar in the form of?", answer: "Lightning", concept_id:6, user_id:1, difficulty: 1)
        Question.create(inquest:"Who lives next to the Durselys", answer: "Arabella Figg", concept_id:6, user_id:1, difficulty: 1)
        Question.create(inquest:"What did Harry dream about last night?", answer: "A motarbike", concept_id:6, user_id:1, difficulty: 1)
        Question.create(inquest:"What kind of snake did Harry see?", answer: "Boa Constrictor", concept_id:6, user_id:1, difficulty: 2)
        Question.create(inquest:"How long did Vernon punish Harry with no meals for?", answer: "1 week", concept_id:6, user_id:1, difficulty: 1)
      Concept.create(name:"Chapter 3: The Letters from No One", subcategory_id:4, description:"The Letters from No One")
        Question.create(inquest:"What season was it when Harry was finally able to come out of his cupboard?", answer: "Summer", concept_id:7, user_id:1, difficulty: 1)
        Question.create(inquest:"Where is Dudley going to school?", answer: "Smeltings Academy", concept_id:7, user_id:1, difficulty: 2)
        Question.create(inquest:"Where is Harry going to school?", answer: "Stonewall High", concept_id:7, user_id:1, difficulty: 1)
        Question.create(inquest:"Why did Vernon decide to leave the house?", answer: "Attacked by letters", concept_id:7, user_id:1, difficulty: 1)
        Question.create(inquest:"How old is Harry turning?", answer: "11", concept_id:7, user_id:1, difficulty: 2)
