Shelter.destroy_all
Pet.destroy_all
Application.destroy_all

@shelter_1 = Shelter.create(name:     "Dumb Friends League",
                            address:  "1820 S Quebec St",
                            city:     "Denver",
                            state:    "CO",
                            zip:      "80231")


@shelter_2 = Shelter.create(name:     "Peace, Love, Paws",
                            address:  "1280 Vine St",
                            city:     "Denver",
                            state:    "CO",
                            zip:      "80206")

@shelter_3 = Shelter.create(name:     "Aurora Animal Shelter",
                            address:  "15750 E 32nd Ave",
                            city:     "Aurora",
                            state:    "CO",
                            zip:      "80011")

@shelter_4 = Shelter.create(name:     "Love Four Legged Friends",
                            address:  "123 Main St",
                            city:     "Superior",
                            state:    "CO",
                            zip:      "80222")


@pet_10 = Pet.create( image: "https://www.southbostonanimalhospital.com/hubfs/How-to-Get-Some-Sleep-When-Your-Pet-Keeps-You-Up-at-Night.jpg",
                      name:  "Pedro",
                      description: "Cuddly puppy looking for a furever home",
                      approximate_age: "<1",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)


@pet_11 = Pet.create( image: "https://d17fnq9dkz9hgj.cloudfront.net/breed-uploads/2018/09/dog-landing-hero-lg.jpg?bust=1536935129&width=1080",
                      name:  "Pirate",
                      description: "Super friendly, but a little cheeky",
                      approximate_age: "4",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_1 = Pet.create(  image: "https://i.imgur.com/uQ7WVLL.jpg",
                      name:  "Huxley",
                      description: "Sweet senior dog",
                      approximate_age: "18",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)


@pet_2 = Pet.create(  image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2016/05/19091354/Weimaraner-puppy-outdoors-with-bright-blue-eyes.20190813165758508-1.jpg",
                      name:  "Rocco",
                      description: "Very good with kids and other animals",
                      approximate_age: "6",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)

@pet_3 = Pet.create(  image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo",
                      name:  "Sage",
                      description: "Adopt me I'm a cuddle bug",
                      approximate_age: "2",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_4 = Pet.create(  image: "https://d1941uuft27pfg.cloudfront.net/breed-uploads/2018/08/akita-card-medium.jpg?bust=1535569354",
                      name:  "Natalie",
                      description: "Stays to herself except when you have treats",
                      approximate_age: "4",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_4.id)

@pet_5 = Pet.create(  image: "https://cdn.mos.cms.futurecdn.net/QjuZKXnkLQgsYsL98uhL9X.jpg",
                      name:  "Furball",
                      description: "Very energetic",
                      approximate_age: "4",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_6 = Pet.create(  image: "https://i0.wp.com/cdn-prod.medicalnewstoday.com/content/images/articles/327/327387/cat-playing-with-toy.jpg?w=1155&h=1734",
                      name:  "Sphinx",
                      description: "Sweet and loving",
                      approximate_age: "8",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_2.id)

@pet_7 = Pet.create(  image: "https://images.immediate.co.uk/production/volatile/sites/4/2018/12/GettyImages-918529586-35c7227.jpg?quality=90&crop=61px%2C468px%2C7710px%2C3317px&resize=960%2C408",
                      name:  "Chance",
                      description: "Give me a chance",
                      approximate_age: "3",
                      sex: "Male",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_3.id)

@pet_9 = Pet.create(  image: "https://dcist.com/wp-content/uploads/sites/3/2020/02/wilford_newsletter.jpg",
                      name:  "Tuna",
                      description: "I'm just big boned",
                      approximate_age: "5",
                      sex: "Female",
                      adoption_status: "adoptable",
                      shelter_id: @shelter_1.id)


@review1 = @shelter_2.reviews.create( title: "Such caring staff!",
                                        rating: "5",
                                        content: "Everyone is so caring and nice here. Made my adoption process super easy ",
                                        picture: 'https://www.michiganhumane.org/wp-content/uploads/2018/02/Adopt-a-Pet-e1564001391162.jpg')

@review1 = @shelter_3.reviews.create( title: "Very nice shelter!",
                                      rating: "4",
                                      content: "Shelter is super clean and the animals look very well taken care of.",
                                      picture: 'https://weigel-streaming-video.s3.amazonaws.com/cbs58news/sunday%20pandemic%20pets_1588972825-CBS58%20480x270.jpg?1588973077')

@review1 = @shelter_4.reviews.create( title: "It was ok",
                                      rating: "3",
                                      content: "This shelter needs to be inspected. The cleanliness is below average. Staff are never around.",)

@application_1 = Application.create(name:  "Ash",
                                    address: "123 S Quebec Way",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80231",
                                    phone: "720-867-5309",
                                    description: "I am looking for a companion for my senior dog")

@application_2 = Application.create(name:  "Taylor",
                                    address: "123 Main St",
                                    city: "Superior",
                                    state: "CO",
                                    zip: "80222",
                                    phone: "720-567-3737",
                                    description: "My house is ready for a fur buddy!")

@application_3 = Application.create(name:  "Aurora",
                                    address: "1717 S Broadway",
                                    city: "Denver",
                                    state: "CO",
                                    zip: "80211",
                                    phone: "303-355-4497",
                                    description: "Want to get a buddy to share the lockdown with.")

PetApplication.create(pet_id: @pet_2.id, application_id: @application_1.id)
PetApplication.create(pet_id: @pet_7.id, application_id: @application_2.id)
PetApplication.create(pet_id: @pet_4.id, application_id: @application_3.id)

puts "Created #{Shelter.count} Shelters"
puts "Created #{Pet.count} Pets"
puts "Created #{Review.count} Reviews"
puts "Created #{Application.count} Applications"
