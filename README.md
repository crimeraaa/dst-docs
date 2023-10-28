# Overview

This repository is a (probably futile) attempt to document as much as I can (or am patient enough to) document about DST's code. 

Firstly, there are 2 major parts to DST's code. The game engine, which is written in C++, and the scripting functionality, which you can do by writing Lua (`.lua`) scripts.

The game engine is inaccessible to us players while the scripts are free for us to poke around at. We can however at least know what functions are which since a lot of stuff is exposed from the Lua side. That is, we can call `debug.getinfo(<fn>)` on functions and get back a Lua table containing all sorts of information:

```lua
-- This is what the resulting table looks like for `debug.getinfo(print)`
local info = {
    -- This field is just which language this function came from.
    what = "C",
    -- This is normally a filepath, but for C source we just get this.
    source = "=[C]",
    short_src = "[C]",

    -- For display purposes I've converted this to a string, however in
    -- practice this is a function you can call! e.g. info.func("Hi mom!")
    func = "function: 009C7420",

    -- How many upvalues there are inside of the function. Upvalues are
    -- Lua variables which are defined outside of the function's scope.
    nups = 0,

    -- Because it's C source, there's no line where it's defined, because
    -- the C source is already compiled to machine code so Lua has no idea 
    -- what lines it comes from. As a result it falls back to `-1`.
    currentline = -1,
    linedefined = -1,

    -- Usually an empty string, don't mind this too much right now.
    namewhat = "",
}
```

Of interest to us are the `source`, `what` and `short_src` fields. For more information please see [Programming in Lua: 23.1&mdash;Introspective Facilities.](https://www.lua.org/pil/23.1.html)

# TODO List

- [x] Actually start the project :D
- [x] Divide workload for engine functions.
- [ ] Check out the values of the engine constants ingame.
- [ ] Explain what each constant does, where it's used and how to use it.
- [ ] Determine parameters and return values for engine functions.
- [ ] Explain what each function does and how to use it.

Note: there's a little under 1800 functions. So I doubt even if I were single-mindedly dedicated to *just* this task, I alone wouldn't be able to complete it in a lifetime...

# The `scripts/` folder

[By default](https://git-scm.com/book/en/v2/Git-Tools-Submodules), when you clone this repository, there's nothing in the `scripts/` folder. That's perfectly normal! It's a way to save space as that repo is about 500 megabytes so I don't want to immediately clog your device's memory unless you explicitly say so.

To add the contents of the `dst_gamescripts` repo, first run this:

    git submodule init

Then run this:

    git submodule update

Do note that this will clone the full repo, commit history and all. It amounts to about 500 megabytes! 

If you'd like to reduce the size, you can append the `--depth <number>` flag to specify how far back you want your submodule's cloned history to go:

    git submodule update --depth 1

`--depth 1` just means *"please get only up to the 1st most recent commit/s, thanks"*. You can change out `1` for other positive whole numbers.


# Credits

Hornet [created a thread to document][hornets-thread] the names of (most of) the engine functions at the time.

[There's a reply to that same thread][rickzzs-script] by Rickzzs. It's a script to dump all of the C sided functions which I think is really neat. I haven't tried using it myself, but as Klei updates the game I'll definitely think about using it to see what's changed.

<!-- Like in HTML, single newlines don't affect the output. -->
Although not a dependency, I think that having a well maintained archive of the game's scripts is essential to getting full context as to how the engine is being utilized and also to appreciate how the Lua side really comes together. 

I've added the [dst_gamescripts repository](https://github.com/penguin0616/dst_gamescripts) which is maintained by [penguin0616] and [Hornet] as a `git submodule`.

#### The following section is just for me in case I forget everything, which I tend to do *a lot*...

To create a `submodule` within `git`:

    git submodule add <remote-url> [path]

If `path` is not specified, the resulting cloned repo's folder will take on the original project's folder name and it'll go to the current working directory.

For this repository, I set it to a directory to be called `./scripts/`.

    git submodule add https://github.com/penguin0616/dst_gamescripts scripts

As always, `git fetch` and `git pull` are your best friends when it comes to updating.

<!-- LINKS -->
<!-- 
God I keep forgetting how these stupid things work...
1.) [plaintext](link-literal) 
2.) [varname] 
    - Note that this requires variable definitions somewhere in the document.
    - You can define variables in the format [varname]:link-literal
    - This will use <varname> as the displayed text.
3.) [plaintext][varname]
    - Same as #2 but you can customize the displayed text this way.
-->
[penguin0616]:https://github.com/penguin0616

[Hornet]:https://github.com/omaremad74

[hornets-thread]:https://forums.kleientertainment.com/forums/topic/126774-documentation-list-of-all-engine-functions/

[rickzzs-script]:https://forums.kleientertainment.com/forums/topic/126774-documentation-list-of-all-engine-functions/?do=findComment&comment=1623545

