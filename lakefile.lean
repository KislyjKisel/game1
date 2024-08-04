import Lake
open Lake DSL

require batteries from git "https://github.com/leanprover-community/batteries" @ "v4.10.0"
require socket from git "https://github.com/hargoniX/socket.lean" @ "b5e4c86"
require pod from git "https://github.com/KislyjKisel/lean-pod" @ "b8c9094"

require raylib from git "https://github.com/KislyjKisel/Raylib.lean" @ "917c72c" with
  NameMap.empty
    |>.insert `fork ""

require flecs from git "https://github.com/KislyjKisel/Flecs.lean" @ "2df013b"
require luau from git "https://github.com/KislyjKisel/Luau.lean" @ "139ef2e"


def packagesDir := defaultPackagesDir

package «Game» where
  srcDir := "src"
  packagesDir := packagesDir
  leanOptions := #[⟨`autoImplicit, false⟩]

lean_lib Game

@[default_target]
lean_exe «game» where
  root := `Main
  moreLinkArgs := #[
    s!"-L{packagesDir}/raylib/raylibFork/build/raylib", "-lraylib",
    s!"-L{packagesDir}/luau/luau/build/", "-lLuau.VM", "-lLuau.Compiler", "-lLuau.Ast"
  ]
