require 'fox16'

require "./core/game_engine"
require "./core/base_game"
require "./core/entity"
require "./core/time"
require "./core/input"
require "./core/vector2f"
require "./core/math_functions"

require "./game/entities/box"
require "./game/entities/grid"
require "./game/entities/edge"
require "./game/entities/player"
require "./game/entities/players"

require "./game/start_state"
require "./game/ongoing_state"
require "./game/end_state"
require "./game/game"

require "./rendering/console_render"
require "./rendering/gui_render"
require "./rendering/window"

Thread.abort_on_exception=true

 window = RenderingEngine::GUIWindow.new_window

