--[[ 
NOTE: It can get confusing having this file around, as the environments are vastly
different when going from vanilla to mod. So please be careful!
]]

-- `GLOBAL` is a DST mod env specific thing, but it basically refers to `_G`.
GLOBAL = _G

--[[------------------------- MOD UTIL FUNCTIONS -------------------------------
These are functions made by Klei in the file `scripts/modutil.lua`.
The modding environment (as in, a Lua environment) is separate from the global one.
You can imagine it kind of like a namespace (such as those in C++, Java, C#).

Klei gave us a slightly more restrictive environment to start with, 
see `CreateEnvironment` in `scripts/mods.lua:286`. We have the classics like
`print`, `tostring`, `type` and great libraries like `string`, `math` and `table.

However, others aren't immediately available and thus have to be called from the
global table/namespace. Fortunately Klei gives us the variable `GLOBAL` which is
really just an alias for `_G`. Libraries like `debug` and functions like `assert`
must be prepended with `GLOBAL.`.

I personally prefer `local _G = GLOBAL`, or perhaps not `local` at all,
as `_G` is so much faster to type and a bit of Lua know-how is enough, imo.

They do give us immediate access to some of their own globals like the `Class` 
function to allow you to create your own classes. Lua doesn't come with class 
based systems out of the box so this is their of doing things.

The modutil functions allow us modders to much more readily implement our ideas.
Or if you wanna get all computer-sciency, Klei gave us an abstraction layer.

You want to modify all instances of a prefab? You have `AddPrefabPostInit`.
You wanna change aspets of a component? You have `AddComponentPostInit`.

With a bit of digging around I believe the details can be dug up. 
So what's the point of this file?

Lua Language Server annotations, that's it :)
------------------------------------------------------------------------------]]
-- ? Include `AddUserCommand`? The LSP recognizes `scripts/usercommands.lua`, and I don't
-- ? there's much syntactical difference between that and the mod env one.


-- ### Modding Environment
-- Adds your modded action to the `_G.ACTIONS` table so it can be used.
--
-- See `env.AddAction` (`scripts/modutil.lua:442`) for full implementation.
---@param id string Key into `_G.ACTIONS`.
---@param str string Display when action is ready to be used.
---@param fn function What the action does exactly.
function AddAction(id, str, fn)
    print(
        "[Mod Action ID]:", id, 
        "[Mod Action Display]:", str, 
        "[Mod Action Function]:", fn
    )
end


---@param name string Filename, no extension of the original sound.
---@param new_name string Filename, no extension of the replacement sound.
function RemapSoundEvent(name, new_name)
    print("Replacing sound", name, "with", new_name)
end


--------------------------------------------------------------------------------
------------------------- POST INITIALIZATION FUNCTIONS ------------------------
--------------------------------------------------------------------------------


-- ### Modding Environment
-- Applies `fn` to every single prefab to has been and will ever be.
--
-- You can add checks to limit your scope, of course.
---@param fn fun(inst:table) Function to be run when prefab is done initializing.
function AddPrefabPostInitAny(fn)
    print("Applying", fn, "to all prefabs in the world!")
end


-- #### Modding Environment
-- Applies `fn` to all prefabs with the `player` tag (I think).
-- 
-- You can add checks to limit your scope, of course.
---@param fn fun(inst:table) Function to be run when player prefab is done initializing.
function AddPlayerPostInit(fn)
    -- Of course, inside the function body you can check for specific player attributes.
    -- e.g. are they playing as Wigfrid? Wilson? What tags do they have?
    print("Applying", fn, "to all player prefabs!")
end


-- ### Modding Environment
-- Applies `fn` to all prefabs of specified `prefab` code.
--
-- Note: for player prefabs, please use `AddPlayerPostInit`.
---@param prefab string Prefab name as seen in the Lua scripts, e.g. `"pigman"`.
---@param fn fun(inst:table) Function to be run when prefab is done initializing.
function AddPrefabPostInit(prefab, fn)
    print("Applying", fn, "to all", prefab.."'s!")
end


-- ### Modding Environment
-- Changes a specific component after it's been initialized ingame.
--
-- See `env.AddComponentPostInit` (`scripts/modutil.lua:567`) for implementation details.
---@param component string Name as seen in the Lua scripts, e.g. `"playeractionpicker"`.
---@param fn function Function called on post initialization for this component.
function AddComponentPostInit(component, fn)
    printf("[Component]:", component, "[Post-init Function]:", fn)
end


-- ### Modding Environment
-- Modifies the stategraph `name` using `fn.
--
-- I cannot remember anything about how stategraphs are named, sorry.
---@param name string e.g. `"wilson"`.
---@param fn fun(self) `self` is an arbitrary parameter name.
-- Although `self` is an arbitrary name, this should signal to us that this
-- function probably modifies the stategraph directly, and not an instance.
function AddStategraphPostInit(name, fn)
    print("Applying", fn, "to", name.."'s stategraph!")
end
