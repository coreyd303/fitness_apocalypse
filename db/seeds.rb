if Rails.env == "development"
  10.times do
    BlogPost.create(title: "Here is a blog",
                    body: "Zombies reversus ab inferno, nam malum cerebro.
                            De carne animata corpora quaeritis. Summus sit​​, morbo vel maleficia?
                            De Apocalypsi undead dictum mauris. Hi mortuis soulless creaturas, imo
                            monstra adventus vultus comedat cerebella viventium. Qui offenderit
                            rapto, terribilem incessu. The voodoo sacerdos suscitat mortuos comedere carnem.
                            Search for solum oculi eorum defunctis cerebro. Nescio an Undead zombies.
                            Sicut malus movie horror.",
                    summary: "Zombies reversus ab inferno, nam malum cerebro.")
  end

  3.times do
    Wod.create(title: "Do hard things!",
               duration: "30 mins",
               workout_type: "HARD!",
               workout:      "DO IT DO IT NOW DO IT! JUST DO IT!",
               workout_date: Time.zone.now.strftime("%m/%d/%Y"),
               pub_status: "P")
  end
end

u = User.find_by(email: "coreyd303@gmail.com")
unless u.blank?
  u.add_role(:admin) if u.has_role?(:admin) == false
end

if u.confirmed_at.nil?
  u.confirmed_at = Time.zone.now
  u.save
end