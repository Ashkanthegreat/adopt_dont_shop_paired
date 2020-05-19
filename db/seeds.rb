Shelter.destroy_all
Pet.destroy_all
Application.destroy_all

@shelter_1 = Shelter.create(name:     "Pet Palace",
                            address:  "12483 Jefferson Drive",
                            city:     "Denver",
                            state:    "CO",
                            zip:      "80205")


@shelter_2 = Shelter.create(name:     "Save a Pet",
                            address:  "38372 Main",
                            city:     "Fort Collins",
                            state:    "CO",
                            zip:      "80205")

@shelter_3 = Shelter.create(name:     "Pet Oasis",
                            address:  "4563 Royal Avenue",
                            city:     "Fort Collins",
                            state:    "CO",
                            zip:      "80205")

@shelter_4 = Shelter.create(name:     "Adopt a Pet",
                            address:  "7864 Collins",
                            city:     "Aurora",
                            state:    "CO",
                            zip:      "80205")


@pet_10 = Pet.create( image: "https://d17fnq9dkz9hgj.cloudfront.net/uploads/2017/12/adoptable-cat-cropped.jpeg",
                      name:  "Felix",
                      description: "Super loveable! Just looking for a place to settle down and call home",
                      approximate_age: "5",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)


@pet_11 = Pet.create( image: "https://wtop.com/wp-content/uploads/2019/05/small-black-dog.jpg",
                      name:  "Echo",
                      description: "Super friendly towards humans. Still shy around her furry friends",
                      approximate_age: "4",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_1 = Pet.create(  image: "https://i.imgur.com/wKls5bM.png",
                      name:  "Ziggy",
                      description: "He's a super chill dude",
                      approximate_age: "1",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)


@pet_2 = Pet.create(  image: "https://www.thesprucepets.com/thmb/JN3PLkiEX5HOCqQca7ZrcFkdYV0=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-962608834-fd496cfed51e4d2abe61c0af864fa681.jpg",
                      name:  "Shadow",
                      description: "He's aged like fine wine",
                      approximate_age: "8",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)

@pet_3 = Pet.create(  image: "https://img.buzzfeed.com/buzzfeed-static/static/2018-06/25/6/asset/buzzfeed-prod-web-02/sub-buzz-30033-1529923650-1.jpg?downsize=700%3A%2A&output-quality=auto&output-format=auto&output-quality=auto&output-format=auto&downsize=360:*",
                      name:  "Spazz",
                      description: "Don't let the looks fool you... She's a sweetheart",
                      approximate_age: "2",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_4 = Pet.create(  image: "https://apamo.org/wp-content/uploads/2020/03/A076662.jpg",
                      name:  "Sasha",
                      description: "Stays to herself except when the tin can gets open",
                      approximate_age: "4",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_5 = Pet.create(  image: "https://www.denvergov.org/content/dam/denvergov/Portals/682/images/AdoptableDog_MainAdoptablesImage.jpg",
                      name:  "Gizmo",
                      description: "Full of energy and a great family dog",
                      approximate_age: "4",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_6 = Pet.create(  image: "https://g.petango.com/photos/2241/5832e7cd-0325-4037-85ac-d108d894dafd.jpg",
                      name:  "Molly",
                      description: "Sweet and loving",
                      approximate_age: "6",
                      sex: "female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_7 = Pet.create(  image: "https://g.petango.com/photos/2241/36841309-3e95-4b45-b411-90df7d99baac.jpg",
                      name:  "Bubbles",
                      description: "He enjoys the outdoors but will never complain about a lazy day inside",
                      approximate_age: "3",
                      sex: "male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_9 = Pet.create(  image: "https://cf-images.us-east-1.prod.boltdns.net/v1/static/5615998031001/8b371b05-61d2-4f6f-99c0-716a599251c0/ce28a4b0-6989-40fd-9574-8624b83825ce/1280x720/match/image.jpg",
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
