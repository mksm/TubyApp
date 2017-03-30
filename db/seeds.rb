User.create! email: "matt@futureworkshops.com", password: "London123"

Channel.create(name: "Minions", name_ar: "التوابع", youtube_id:"UCGKsN-_fdd9P7AaQwszUH1w")
Channel.create(:name => "Scooby Doo", youtube_id:"UCrbj1z8JiFdh1yrYmLVmPgA")
Channel.create(:name => "Tom & Jerry", youtube_id:"UCTcTCMLHt-_GzjnSOlLrcNg")
Channel.create(:name => "Animaniacs", youtube_id:"UCBNLYXca3oqvRoWpwwPW9Ww")
Channel.create(:name => "Mickey Mouse", youtube_id:"UC000O8HnBpXB87thT2EKNfQ")
Channel.create(:name => "Choo choo train", youtube_id:"UCb8Mv1hodthGCF754hsAoXQ")

Video.create! youtube_id: "KKYXpcbdgFc", name: "Minions Home alone", channel_id: 1
Video.create! youtube_id: "-nPAZMgZVVU", name: "Minions Inception", channel_id: 1
Video.create! youtube_id: "turCnCROps8", name: "Minions Parkour fails", channel_id: 1
Video.create! youtube_id: "qc1d1gGKz34", name: "Minions in Mission Impossible", channel_id: 1
Video.create! youtube_id: "nMhBUZi_gC0", name: "Minions Batman vs Joker", channel_id: 1
Video.create! youtube_id: "xbwsOZqFJGo", name: "Scooby Doo The Ghastly Gost Town", channel_id: 2
Video.create! youtube_id: "DDVddlcBQwA", name: "Scooby Doo The Dynamic", channel_id: 2
Video.create! youtube_id: "EfYZch65KZM", name: "Scooby Doo Wednesday is missing", channel_id: 2
Video.create! youtube_id: "3DD2nYAZCxQ", name: "Scooby Doo Stagefright", channel_id: 2
Video.create! youtube_id: "mwUQLDMCorE", name: "Scooby Doo On Zombie Island", channel_id: 2
Video.create! youtube_id: "UaX3hvrZDJA", name: "Tom & Jerry The truce hurts", channel_id: 3
Video.create! youtube_id: "pFyf6WIFJ5k", name: "Tom & Jerry A mouse in the house", channel_id: 3
Video.create! youtube_id: "xb8jTvSwJbw", name: "Tom & Jerry The invisible mouse", channel_id: 3
Video.create! youtube_id: "ctD7_vGvs-o", name: "Tom & Jerry Kitty foiled", channel_id: 3
Video.create! youtube_id: "l6Hfk13LZIQ", name: "Tom & Jerry Old rockin'chair Tom", channel_id: 3
Video.create! youtube_id: "iIprJoPTJoI", name: "Tom & Jerry Profressor Tom", channel_id: 3
Video.create! youtube_id: "a52K3IpoFmw", name: "Animaniacs  Yakko's World", channel_id: 4
Video.create! youtube_id: "bWG5BMpbud0", name: "Animaniacs  Flipper Parody", channel_id: 4
Video.create! youtube_id: "F5MYe0S6ts0", name: "Animaniacs Piano Rag", channel_id: 4
Video.create! youtube_id: "RD6WOLJa2pw", name: "The Warner's Lot Song", channel_id: 4
Video.create! youtube_id: "4D7f_7XmCU8", name: "Animaniacs King Yakko", channel_id: 4
Video.create! youtube_id: "p7O22GuSc58", name: "Mickey Mouse  Split decision", channel_id: 5
Video.create! youtube_id: "59ce67U9Gc", name: "Mickey Mouse No reservations", channel_id: 5
Video.create! youtube_id: "9QOPF1QsbqA", name: "Mickey Mouse Entombed", channel_id: 5
Video.create! youtube_id: "kbNtuBdUyHo", name: "Mickey Mouse Sock burglar", channel_id: 5
Video.create! youtube_id: "ypnKKwlE670", name: "Mickey Mouse Turkish delights", channel_id: 5
Video.create! youtube_id: "ia6HHxWECy0", name: "Choo Choo Train Days of the week", channel_id: 6
Video.create! youtube_id: "6F8JjEV3brY", name: "Choo Choo Train Count to 10", channel_id: 6
Video.create! youtube_id: "NoT1hTUVqn4", name: "Choo Choo Train ABC Song", channel_id: 6
Video.create! youtube_id: "-w4_GEBssw", name: "Choo Choo Train Shapes for kids", channel_id: 6
Video.create! youtube_id: "Z_4RLIFImJI", name: "Choo Choo Train Christmas movie", channel_id:6
