require "./core/game_engine"
require "./core/base_game"
require "./core/entity"
require "./core/time"
require "./core/input"

require "./game/entities/box"
require "./game/entities/grid"
require "./game/entities/line"

require "./game/start_state"
require "./game/ongoing_state"
require "./game/end_state"
require "./game/game_input"
require "./game/game"

require "./rendering/console_render"
require "./rendering/gui_render"


render = RenderingEngine::ConsoleRender.new
input = Game::GameInput.new

game = Game::DotsAndBoxes.new input, render
frames_per_second = 1

engine = Core::GameEngine.new game, frames_per_second
engine.start