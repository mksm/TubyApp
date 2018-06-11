def seed_channels_and_videos
  c1 = Channel.create(name: "Minions", name_ar: "التوابع", youtube_id:"UCGKsN-_fdd9P7AaQwszUH1w")
  c2 = Channel.create(:name => "Scooby Doo", youtube_id:"UCrbj1z8JiFdh1yrYmLVmPgA")
  c3 = Channel.create(:name => "Tom & Jerry", youtube_id:"UCTcTCMLHt-_GzjnSOlLrcNg")
  c4 = Channel.create(:name => "Animaniacs", youtube_id:"UCBNLYXca3oqvRoWpwwPW9Ww")
  c5 = Channel.create(:name => "Mickey Mouse", youtube_id:"UC000O8HnBpXB87thT2EKNfQ")
  c6 = Channel.create(:name => "Choo choo train", youtube_id:"UCb8Mv1hodthGCF754hsAoXQ")

  Video.create! youtube_id: "KKYXpcbdgFc", name: "Minions Home alone", channel: c1
  Video.create! youtube_id: "-nPAZMgZVVU", name: "Minions Inception", channel: c1
  Video.create! youtube_id: "turCnCROps8", name: "Minions Parkour fails", channel: c1
  Video.create! youtube_id: "qc1d1gGKz34", name: "Minions in Mission Impossible", channel: c1
  Video.create! youtube_id: "nMhBUZi_gC0", name: "Minions Batman vs Joker", channel: c1
  Video.create! youtube_id: "xbwsOZqFJGo", name: "Scooby Doo The Ghastly Gost Town", channel: c2
  Video.create! youtube_id: "DDVddlcBQwA", name: "Scooby Doo The Dynamic", channel: c2
  Video.create! youtube_id: "EfYZch65KZM", name: "Scooby Doo Wednesday is missing", channel: c2
  Video.create! youtube_id: "3DD2nYAZCxQ", name: "Scooby Doo Stagefright", channel: c2
  Video.create! youtube_id: "mwUQLDMCorE", name: "Scooby Doo On Zombie Island", channel: c2
  Video.create! youtube_id: "UaX3hvrZDJA", name: "Tom & Jerry The truce hurts", channel: c3
  Video.create! youtube_id: "pFyf6WIFJ5k", name: "Tom & Jerry A mouse in the house", channel: c3
  Video.create! youtube_id: "xb8jTvSwJbw", name: "Tom & Jerry The invisible mouse", channel: c3
  Video.create! youtube_id: "ctD7_vGvs-o", name: "Tom & Jerry Kitty foiled", channel: c3
  Video.create! youtube_id: "l6Hfk13LZIQ", name: "Tom & Jerry Old rockin'chair Tom", channel: c3
  Video.create! youtube_id: "iIprJoPTJoI", name: "Tom & Jerry Profressor Tom", channel: c3
  Video.create! youtube_id: "a52K3IpoFmw", name: "Animaniacs  Yakko's World", channel: c4
  Video.create! youtube_id: "bWG5BMpbud0", name: "Animaniacs  Flipper Parody", channel: c4
  Video.create! youtube_id: "F5MYe0S6ts0", name: "Animaniacs Piano Rag", channel: c4
  Video.create! youtube_id: "RD6WOLJa2pw", name: "The Warner's Lot Song", channel: c4
  Video.create! youtube_id: "4D7f_7XmCU8", name: "Animaniacs King Yakko", channel: c4
  Video.create! youtube_id: "p7O22GuSc58", name: "Mickey Mouse  Split decision", channel: c5
  Video.create! youtube_id: "59ce67U9Gc", name: "Mickey Mouse No reservations", channel: c5
  Video.create! youtube_id: "9QOPF1QsbqA", name: "Mickey Mouse Entombed", channel: c5
  Video.create! youtube_id: "kbNtuBdUyHo", name: "Mickey Mouse Sock burglar", channel: c5
  Video.create! youtube_id: "ypnKKwlE670", name: "Mickey Mouse Turkish delights", channel: c5
  Video.create! youtube_id: "ia6HHxWECy0", name: "Choo Choo Train Days of the week", channel: c6
  Video.create! youtube_id: "6F8JjEV3brY", name: "Choo Choo Train Count to 10", channel: c6
  Video.create! youtube_id: "NoT1hTUVqn4", name: "Choo Choo Train ABC Song", channel: c6
  Video.create! youtube_id: "-w4_GEBssw", name: "Choo Choo Train Shapes for kids", channel: c6
  Video.create! youtube_id: "Z_4RLIFImJI", name: "Choo Choo Train Christmas movie", channel: c6  
end

User.create! email: "matt@futureworkshops.com", password: "London123"

#seed_channels_and_videos

