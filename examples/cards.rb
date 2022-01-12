$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob.rb'
require 'pp'

# initialize Lob object
LOB_LIVE_API_KEY = ENV['LOB_LIVE_API_KEY']
lob = Lob::Client.new(api_key: LOB_LIVE_API_KEY)

front_template = 'https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf'
back_template = 'https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf'

# create a card
pp lob.cards.create(
  front: front_template, # required
  back: back_template, # optional; default: 'https://s3.us-west-2.amazonaws.com/public.lob.com/assets/card_blank_horizontal.pdf'
  description: 'Test Card', # optional
  size: '2.125x3.375' # optional, default: '2.125x3.375'
)

# find a card
card_id = 'YOUR_CARD_ID'
pp lob.cards.find(
  card_id # required
)

# update a card
card_id = 'YOUR_CARD_ID'
pp lob.cards.update(
  card_id, # required
  { description: 'Updated Test Card Desc' }
)

# delete a card
card_id = 'YOUR_CARD_ID'
pp lob.cards.destroy(
  card_id # required
)

# create a card order
card_id = 'YOUR_CARD_ID'
pp lob.cards.create_order(
  card_id, # required
  { quantity: 10000 } # required
)

# List orders for a given card a card order
card_id = 'YOUR_CARD_ID'
pp lob.cards.list_orders(
  card_id # required
)

