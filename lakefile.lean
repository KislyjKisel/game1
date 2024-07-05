import Lake
open Lake DSL

require batteries from git "https://github.com/leanprover-community/batteries" @ "bba0af6"
require pod from git "https://github.com/KislyjKisel/lean-pod" @ "b363d7c"
require raylib from git "https://github.com/KislyjKisel/Raylib.lean" @ "7cbfb81"
require flecs from git "https://github.com/KislyjKisel/Flecs.lean" @ "2df013b"
require luau from git "https://github.com/KislyjKisel/Luau.lean" @ "139ef2e"

def packagesDir := defaultPackagesDir

package «Game» where
  srcDir := "src"
  packagesDir := packagesDir
  leanOptions := #[⟨`autoImplicit, false⟩]

@[default_target]
lean_exe «Game» where
  moreLinkArgs := #[
    s!"-L{packagesDir}/raylib/raylib/build/raylib", "-lraylib",
    s!"-L{packagesDir}/luau/luau/build/", "-lLuau.VM", "-lLuau.Compiler", "-lLuau.Ast"
  ]
