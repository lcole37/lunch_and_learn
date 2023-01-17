RSpec.describe Image do

		before :each do
			data = {:id=>"U4Oox4_zYLA",
  :created_at=>"2019-03-29T10:53:34Z",
  :updated_at=>"2023-01-16T07:06:18Z",
  :promoted_at=>nil,
  :width=>5300,
  :height=>5300,
  :color=>"#402626",
  :blur_hash=>"LwK9iTR-EMWW~BWWV@WWtOjFr?f7",
  :description=>"Fishing for sunrays.\r\nJust one more beam —\r\nso I will have \r\nwarmth for the night.",
  :alt_description=>"body of water during sunset",
  :urls=>
   {:raw=>
     "https://images.unsplash.com/photo-1553856622-d1b352e9a211?ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA&ixlib=rb-4.0.3",
    :full=>
     "https://images.unsplash.com/photo-1553856622-d1b352e9a211?crop=entropy&cs=tinysrgb&fm=jpg&ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA&ixlib=rb-4.0.3&q=80",
    :regular=>
     "https://images.unsplash.com/photo-1553856622-d1b352e9a211?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA&ixlib=rb-4.0.3&q=80&w=1080",
    :small=>
     "https://images.unsplash.com/photo-1553856622-d1b352e9a211?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA&ixlib=rb-4.0.3&q=80&w=400",
    :thumb=>
     "https://images.unsplash.com/photo-1553856622-d1b352e9a211?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA&ixlib=rb-4.0.3&q=80&w=200",
    :small_s3=>"https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1553856622-d1b352e9a211"},
  :links=>
   {:self=>"https://api.unsplash.com/photos/U4Oox4_zYLA",
    :html=>"https://unsplash.com/photos/U4Oox4_zYLA",
    :download=>"https://unsplash.com/photos/U4Oox4_zYLA/download?ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA",
    :download_location=>
     "https://api.unsplash.com/photos/U4Oox4_zYLA/download?ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA"},
  :likes=>144,
  :liked_by_user=>false,
  :current_user_collections=>[],
  :sponsorship=>nil,
  :topic_submissions=>{},
  :user=>
   {:id=>"9iaZQOhENbM",
    :updated_at=>"2023-01-11T18:06:37Z",
    :username=>"8moments",
    :name=>"Simon Berger",
    :first_name=>"Simon",
    :last_name=>"Berger",
    :twitter_username=>"8momentsinlife",
    :portfolio_url=>nil,
    :bio=>
     "Man is eminently a storyteller. His search for a purpose, a cause, an ideal, a mission and the like is largely a search for a plot and a pattern in the development of his life story - a story that is basically without meaning or pattern.\r\nEric Hoffer",
    :location=>"Austria",
    :links=>
     {:self=>"https://api.unsplash.com/users/8moments",
      :html=>"https://unsplash.com/@8moments",
      :photos=>"https://api.unsplash.com/users/8moments/photos",
      :likes=>"https://api.unsplash.com/users/8moments/likes",
      :portfolio=>"https://api.unsplash.com/users/8moments/portfolio",
      :following=>"https://api.unsplash.com/users/8moments/following",
      :followers=>"https://api.unsplash.com/users/8moments/followers"},
    :profile_image=>
     {:small=>"https://images.unsplash.com/profile-1648123401390-e50ce599700dimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
      :medium=>"https://images.unsplash.com/profile-1648123401390-e50ce599700dimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64",
      :large=>"https://images.unsplash.com/profile-1648123401390-e50ce599700dimage?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"},
    :instagram_username=>"8momentsnow",
    :total_collections=>73,
    :total_likes=>191,
    :total_photos=>416,
    :accepted_tos=>true,
    :for_hire=>false,
    :social=>{:instagram_username=>"8momentsnow", :portfolio_url=>nil, :twitter_username=>"8momentsinlife", :paypal_email=>nil}},
  :tags=>[{:type=>"search", :title=>"laos"}, {:type=>"search", :title=>"tranquility"}, {:type=>"search", :title=>"fishing"}]}
			@image1 = Image.new(data)
		end

		it "exists" do
			expect(@image1).to be_a(Image)
		end

		it "has attributes" do
			expect(@image1.alt_tag).to eq("body of water during sunset")
			expect(@image1.url).to eq("https://images.unsplash.com/photo-1553856622-d1b352e9a211?ixid=MnwzOTk4Nzd8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8Mnx8fDE2NzM5MTM0NjA&ixlib=rb-4.0.3")
    end
end
