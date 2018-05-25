puts "STARTING SEEDS"
response = RestClient.get "https://hacker-news.firebaseio.com/v0/topstories.json"


ids = JSON.parse(response).take(10)

ids.each  do |id|
  accomodation = JSON.parse(
    RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
  )

  Accomodation.create!(title: post['title'], url: post['url'])
end

puts "SEEDS FINISHED"
