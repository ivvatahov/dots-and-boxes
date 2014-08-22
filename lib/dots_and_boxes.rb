require "./core/game_engine"
require "./core/base_game"
require "./core/entity"
require "./core/game_time"

require "./game/game"
require "./game/game_state"
require "./game/start_state"
require "./game/ongoing_state"
require "./game/end_state"

require "./rendering/rendering_engine"
require "./rendering/console_render"
require "./rendering/gui_render"


game = Game::DotsAndBoxes.new
frames_per_second = 100

engine = Core::GameEngine.new game frames_per_second 