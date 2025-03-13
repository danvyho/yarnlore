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
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615630/avatar_uuvbnh.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615629/teacher_u8b5df.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741879271/wild-boar_ad3yql.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741879271/girl_fl4p1n.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741879271/woman_3_hhz3tv.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741879271/gamer_acd6rw.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615630/cat_yapnbh.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615235/chicken_qe1kib.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615235/woman_1_rxlwra.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615629/empathy_kehgo9.png",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1741615235/human_j7dhn5.png"
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

notifications = [
  "KnitterQueen liked your post. 👍",
  "YarnMaster just gave your post a thumbs up!",
  "You’ve got a new like! CrochetGuru enjoyed your post.",
  "Wow! WoolWhiz liked your post. Keep sharing great content!",
  "Your post caught ThreadTrekker’s eye – they liked it!",
  "A new fan of your post! FiberFanatic just hit like.",
  "Nice! HookedOnYarn liked what you shared.",
  "StitchSavant thinks your post is awesome! They gave it a like.",
  "Your post is getting attention! KnitAndPurl just liked it.",
  "Another like for you! WoolWanderer appreciates your post.",
  "CraftyThreads liked your post. Looks like it’s a hit!",
  "YarnVoyager enjoyed your content – they just liked your post!",
  "Your post got some love! TwistAndKnit hit the like button.",
  "Keep it up! LoopedIn liked your post."
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
post_titles = [
    "Simple Knitted Coaster",
    "Crochet Flower Shawl",
    "Crocheted Bunny for Baby",
    "Summer Crochet Shawl",
    "Beginner Crochet Coasters",
    "Cable Knit Blanket",
    "Boho Crochet Wall Hanging",
    "Knit Sweater for Layering",
    "Simple Crochet Square",
    "Stylish Knit Beanie",
    "Chunky Knit Throw",
    "Boho Crochet Tote Bag",
    "Cozy Knit Sweater",
    "Sleek Knit Mittens"
]

  post_contents = [
    "This lacy knit scarf adds such an elegant touch to any outfit! It’s easy to wear and easy to make—so proud of how it turned out! 💕🧶",
    "Spring vibes all the way with this crochet shawl! Lightweight, breezy, and the perfect pop of color for warmer days. Can’t wait to wear it! 🌸☀️",
    "These baby booties are the cutest little project! I’m so proud of how they turned out, and they’re the perfect gift for any newborn. 💖👶",
    "This crochet shawl is light and breezy, perfect for those summer evenings. I love how it layers over any outfit—can’t wait for the warmer weather! ☀️🌙",
    "These crochet coasters are the perfect touch for any table. Quick to make and such a fun little project. Can’t wait to show them off! ✨🍵",
    "This cable knit blanket is the ultimate comfort piece! Perfect for movie nights and lounging around. I’m so proud of how it looks! 🛋️📚",
    "This crochet wall hanging brings so much boho charm to my space! I’m so proud of how it turned out—it’s totally unique and functional! 🌸🧶",
    "This knitted sweater is my new favorite layering piece! Comfortable, stylish, and cozy—so proud of how it turned out! 🧶👗",
    "These knitted slippers are pure comfort! Warm and cozy—perfect for lounging around. I love how these turned out! 💖👣",
    "This knit beanie is so quick and cute! A perfect last-minute gift that’s both cozy and stylish. I’m loving how it turned out! 🎁🧣",
    "I’m in love with this chunky knit throw! It’s cozy, warm, and adds the perfect touch to any room. So happy with how it turned out! 🛋️✨",
    "This boho-inspired crochet tote bag is everything! It’s spacious, stylish, and perfect for casual outings. So happy with how it came together! 🌿👜",
    "Cozy up in this knit sweater! It's warm, stylish, and the perfect way to stay cozy on chilly days. So proud of how it turned out! 🧶✨",
    "These knit fingerless gloves are sleek and stylish, and they keep me warm while still letting me use my hands. I’m so proud of how they came out! 🧤💫"

  ]


    pattern_title = [
      "Basic sweater", "After school sweater", "Djo", "Step by Step Sweater", "Waffle Pullover", "Bee Leaf Hat",
      "6090 Sweater and Jacket", "Blushing Frog", "Round Raccoon", "Carousel Sweater", "Eloisa Vest", "Collin Scarf",
      "Embers Shawl", "Bow Square", "Baby Chick Mini Palm Plushie"
    ]

    pattern_content = [
"Cast on 120 stitches (48 for the body, 24 for each sleeve). Join in the round.
Increase every other round until the body has 72 stitches and each sleeve has 36 stitches.
Knit the body until it reaches your desired length (12-16 inches), adding ribbing at the hem if you want.
Pick up the stitches for the sleeves, then knit them to your desired length (15-20 cm), adding ribbing at the cuffs if you want.
Weave in the ends and block the sweater.",

"Cast on 100 (112) sts using the Long-tail Cast on method.
Place locking stitch markers 30 (35) sts from each edge.
(*Note: These markers show where you’ll pick up stitches for the front panels. Place them on the fabric, not on the needle.)

Back Panel:
Follow the [Cable Chart] for the back panel.

1. Row 1 (RS):
   - Knit the first 34 (40) sts.
   - Place a marker.
   - Work Row 1 of the [Cable Chart].
   - Place another marker.
   - Knit the remaining 34 (40) sts.

2. Row 2 (WS):
   - Purl to the first marker.
   - Slip marker.
   - Work Row 2 of the [Cable Chart].
   - Slip marker.
   - Purl to the end of the row.

3. Row 3 (RS):
   - Knit to the marker.
   - Slip marker.
   - Work Row 3 of the [Cable Chart].
   - Slip marker.
   - Knit to the end.

4. Row 4 (WS):
   - Purl to the marker.
   - Slip marker.
   - Work Row 4 of the [Cable Chart].
   - Slip marker.
   - Purl to the end.

5. Rows 5-6 (RS/WS):
   - Repeat Rows 5-6 from the [Cable Chart] until you have completed 48 (52) rows.
     (*Note: Size S will end on Row 8 of the chart, and Size M will end on Row 4.)

Finish:
- Break the yarn.
- Place all sts on a spare cable or stitch holder.",

"Ribbing: With B and smaller needles, cast on 13 sts. Work in garter st (knit every row) until Ribbing, when slightly stretched measures 22 (24-26- 29-32-34)[56 (61-66-73.5-81.5- 86.5) cm], noting 1st row is WS and ending on a WS row. Cast off knitwise.

Do not break B. Turn work sideways. With RS facing , smaller needles and B, pick up and knit 122 (132- 144-160-176-188) sts evenly across long edge of ribbing. Next row: (WS). Knit.

Change to larger needles and proceed as follows: 1st row: (RS). With B, K1. *Sl1Pwyib. K1. Rep from * to last st. K1. 2nd row: K1. *Sl1Pwyif K1. Rep from * to last st. K1. 3rd row: (RS). With MC, K1. *K1. Sl1Pwyib. Rep from *39 (43-47- 52-57-61) times more. With A, rep from * to last st. K1. 4th row: With A, K1. *K1. Sl1Pwyif. Rep from * 19 (20-22-25-28-30) times more. With MC, rep from * to last st. K1. Rep 1st to 4th rows for Tweed Pat until work from pick up row measures approx 7 [18 cm], ending on a 4th row. Proceed as follows: 1st row: (RS). With MC, K1. *Sl1Pwyib. K1. Rep from * 39 (43- 47-52-57-61) times more. With A, rep from * to last st. K1. 2nd row: With A, K1. *Sl1Pwyif. K1. Rep from * 19 (20-22-25-28-30) times more. With MC, rep from * to last st. K1. 3rd row: (RS). With A, K1. *K1. Sl1Pwyib. Rep from * to last st. K1. 4th row: K1. *K1. Sl1Pwyif. Rep from * to last st. K1.** Rep 1st to 4th rows for Tweed Pat until work from beg measures 19 (20-20-22-22-23) Cast off..",

"Cast on 64 (68, 72, 80) (84, 88, 88) stitches on 4.5mm 40cm circular needles using the longtail cast on. If you don’t use this cast on, make sure you are casting on loosely enough to get the collar over your head, and check you can once you have knitted a few centimetres. Join in the round and place a BOR marker to indicate the beginning of the round. Select one of the following neckline options. Option One: Funnel Neck Collar Work in rib (*k1 p1*, repeat *-* to end of round) until the collar measures 8cm from the cast on edge. Option Two: Folded Collar Work in rib (*k1 p1*, repeat *-* to end of round) until the collar measures 4cm from the cast on edge. P one round. Work in rib (*k1 p1*, repeat *-* to end of round) until the collar measures 8cm from the cast on edge. Now knit the live stitches together with the cast on edge. It may be helpful to check the video for help with this step. Yoke Switch to 5.5mm 40cm needles and knit one round while placing stitch markers as follows: k 11 (13, 15, 17) (18, 19, 19), place marker, k2, place marker, k 6 (4, 2, 2) (2, 2, 2), place marker, k2, place marker, k 22 (26, 30, 34) (36, 38, 38), place marker, k2, place marker, k 6 (4, 2, 2) (2, 2, 2), place marker, k2, place marker, k 11 (13, 15, 17) (18, 19, 19) to end of round. Choose whether or not to include the German short row neck shaping. For a total beginner, you may wish to exclude it. For an adventurous beginner or more experienced knitter, it may improve the fit around the neck. If you do choose to include the German short rows, when the pattern says to turn, make sure to follow the specific turning instructions in the German short row note earlier in the pattern.",


"Work as for back until armhole meas 4½ (5, 5½, 5¾, 6, 6¼, 6½), ending with WS Row 4 – 69 (79, 89, 95, 105, 115, 121) sts., Cont in Waffle St, work 20 (25, 28, 31, 36, 40, 43) sts in patt, join another ball of yarn and BO center 29 (29, 33, 33, 33, 33, 35, 35) sts, work in patt to end – 20 (25, 28, 31, 36, 40, 43) sts each side., Working each side with its own ball of yarn, BO 2 sts at each neck edge 2 times, then 1 st 2 times – 14 (19, 22, 25, 30, 34, 37) sts rem each side., Work even until armhole meas 7 (7½, 8, 8¼, 8½, 8¾, 9), ending with WS Row 2., With B, BO all sts knitwise., Sleeves With A, CO 41 (43, 43, 45, 45, 47, 47) sts., Work in 1 x 1 Rib for 2 (2, 2, 2½, 2½, 2½, 2½), ending with a WS row., Work in Waffle St for 1, ending with a WS row., Shape sleeve: Cont in Waffle St, and inc 1 st each edge every 10 (10, 8, 8, 8, 8, 6) rows 12 (8, 16, 10, 1, 1, 14) time(s), then every 8 (8, 6, 6, 6, 6, 6, 4) rows 3 (8, 2, 9, 19, 19, 7) times, working new sts into patt – 71 (75, 79, 83, 85, 87, 89) sts., Work even until pc meas 21 (21, 20, 20, 19, 19, 18) from beg, ending with WS Row 4., BO all sts knitwise., Finishing Lightly block pcs to measurements., Sew shoulder seams., Sew top of sleeve to armhole edges of body, then sew upper section of each sleeve selvedge to BO sts of armhole notch., Sew side and sleeve seams.",

"Round 1: Ch 3, 2 dc in ring, (ch 3, 3 dc in ring) 3 times; ch 3, sl st in top of beg ch-3. Sl st in next 3 sts.
Round 2: In corner, (ch 3, 2 dc, ch 3, 3 dc); *ch 1 (3 dc, ch 3, 3 dc) in next ch-3 sp; repeat from * 2 more times, ch 1, sl st in top of beg ch-3. Break off and weave in ends.
Round 3: Using white, sl st in any corner, (ch 3, 1 dc, ch 3, 2 dc) in same corner; * dc in next 7 sts, (2 dc, ch 3, 2 dc) in next corner. Repeat from * 2 times. Dc in next 7 sts. Sl st in top of beg ch-3.
Round 4: Sl st to corner, (ch 3, 1 dc, ch 3, 2 dc) in same corner; * dc in next 11 dc, (2 dc, ch 3, 2dc) in next corner; repeat from * 2 times; dc in next 11 dc. Sl st in top of beg ch-3.
Round 5: Ch 1, sc in every st around; sl st in first sc.
Break off and weave in ends.,
-Size small: cast on 80 stitches (long tail cast on). -Put a stitchmarker at the beginning of the row and three more after every 20th stitch (4 total) - Knit one full row of knit stitch. (2) at the start of round stitchmarker k2 and inc1. Knit till two stitches before the next marker (k2, inc1) slip the marker (k2, inc1). Do this at every stitch marker. Repeat till row (25). Switch to 80 cm needles when The 40 cm ones get too full. punt toch • -Split the arms from the body at row (26). ",

"Loosely CO 140 (112) sts using needles Row 1: P1, *K1, P1 to last stitch, P1 Work in Fisherman’s Rib for 10 (8.5) inches Join for working in the round. Switch to 1x1 ribbing Work in 1x1 ribbing until piece measures 15 (13) inches Switch to other needle Continue in 1x1 ribbing until work measures 25 (21) inches. Bind off using tubular bind off or 1x1 ribbing bind off to ensure stretchy edge.",

"Head:
 Start with green yarn and make 6 sc in a magic ring. Work 2 sc in each stitch around (12). Continue increasing by sc in the next st and 2 sc in the next st for each round until you have 54 stitches. Then, sc in each stitch around for rounds 10-16. Begin decreasing by sc in each of the next 7 sts, then sc2tog for round 17, and continue decreasing until you have 18 stitches. Stuff with fiberfill.
Eyes (Make 2):
 With white yarn, work 6 sc in a magic ring, then work 2 sc in each stitch around (12). Follow with 2 rounds of sc in each stitch, and decrease by sc in the next 4 sts and sc2tog for round 6. Fill with fiberfill and sew onto the head. Make black pupils by working 6 sc in a magic ring and finishing with a sl st.
Body:
 Start with green yarn and work 6 sc in a magic ring. Increase by sc in each stitch and adding 2 sc in the next stitch until you have 54 stitches. Continue with sc in each stitch for rounds 8-10. Switch to gray and white yarn every two rounds, then decrease until you have 18 stitches. Stuff with fiberfill and sew onto the head.
Legs (Make 2):
 With green yarn, start with 6 sc in a magic ring. Increase as before until you reach 24 stitches, then sc in each stitch for rounds 5-7. Begin decreasing and stuff the leg as you go, continuing until 9 stitches remain.
Arms (Make 2):
 With green yarn, start with 6 sc in a magic ring. Increase to 18 stitches, then sc in each stitch for rounds 4-5. Decrease until 9 stitches remain, then stuff the arm and finish with the remaining decrease rounds.
Assembly:
 Attach the arms and legs to the body, add a ribbon around the neck, and your bright, happy frog is complete!",

"Head:
Start with medium grey
1. 6 mc (6)
2. (Inc)x6 (12)
3. (Sc, inc)x6 (18)
4. (Sc 2, inc)x6 (24)
5. (Sc 3, inc)x6 (30)
6-7. Sc around (30) (do 2 times)
8. Sc 6 [in black: sc 3] in grey: sc 3 [in black: sc 3] in grey: sc 15 (30)
9. Sc 5 [in black: sc 4] {in white: sc 3} [in black: sc 4] in grey:sc 14(30)
10. Sc 4 [in black: sc 4] {in white: sc 5} [in black: sc 4] in grey: sc 13(30)
11. Sc 3 [in black: sc 4] {in white: sc 7} [in black: sc 4] in grey: sc 12(30)
12. Dec, sc 1 [in black: sc 2, dec] {in white: sc 3, dec, sc 2} [in black: sc, dec, sc] in grey: sc 2, dec, sc 3, dec, sc3 (24)
13. (Sc 2, dec)x6 (18)
FO and leave tail for sewing
Sew nose between round 8 and 9. Insert eyes between rounds 7 and 8.
",

"Find the stitch right below the working stitch on the left needle, lift it’s right leg onto the left needle and knit it trough the right leg. Video LLI (left lifted increase) - find the stitch 2 rows below the just knitted stitch on the right needle, lift it’s left leg onto the left needle and knit trough the back loop. Video ssk (slip slip knit) - slip the next 2 stitches one at a time knitwise to the right needle (to change their direction), slide them back to the left needle and knit together through the back loop. Video k2tog (knit 2 together) - knit 2 stitches together through the front loop. p2tog (purl 2 together) - purl 2 stitches together. Neckline On size 4 (3.5 mm) 16″ (40 cm) circular needles with the main color CO 78/84/90/96 stitches. Join knitting in the round, place BOR marker and knit the following 1×1 ribbing until the neckline measures 1.5″ (3.5 cm): *k1 tbl, p1*, repeat between ** to the end of row.",

"Using circular needle, CO 81, (91, 101) sts. Row 1 (WS): Knit 5, sl1 wyif, *k4, sl1 wyif, repeat from * to last 6 st, sl1 wyif, k5. Row 2 (RS): Knit. Repeat these two rows for a total of 15 rows, ending with a WS row. (approx. 2”) Break yarn. Place stitches on stitch holder. Left Front: Using size 8 circular needle, CO 40, (45, 50) sts. Row 1 (WS): *K4, sl1 wyif, repeat from * to last 5, k5. Row 2 (RS): Knit. Repeat these two rows for a total of 15 rows, ending with a WS row. (approx. 2”) Break yarn. Place stitches on stitch holder. Right Front: Using size 8 circular needle, CO 40, (45, 50) sts. Row 1 (WS): Knit 5, sl1 wyif, *k4, sl1 wyif, repeat from * to last 4st, k4. Row 2 (RS): Knit. Repeat these two rows for a total of 15 rows, ending with a WS row. (approx. 2”). Do not break yarn. Joining: 0970000P May we suggest: 209 236 127 119 205 You are now going to join all 3 pieces into one onto the same circular needle. 1. (RS) Work across Right Front to the last stitch. Slip the last stitch purlwise onto the right hand needle. 2. Slip the last stitch on the righthand needle over to the lefthand needle and k2tog. (This joins the two pieces and reinforces the join at the same time.) Work across Back to the last stitch. Slip the last stitch purlwise onto the right hand needle. 3. Slip the last stitch on the righthand needle over to the lefthand needle and k2tog. Knit across Left Front stitches to the end. 159 (179, 199) sts",

"Cast On:
 Cast on 3 sts.
 1: Knit 3 and slip sts back onto the left-hand needle (LHN).
 2: Repeat the previous step once more to create a mini i-cord.
 3: Knit 3, pick up 3 sts along the i-cord, turn (6 sts).
 4: Pick up 3 sts along the cast-on edge, knit 3, and slip 3 sts with yarn in front (wyif) (9 sts).
Increase:
 Row 1 (RS): Knit to the last 3 sts, make 1 right (m1R), slip 3 sts with yarn in front (+1 st).
 Rows 2, 3, 4: Knit to the last 3 sts, slip 3 sts with yarn in front.
 Repeat the four rows until half of the yarn is used. Then start decreasing.
 To track when to increase, place a progress keeper at the beginning of the last increase row.
Decrease:
Row 1 (RS): Knit to the last 5 sts, knit 2 together (k2tog), slip 3 sts with yarn in front (-1 st).
Rows 2, 3, 4: Knit to the last 3 sts, slip 3 sts with yarn in front.
Repeat the four rows until 9 sts remain.
To track when to decrease, place a progress keeper at the beginning of the last decrease row.
Bind Off:
Bind off on a right-side (RS) row.
Knit 2, knit 2 together through the back loop (k2tog tbl), slip 3 sts back onto the LHN (8 sts).
Knit 2, knit 2 together through the back loop, slip 3 sts back onto the LHN (7 sts).
Knit 2, knit 2 together through the back loop (3 sts on LHN, 3 sts on RHN).”,
Row 1 - Using (Colour A) chain 75 (74, plus 1 for turning). SC in the 2nd chain from the hook, and all the way along (74 stitches). Fasten off and snip your yarn. • Row 2 - Using (Colour B) start from the right-hand side of your work and create your border stitch (BS) by working a single crochet (SC) through both loops of the first stitch. Then continue SC in the back loop of each stitch until you have one stitch left. Then create your last BS, again working a SC through both loops. Fasten off.",

" Work in spiral rounds, starting with yellow yarn.
Rnd 1: Make a magic ring (MR) and work 7 sc into the ring [7].
 Rnd 2: Work 7 inc (increase in each stitch) [14].
 Rnd 3: (Sc, inc) x 7 [21].
 Rnd 4: (2 sc, inc) x 7 [28].
 Rnd 5: (3 sc, inc) x 7 [35].
 Rnd 6 - Rnd 11: 35 sc [35].
 Rnd 12: (4 sc, inc) x 7 [42].
 Rnd 13: 42 sc [42].
 Rnd 14: (13 sc, inc) x 3 [45].
 Rnd 15: (7 sc, inc, 7 sc) x 3 [48].
 Rnd 16 - Rnd 17: 48 sc [48].
 Rnd 18: (4 sc, dec) x 8 [40].
 Rnd 19: (3 sc, dec) x 8 [32].
 Rnd 20: (2 sc, dec) x 8 [24].
 Rnd 21: (sc, dec) x 8 [16].
 Rnd 22: 8 dec (decrease in each stitch) [8].
Cut the yarn and fasten off."
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
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741890859/IMG_1882-1024x1024-1_vlqu8g.webp",
"https://res.cloudinary.com/ducax2ucs/image/upload/v1741631790/IMG_9379_small2_vtvgpv.jpg"
    ]

User.create(
  email: 'a@a.a',
  password: "123456",
  username: 'Jasper'
)

User.create(
  email: 'b@b.b',
  password: "password",
  username: 'Pierre-Paul'
)


users = usernames.shuffle.take(14).map do |username|
  user = User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    username: username,
    bio: bios.sample
  )

  avatar_url = avatar_images.shuffle.take(1).first
  file = URI.open(avatar_url)
  user.avatar.attach(io: file, filename: "avatar_#{user.id}.jpg", content_type: "image/jpeg")

  user
end
  for i in 0..13
    user = users.sample

    post = Post.new(
      title: post_titles[i],
      content: post_contents[i],
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

    CommentLike.create!(
      user: User.last,
      comment: post.comments.first
    )
    CommentLike.create!(
      user: User.third,
      comment: post.comments.first
    )
  end

  for i in 0..10
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
