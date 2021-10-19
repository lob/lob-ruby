require "spec_helper"

describe Lob::Resources::Card do

  before :each do
    @horizontal_card_url = "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf"
    @horizontal_card_front = File.new(File.expand_path("../../../samples/card.pdf", __FILE__))
    @horizontal_card_back = File.new(File.expand_path("../../../samples/card.pdf", __FILE__))

    @sample_card_params = {
      description: "Test Card",
      front: @horizontal_card_url
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "list" do
    it "should list cards" do
      assert subject.cards.list({ include: ['total_count'] })["object"] == "list"
    end
  end


  describe "create" do
    it "should create a card with a front url" do

      result = subject.cards.create(@sample_card_params)

      result["description"].must_equal(@sample_card_params[:description])
    end

    it "should create a card with front and back as urls" do

      result = subject.cards.create(
        @sample_card_params.merge(back: @horizontal_card_url)
      )

      result["description"].must_equal(@sample_card_params[:description])
    end

    it "should create a card with a front PDF" do

      result = subject.cards.create(
        @sample_card_params.merge(front: @horizontal_card_front)
      )

      result["description"].must_equal(@sample_card_params[:description])
    end

    it "should create a card with front and back as PDFs" do

      result = subject.cards.create(
        @sample_card_params.merge({
          front: @horizontal_card_front,
          back: @horizontal_card_back
        })
      )

      result["description"].must_equal(@sample_card_params[:description])
    end

    it "should return an error without a front" do
      assert_raises Lob::InvalidRequestError do
        subject.cards.create(
          @sample_card_params.merge({ front: nil })
        )
      end
    end
  end

  
  describe "find" do
    it "should find a card" do

      new_card = subject.cards.create(
        @sample_card_params.merge(front: @horizontal_card_front)
      )

      result  = subject.cards.find(new_card["id"])
      result["description"].must_equal(@sample_card_params[:description])
    end
  end


  describe "update" do
    it "should update a card" do

      new_card = subject.cards.create(
        @sample_card_params.merge(front: @horizontal_card_front)
      )

      result  = subject.cards.update(
        new_card["id"],
        { description: "Updated card description" }
      )
      result["description"].must_equal("Updated card description")
    end
  end


  describe "destroy" do
    it "should destroy a card" do

      new_card = subject.cards.create(
        @sample_card_params.merge(front: @horizontal_card_front)
      )

      result = subject.cards.destroy(new_card["id"])
      result["id"].must_equal(new_card["id"])
      result["deleted"].must_equal(true)
    end
  end

end
