import Batteries
import Pod
import Raylib
import Flecs
import Luau

def main : IO Unit := do
  Raylib.setConfigFlags .vsyncHint
  let rl ← Raylib.initWindow 800 600 "Game"
  Raylib.initAudioDevice
  Raylib.setExitKey .null
  let world ← Flecs.init ()
  repeat
    if (← Raylib.isKeyDown .leftAlt) && (← Raylib.isKeyPressed .enter) then
      Raylib.toggleFullscreen
    Raylib.beginDrawing
    Raylib.clearBackground .raywhite
    let quit := !(← world.progress) || (← Raylib.windowShouldClose)
    Raylib.endDrawing
    if quit then break
  world.fini
  Raylib.closeAudioDevice
  Raylib.closeWindow rl
