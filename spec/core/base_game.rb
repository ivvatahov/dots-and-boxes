describe "BaseGame" do
  let(:input) { create_input }
  let(:render) { create_render }
  let(:game) { create_game input, render }

  it "can be created with input and render" do
    create_game create_input, create_render
  end

  it "has getters for input and render" do
    expect(game.input.equal? input).to be true
    expect(game.render.equal? render).to be true
  end

  it "can process the input" do
    game.process_input
  end

  it "allows adding an entity" do
    entity = Core::Entity.new game
    game.add_entity entity
  end

  it "allows removing all entities" do
    10.times { game.add_entity Core::Entity.new game }
    game.remove_all_entities
    expect(game.entities.empty?).to be true
  end

  it "can update itself" do
    expect(game.respond_to? :update).to be true
  end

  # I must change it!!!
  it "can render itself" do
    expect(game.respond_to? :rendering).to be true
  end

  class Input
    def process_input; end
  end

  class Render
  end

  def create_input
    Input.new
  end

  def create_render
    Render.new
  end

  def create_game(input, render)
    Core::BaseGame.new input, render
  end
end
