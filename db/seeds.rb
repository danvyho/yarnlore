# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "faker"
require "open-uri"
require "json"

Following.destroy_all
Notification.destroy_all
Favorite.destroy_all
PostLike.destroy_all
Post.destroy_all
Comment.destroy_all
Message.destroy_all
Membership.destroy_all
Chat.destroy_all
User.destroy_all


ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('posts')
ActiveRecord::Base.connection.reset_pk_sequence!('comments')
ActiveRecord::Base.connection.reset_pk_sequence!('chats')
ActiveRecord::Base.connection.reset_pk_sequence!('messages')
ActiveRecord::Base.connection.reset_pk_sequence!('comment_likes')
ActiveRecord::Base.connection.reset_pk_sequence!('post_likes')
ActiveRecord::Base.connection.reset_pk_sequence!('memberships')

upload_images = [
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104604/pexels-pavel-danilyuk-5788198_boq8ad.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104601/pexels-anete-lusina-6354079_xvsptu.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104598/pexels-kpaukshtite-2731820_kqhlz9.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104595/pexels-cottonbro-10676001_dydrwy.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104591/pexels-rahimegul-29889876_pojo5f.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104588/pexels-kseniachernaya-5807052_uhnfu5.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104585/pexels-kseniachernaya-5806996_ftv6js.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104580/pexels-anj-namoro-1479642-2850487_tditfp.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104577/pexels-miriam-alonso-7585566_ufnt5g.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104574/pexels-pavel-danilyuk-6667981_geacdt.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104572/pexels-cottonbro-5585246_yegpjw.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104568/pexels-myfoodie-2557040_zklnxi.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104563/pexels-pavel-danilyuk-5788306_fmwjy6.jpg",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741104555/pexels-yankrukov-6615584_b6zapm.jpg",
]

avatar_images = [
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741615237/woman_xn7owh.png",
 "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615236/boy_xhwf6m.png",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615237/man_ia2qlg.png",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615236/man_1_fhxhdb.png",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615236/man_2_zvdqyw.png",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615630/woman_2_jtn0xn.png",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615630/avatar_uuvbnh.png",
  "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615629/teacher_u8b5df.png"
]

usernames = [
  "KnitterQueen",
  "YarnMaster",
  "CrochetGuru",
  "WoolWhiz",
  "ThreadTrekker",
  "FiberFanatic",
  "HookedOnYarn",
  "StitchSavant",
  "KnitAndPurl",
  "WoolWanderer",
  "CraftyThreads",
  "YarnVoyager",
  "TwistAndKnit",
  "LoopedIn"
]

  comment = [
    "Beautiful and easy-to-follow pattern! The instructions were clear, and my project turned out great.",
    "Loved this pattern! Perfect for beginners and works up quickly.",
    "A bit challenging at first, but the end result was worth it. Highly recommend for intermediate crafters!",
    "The stitch count was off in some places, but overall a nice design.",
    "Such a fun and creative pattern! I’ve already made two and plan to make more.",
    "Well-written and detailed instructions made this project a breeze!",
    "A stunning design, but I wish there were more step-by-step pictures.",
    "Absolutely gorgeous! I get so many compliments on my finished piece.",
    "This pattern is a must-have! Simple, elegant, and works up beautifully.",
    "I struggled with one section, but the designer was super helpful in clarifying.",
    "Perfect for gifting! The finished item looks so professional.",
    "I modified the sizing a bit, but otherwise, the pattern was flawless.",
    "Great for using up scrap yarn! Will definitely be making this again.",
    "This has become my go-to pattern! Easy to memorize and very satisfying to complete."
  ]

  messages = [
    "Hey! How’s your day going? 😊",
    "Did you see that new pattern drop? It’s amazing! 😍",
    "I need your advice on a yarn color—help!",
    "Omg, I just finished my project! Wanna see? 🤩",
    "Guess what? I found the perfect yarn for that pattern we talked about!",
    "Can we reschedule our call? Something came up!",
    "I just frogged an entire section… send emotional support. 😭",
    "Your latest project looks incredible! How long did it take?",
    "Late-night crochet session again? 😂",
    "I saw a pattern that screamed your name! Sending it now.",
    "Hope you’re doing okay—haven’t heard from you in a bit. 💕",
    "Wanna do a yarn haul together this weekend?",
    "I just got my package! Can’t wait to start this new project!",
    "You HAVE to try this new stitch technique I just learned!"
  ]
  collection_titles = [
    "Knitting Patterns",
    "Crochet Patterns",
    "Yarn Types",
    "Knitting Techniques",
    "Crochet Techniques",
    "Free Patterns",
    "Advanced Patterns",
    "Beginner Patterns",
    "Seasonal Projects",
    "Accessories",
    "Garments",
    "Home Decor",
    "Amigurumi",
    "Gift Ideas"]

notifications = [
  "Alex liked your post. 👍",
  "Emma just gave your post a thumbs up!",
  "You’ve got a new like! Chris enjoyed your post.",
  "Wow! Taylor liked your post. Keep sharing great content!",
  "Your post caught Jordan’s eye – they liked it!",
  "A new fan of your post! Sam just hit like.",
  "Nice! Riley liked what you shared.",
  "Liam thinks your post is awesome! They gave it a like.",
  "Your post is getting attention! Avery just liked it.",
  "Another like for you! Casey appreciates your post.",
  "Morgan liked your post. Looks like it’s a hit!",
  "Dylan enjoyed your content – they just liked your post!",
  "Your post got some love! Jamie hit the like button.",
  "Keep it up! Cameron liked your post.",
]

  post_titles = [
    "Cozy Knit Sweater for Chilly Days",
    "Simple and Stylish Knit Beanie Pattern",
    "Vibrant Spring Crochet Flower Shawl",
    "Classic Cable Knit Blanket for the Home",
    "Boho-Inspired Crochet Tote Bag",
    "Lacy Knit Scarf for Elegant Outfits",
    "Chunky Knit Throw Blanket for Comfort",
    "Warm and Comfy Knitted Slippers",
    "Crochet Coasters to Brighten Up Your Space",
    "Light and Breezy Crochet Shawl for Summer",
    "Sleek and Stylish Knit Fingerless Gloves",
    "Bohemian Crochet Wall Hanging",
    "Soft Baby Booties for the Little One",
    "Knitted Sweater Perfect for Layering"
  ]

bios = [
  "Crochet enthusiast creating cozy designs and exploring new patterns.",
  "Knit designer experimenting with colors and textures in my projects.",
  "Collecting and sharing my favorite knitting and crochet patterns.",
  "Yarn lover sharing discoveries and tracking my projects.",
  "New to crochet, looking for easy patterns and helpful tips.",
  "Creating wearable art with yarn and always seeking new patterns.",
  "Knitting to unwind and crocheting to express creativity.",
  "Making cozy, functional crochet and knit pieces for my home.",
  "Working through my yarn stash while discovering new patterns.",
  "Curating knitting and crochet collections for all skill levels.",
  "Testing patterns and offering feedback to designers.",
  "Obsessed with yarn and finding the perfect pattern.",
  "Specializing in custom crochet and knit projects that reflect my style.",
  "Exploring new stitches and techniques in both knitting and crochet."
]

  post_contents = [
    "This cozy knit sweater pattern is perfect for chilly days. It’s warm, stylish, and easy to follow. Perfect for beginners and seasoned crafters alike!",
    "This simple yet stylish knit beanie pattern is a must-try. It’s quick, easy, and perfect for those last-minute gift ideas!",
    "A vibrant spring crochet shawl pattern that's perfect for the warmer months. Lightweight, breezy, and the perfect accessory to add a pop of color to your wardrobe.",
    "This classic cable knit blanket pattern brings elegance and comfort to any home. Perfect for relaxing on the couch with a good book or movie.",
    "This boho-inspired crochet tote bag is perfect for casual outings. With a unique design, it’s spacious and fashionable.",
    "The lacy knit scarf adds a touch of elegance to any outfit. The instructions are clear and easy to follow, making it a perfect project for crafters of all levels.",
    "Create a cozy, chunky knit throw blanket that’s perfect for your sofa or bed. This pattern is easy to follow and will make a beautiful addition to your home decor.",
    "These knitted slippers are warm, comfy, and perfect for lounging at home. The pattern is beginner-friendly and works up quickly.",
    "These crochet coasters are an easy and fun project that will brighten up any space. Perfect for adding a handmade touch to your table setting.",
    "This light and breezy crochet shawl is perfect for summer evenings. Its lightweight texture makes it ideal for layering over any outfit.",
    "These sleek and stylish knit fingerless gloves are perfect for when you need warmth but still want to use your hands. The pattern is easy to memorize and quick to make.",
    "A beautiful bohemian crochet wall hanging that will add texture and character to any room. It’s a fun and unique project that’s both decorative and functional.",
    "These soft crochet baby booties are a perfect gift for a newborn. The pattern is simple and works up quickly, making it a perfect project for beginners.",
    "This knitted sweater pattern is perfect for layering. It's comfortable, stylish, and versatile, making it a wardrobe essential for any season."
  ]


    pattern_title = [
      "Basic sweater", "After school sweater", "Djo", "Step by Step Sweater", "Waffle Pullover", "Bee Leaf Hat",
      "6090 Sweater and Jacket", "Blushing Frog", "Round Raccoon", "Unfair Carousel", "Eloisa Vest", "Collin Scarf",
      "Embers Shawl", "Bow Square", "Baby Chick Mini Palm Plushie"
    ]

    pattern_content = [ "Cast on 120 stitches (48 for the body, 24 for each sleeve). Join in the round.
Increase every other round until the body has 72 stitches and each sleeve has 36 stitches.
Knit the body until it reaches your desired length (12-16 inches), adding ribbing at the hem if you want.
Pick up the stitches for the sleeves, then knit them to your desired length (15-20 cm), adding ribbing at the cuffs if you want.
Weave in the ends and block the sweater.",
"Cast on the required number of stitches for the body and sleeves.
Knit the body in stockinette stitch.
Knit the sleeves and adjust for fit.
Join the body and sleeves, knit the yoke, and finish with ribbing.",
"Cast on stitches, incorporating colourwork into the design.
Knit the body with colourwork pattern, adjusting to your size.
Knit the sleeves in the colourwork pattern.
Join body and sleeves, continue colourwork for yoke, and finish with ribbing.",
"Cast on the required stitches for the body.
Knit the body in the round until you reach the desired length.
Knit the sleeves, adjusting for fit.
Join body and sleeves, knit the yoke, and finish with ribbing.",
"Cast on the stitches based on your size and begin with the mosaic pattern.
Knit the body in the round following the mosaic pattern.
Knit the sleeves, incorporating the mosaic stitch.
Join body and sleeves, continue with the pattern, and finish with ribbing.",
"Cast on stitches for the brim in ribbing.
Knit the body of the hat in rib 1x1 stitch.
Shape the crown by decreasing.
Finish with a ribbed cuff and bind off.",
"Cast on the required number of stitches for the body.
Knit the body in stocking stitch to the desired length.
Knit the sleeves in stocking stitch.
Join body and sleeves, knit the yoke, and finish with ribbing.",
"Create the frog's body using the magic ring method.
Crochet the limbs and attach them to the body.
Crochet the eyes and attach them to the head.
Stuff the frog and finish by closing up any openings.",
"Start by crocheting the head in the round.
Create the body and limbs, attach them to the head.
Crochet the tail and ears, then attach them.
Stuff the raccoon and finish closing any gaps.",
"Cast on the required stitches for the body.
Knit the body in the round until you reach the desired length.
Knit the sleeves, adjusting to fit.
Join body and sleeves, knit the yoke, and finish with ribbing.",
"Cast on the stitches for the body and knit in garter stitch.
Knit the body until it reaches your desired length.
Knit the sides of the vest and attach them.
Finish with ribbing at the neck and armholes.",
"Cast on the required number of stitches for the scarf.
Knit the scarf in the desired stitch pattern (e.g., garter, stockinette).
Knit until the scarf reaches your desired length.
Bind off and weave in the ends.",
"Cast on stitches for the shawl.
Knit the shawl in your preferred stitch pattern.
Shape the shawl by decreasing and increasing as needed.
Finish with a simple border and weave in the ends.",
"Start with a foundation chain and work the first row.
Crochet the bow design in the center of the square.
Continue crocheting the square to the desired size.
Finish by adding a border around the square.",
"Create the body using the magic ring method.
Crochet the limbs and attach them to the body.
Crochet the beak and eyes, then attach them.
Stuff the chick and finish by closing any openings.",



    ]


    pattern_craft = [
      "Knitting", "Knitting", "Knitting", "Knitting", "Knitting", "Knitting",
      "Knitting", "Crochet", "Crochet", "Knitting", "Knitting", "Knitting", "Knitting", "Crochet", "Crochet"
    ]

    pattern_category = [
      "Sweater/Pullover", "Sweater/Pullover", "Sweater/Pullover", "Sweater/Pullover", "Sweater/Pullover",
      "Hat/Beanie/Toque", "Sweater/Pullover", "Softies/Animals", "Softies/Animals", "Sweater/Pullover",
      "Vest", "Neck/Torso/Scarf", "Neck/Torso", "Afghan Block", "Softies/Animals"
    ]

    pattern_weight = [
      "Worsted (9 wpi)", "Worsted (9 wpi)", "Sport (12 wpi)", "Aran (8wpi)", "DK (11 wpi)", "Worsted (9wpi)",
      "DK (11 wpi)", "Bulky (7 wpi)", "Aran (9 wpi)", "DK (11 wpi)", "DK (11 wpi)", "Sport (12 wpi)",
      "Fingering (14 wpi)", "Aran (8 wpi)", "Super Bulky (5-6 wpi)"
    ]

    pattern_gauge  = [
      "21 stitches and 30 rows = 10 cm in 21x30", "18 stitches and 26 rows = 10 cm
      in stockinette stitch", "20 stitches and 26 rows = 10 cm in Colourwork",
      "16 stitches and 20 rows = 10 cm", "21 stitches and 40 rows = 10 cm in mosaic pattern",
      "24 stitches and 30 rows = 10 cm in Rib 1x1", "22 stitches and 28 rows = 10 cm in stocking stitch",
      "/", "15 stitches and 15 rows = 10 cm", "21 stitches and 28 rows = 10 cm", "18 stitches and 30 rows = 10 cm",
      "22 stitches and 37 rows = 10 cm in Garter stitch", "22 stitches and 32 rows = 10 cm", "/", "/"
    ]
    needle_size = [
      "US 6 - 4.0 mm", "US 6 - 4.0 mm", "US 6 - 4.0 mm", "US 9 - 5.5 mm", "US 7 - 4.5 mm", "US 6 - 4.0 mm",
      "US 6 - 4.0 mm", "/", "US 000 - 1.5 mm", "US 6 - 4.0 mm", "US 4 - 3.5 mm", "US 6 - 4.0 mm", "US 5 - 3.75 mm", "/", "/"
    ]

    pattern_images = [
      "https://res.cloudinary.com/ducax2ucs/image/upload/v1741624934/20250213_112603_small2_vgmrzw.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624931/IMG_9446_small2_tfe7vq.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624928/IMG_8900-2_small2_yobdqq.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624925/Image_2__small2_k0hryo.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624922/MDK-FG29-Mosaic-WafflePullover-Modeled-1-800_small2_hci8w7.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624918/15_small2_bnv0jh.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624915/6090_FR_small2_rqorh6.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624912/IMG_3102_small2_ytbbbf.png",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741625024/MainView_small_m5aaw2.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741624909/Carousel_Jumper_Front_Jo_Davies_small_llrcry.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741631793/Eloisa-Vest-06a-Craftrebella_small2_xi3poz.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741631792/story_1698165303805_edit_699012711724586_small2_pbnzdo.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741631791/IMG_4294_small2_hsgiow.jpg",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741631791/2_small2_dmjyfp.png",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741631790/IMG_9379_small2_vtvgpv.jpg"
    ]



User.create(
  email: 'a@a.a',
  password: "123456",
  username: 'jasper'
)

  users = usernames.shuffle.take(14).map do |username|
    user = User.create!(
      email: Faker::Internet.unique.email,
      password: "password",
      username: username,
      bio: bios.sample
    )

      avatar_url = avatar_images.sample
      file = URI.open(avatar_url)
      user.avatar.attach(io: file, filename: "avatar_#{user.id}.jpg", content_type: "image/jpeg")

    user
  end

  10.times do |i|
    user = users.sample

    post_title = post_titles.sample
    post_content = post_contents.sample

    post = Post.new(
      title: post_title,
      content: post_content,
      user: user,
      pattern: false
    )


    file = URI.parse(upload_images[i % upload_images.length]).open
    post.image.attach(io: file, filename: "post_image_#{i}.jpg", content_type: "image/jpeg")
    post.save!

    3.times do
      commenter = users.reject { |u| u == user }.sample
      Comment.create!(
        content: comment.sample,
        user: commenter,
        post: post
      )
    end
  end
  for i in 0..14
    user = users.sample
    pattern = Post.new(
      title: pattern_title[i],
      content: pattern_content[i],
      craft: pattern_craft[i],
      category: pattern_category[i],
      gauge: pattern_gauge[i],
      yarn_weight: pattern_weight[i],
      needle_size: needle_size[i],
      pattern: true,
      user: user
    )

    file = URI.parse(pattern_images[i % pattern_images.length]).open
    pattern.image.attach(io: file, filename: "pattern_image_#{i}.jpg", content_type: "image/jpeg")
    pattern.save!
  end
  User.all.each do |user|
    sender = user
    recipient = users.reject { |u| u == sender }.sample
    chat = Chat.create(title: post_titles.sample)


    Membership.create(user: sender, chat: chat)
    Membership.create(user: recipient, chat: chat)

    3.times do
      Message.create!(
        content: messages.sample,
        user: sender,
        chat: chat
      )
      Message.create!(
      content: messages.sample,
      user: recipient,
      chat: chat
    )
    end

    3.times do
      Notification.create!(
        user: user,
        post: Post.first,
        content: notifications.sample
      )
    end
  end

  Following.create(
    follower: User.first,
    followee: User.second
  )
  puts "Database seeded successfully!"
