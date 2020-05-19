Shelter.destroy_all
Pet.destroy_all
Application.destroy_all

@shelter_1 = Shelter.create(name:     "Dumb Friends League",
                            address:  "12483 Jefferson Drive",
                            city:     "Denver",
                            state:    "CO",
                            zip:      "80205")


@shelter_2 = Shelter.create(name:     "Peace, Love, Paws",
                            address:  "38372 Main",
                            city:     "Fort Collins",
                            state:    "CO",
                            zip:      "80205")

@shelter_3 = Shelter.create(name:     "Pet Heaven",
                            address:  "4563 Royal Avenue",
                            city:     "Fort Collins",
                            state:    "CO",
                            zip:      "80205")

@shelter_4 = Shelter.create(name:     "Love Four Legged Friends",
                            address:  "7864 Collins",
                            city:     "Aurora",
                            state:    "CO",
                            zip:      "80205")


@pet_10 = Pet.create( image: "https://www.southbostonanimalhospital.com/hubfs/How-to-Get-Some-Sleep-When-Your-Pet-Keeps-You-Up-at-Night.jpg",
                      name:  "Felix",
                      description: "Super loveable! Just looking for a place to settle down and call home",
                      approximate_age: "<1",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)


@pet_11 = Pet.create( image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/09/dog-landing-hero-lg.jpg?bust=1536935129&width=1080",
                      name:  "Echo",
                      description: "Super friendly towards humans. Still shy around her furry friends",
                      approximate_age: "4",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_1 = Pet.create(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                      name:  "Huxley",
                      description: "Sweet senoir dog",
                      approximate_age: "18",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)


@pet_2 = Pet.create(  image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2016/05/19091354/Weimaraner-puppy-outdoors-with-bright-blue-eyes.20190813165758508-1.jpg",
                      name:  "Shadow",
                      description: "He's aged like fine wine",
                      approximate_age: "6",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)

@pet_3 = Pet.create(  image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo",
                      name:  "Scooter",
                      description: "Don't let the looks fool you... She's a sweetheart",
                      approximate_age: "2",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_4 = Pet.create(  image: "https://d1941uuft27pfg.cloudfront.net/breed-uploads/2018/08/akita-card-medium.jpg?bust=1535569354",
                      name:  "Sasha",
                      description: "Stays to herself except when you have treats",
                      approximate_age: "4",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_5 = Pet.create(  image: "https://cdn.mos.cms.futurecdn.net/QjuZKXnkLQgsYsL98uhL9X.jpg",
                      name:  "Gizmo",
                      description: "Full of energy and a great family dog",
                      approximate_age: "4",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_6 = Pet.create(  image: "https://i0.wp.com/cdn-prod.medicalnewstoday.com/content/images/articles/327/327387/cat-playing-with-toy.jpg?w=1155&h=1734",
                      name:  "Molly",
                      description: "Sweet and loving",
                      approximate_age: "8",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_7 = Pet.create(  image: "https://images.immediate.co.uk/production/volatile/sites/4/2018/12/GettyImages-918529586-35c7227.jpg?quality=90&crop=61px%2C468px%2C7710px%2C3317px&resize=960%2C408",
                      name:  "Bubbles",
                      description: "He enjoys the outdoors but will never complain about a lazy day inside",
                      approximate_age: "3",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_9 = Pet.create(  image: "https://dcist.com/wp-content/uploads/sites/3/2020/02/wilford_newsletter.jpg",
                      name:  "Tuna",
                      description: "I know I'm a cat but I just love tuna!",
                      approximate_age: "5",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)



@review_1 = @shelter_1.reviews.create( title: "These guys were ok....ish",
                                        rating: "3",
                                        content: "Puppies were cool, staff not so much.",
                                        picture: 'https://i.redd.it/zz62ggz08k021.jpg')

@review_2 = @shelter_2.reviews.create( title: "Best place to adopt a cat",
                                        rating: "4",
                                        content: "Every visit was easy and simple. Being able to interact with the cats is always fun. Having others volunteers or workers help with the cat interactions was great. ",
                                        picture: 'https://www.wellnesspetfood.com/sites/default/files/styles/blog_feature/public/media/images/shutterstock_624899891.jpg?itok=OTYZ3ygu')

@review_2 = @shelter_3.reviews.create( title: "Would highly recommend",
                                      rating: "5",
                                      content: "This shelter goes beyond the call of duty.",
                                      picture: 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Dog_in_animal_shelter_in_Washington%2C_Iowa.jpg')

@review_2 = @shelter_4.reviews.create( title: "I will never go back",
                                      rating: "1",
                                      content: "This shelter needs to be inspected. The cleanliness is below average. Staff are never around.",)

@application_1 = Application.create(name:  "Meg",
                                    address: "3827 River Oaks Rd.",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "87638",
                                    phone: "720-873-3467",
                                    description: "I already have several furry friends and they need friends!")

@application_2 = Application.create(name:  "Mike",
                                    address: "4572 Sherman Lane",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "87628",
                                    phone: "720-563-3583",
                                    description: "My dog loves to eat dusters! So why not let him eat dusters with a friend")

@application_3 = Application.create(name:  "Cory",
                                    address: "3278 Wallabee Lane",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "84834",
                                    phone: "303-283-3367",
                                    description: "Since owning my first cat I had to get a standing desk. I feel it's only right to assemble the ultimate cat team to conquer the almighty desk!")

PetApplication.create(pet_id: @pet_2.id, application_id: @application_1.id)
PetApplication.create(pet_id: @pet_7.id, application_id: @application_2.id)
PetApplication.create(pet_id: @pet_4.id, application_id: @application_3.id)

puts "Created #{Shelter.count} Shelters"
puts "Created #{Pet.count} Pets"
puts "Created #{Review.count} Reviews"
puts "Created #{Application.count} Applications"
