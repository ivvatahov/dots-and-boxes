describe "Game Engine" do
  let(:game) { MyGame.new }
  let(:engine) { create_game_engine game }

  it "can be created with game and frames_per_second" do
    create_game_engine MyGame.new
  end

  it "has start method" do
    expect(engine.respond_to? :start).to be true
  end

  it "has end method" do
    expect(engine.respond_to? :stop).to be true
  end

  it "should process the input" do
    engine.start
    expect(game.processed).to be true
  end

  it "should update the game" do
    engine.start
    expect(game.updated).to be true
  end

  it "should render the game" do
    engine.start
    expect(game.rendered).to be true
  end

  it "has game loop" do
    game.reset_counter
    10.times { engine.start }
    expect(game.counter).to be 10

    game.reset_counter
    26.times { engine.start }
    expect(game.counter).to be 26

    game.reset_counter
    4.times { engine.start }
    expect(game.counter).to be 4
  end

  class MyGame
    attr_reader :processed, :updated, :rendered, :counter
    attr_writer :engine

    def initialize
      @processed = false
      @updated = false
      @rendered = false
      @counter = 0
    end

    def reset_counter
      @counter = 0
    end

    def process_input
      @processed = true
    end

    def update
      @updated = true
    end

    def rendering
      @counter += 1
      @engine.stop
      @rendered = true
    end
  end

  def create_game_engine(game)
    engine = Core::GameEngine.new game, 100
    game.engine = engine
    engine
  end
end
