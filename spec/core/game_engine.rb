describe "Game Engine" do
  let(:engine) { create_game_engine }
end

def create_game_engine(*args)
	Core::GameEngine.new *args
end