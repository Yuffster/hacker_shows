require 'sinatra'
require './show_generator'

get '/' do
	gen = ShowGenerator.new
	@network = gen.getNetwork
	@title = gen.getTitle
	erb :announcement
end

run Sinatra::Application

__END__

@@ announcement
<style>
body {
	background: #000;
	font-family: sans-serif;
	color: #fff;
	text-align: center;
}
h1,h2 {
	font-weight: 200;
}
</style>

<h1>Coming this fall to <%= @network %>:</h1>

<h2><%= @title %></h2>