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
  "LoopedIn"]

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

  users = usernames.shuffle.take(14).map do |username|
    User.create!(
      email: Faker::Internet.unique.email,
      password: "password",
      username: username
    )
  end

  10.times do |i|
    user = users.sample

    post_title = post_titles.sample
    post_content = post_contents.sample

    post = Post.new(
      title: post_title,
      content: post_content,
      user: user
    )

    file = URI.parse(upload_images[i % upload_images.length]).open
    post.image.attach(io: file, filename: "post_image_#{i}.jpg", content_type: "image/jpeg")
    post.save

    3.times do
      commenter = users.reject { |u| u == user }.sample
      Comment.create!(
        content: comment.sample,
        user: commenter,
        post: post
      )
    end
  end

  # Create chats and messages
  User.all.each do |user|
    sender = user
    recipient = users.reject { |u| u == sender }.sample
    chat = Chat.create(title: post_titles.sample)

    Membership.create(user: sender, chat: chat)
    Membership.create(user: recipient, chat: chat)

    # Create messages in each chat
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
  end

  puts "Database seeded successfully!"
