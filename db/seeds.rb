User.create! email: "matt@futureworkshops.com", password: "London123"

Category.create(:name => "Minions")
Category.create(:name => "Scooby Doo")
Category.create(:name => "Tom & Jerry")
Category.create(:name => "Animaniacs")
Category.create(:name => "Mickey Mouse")
Category.create(:name => "Choo choo train")

Video.create! youtube_id: "KKYXpcbdgFc", name: "Minions Home alone", category_id: 1
Video.create! youtube_id: "-nPAZMgZVVU", name: "Minions Inception", category_id: 1
Video.create! youtube_id: "turCnCROps8", name: "Minions Parkour fails", category_id: 1
Video.create! youtube_id: "qc1d1gGKz34", name: "Minions in Mission Impossible", category_id: 1
Video.create! youtube_id: "nMhBUZi_gC0", name: "Minions Batman vs Joker", category_id: 1
Video.create! youtube_id: "xbwsOZqFJGo", name: "Scooby Doo The Ghastly Gost Town", category_id: 2
Video.create! youtube_id: "DDVddlcBQwA", name: "Scooby Doo The Dynamic", category_id: 2
Video.create! youtube_id: "EfYZch65KZM", name: "Scooby Doo Wednesday is missing", category_id: 2
Video.create! youtube_id: "3DD2nYAZCxQ", name: "Scooby Doo Stagefright", category_id: 2
Video.create! youtube_id: "mwUQLDMCorE", name: "Scooby Doo On Zombie Island", category_id: 2
Video.create! youtube_id: "UaX3hvrZDJA", name: "Tom & Jerry The truce hurts", category_id: 3
Video.create! youtube_id: "pFyf6WIFJ5k", name: "Tom & Jerry A mouse in the house", category_id: 3
Video.create! youtube_id: "xb8jTvSwJbw", name: "Tom & Jerry The invisible mouse", category_id: 3
Video.create! youtube_id: "ctD7_vGvs-o", name: "Tom & Jerry Kitty foiled", category_id: 3
Video.create! youtube_id: "l6Hfk13LZIQ", name: "Tom & Jerry Old rockin'chair Tom", category_id: 3
Video.create! youtube_id: "iIprJoPTJoI", name: "Tom & Jerry Profressor Tom", category_id: 3
Video.create! youtube_id: "a52K3IpoFmw", name: "Animaniacs  Yakko's World", category_id: 4
Video.create! youtube_id: "bWG5BMpbud0", name: "Animaniacs  Flipper Parody", category_id: 4
Video.create! youtube_id: "F5MYe0S6ts0", name: "Animaniacs Piano Rag", category_id: 4
Video.create! youtube_id: "RD6WOLJa2pw", name: "The Warner's Lot Song", category_id: 4
Video.create! youtube_id: "4D7f_7XmCU8", name: "Animaniacs King Yakko", category_id: 4
Video.create! youtube_id: "p7O22GuSc58", name: "Mickey Mouse  Split decision", category_id: 5
Video.create! youtube_id: "59ce67U9Gc", name: "Mickey Mouse No reservations", category_id: 5
Video.create! youtube_id: "9QOPF1QsbqA", name: "Mickey Mouse Entombed", category_id: 5
Video.create! youtube_id: "kbNtuBdUyHo", name: "Mickey Mouse Sock burglar", category_id: 5
Video.create! youtube_id: "ypnKKwlE670", name: "Mickey Mouse Turkish delights", category_id: 5
Video.create! youtube_id: "ia6HHxWECy0", name: "Choo Choo Train Days of the week", category_id: 6
Video.create! youtube_id: "6F8JjEV3brY", name: "Choo Choo Train Count to 10", category_id: 6
Video.create! youtube_id: "NoT1hTUVqn4", name: "Choo Choo Train ABC Song", category_id: 6
Video.create! youtube_id: "-w4_GEBssw", name: "Choo Choo Train Shapes for kids", category_id: 6
Video.create! youtube_id: "Z_4RLIFImJI", name: "Choo Choo Train Christmas movie", category_id:6

