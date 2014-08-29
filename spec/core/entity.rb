describe "Entity" do
  let(:entity) { create_entity }
  
  it "can be created with game and type" do
    create_entity
  end

  it "has getter for type" do 
    entity.type == "entity"
  end

  it "has update method" do
    expect(entity.respond_to? :update).to be true
  end

  it "has rendering method" do 
    expect(entity.respond_to? :rendering).to be true
  end

  class MyGame
    def add_entity(entity)
    end
  end

  def create_entity
    Core::Entity.new MyGame.new, "entity"
  end
end
