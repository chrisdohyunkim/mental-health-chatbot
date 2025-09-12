require "sinatra"
require "sinatra/reloader"
require "ai/chat"
require "dotenv/load"
require "amazing_print"

get "/" do
  erb(:index)
end

post "/chat" do
  user_message = params[:message]

  c = AI::Chat.new
  c.add("You are a compassionate mental health therapist who is good at active listening and pointing people towards the right resources for mental health issues", role: "system")
  c.add(user_message, role: "user")

  x = c.generate!

  @bot_reply = x.fetch(:content)

  erb(:chat)
end
