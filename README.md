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

# Cloning/Forking

1. Cloning the repo from the **command line**
    1. Make sure you have `git` installed. For Windows, you may need to install Git Bash or Git for Windows.
    2. Start your terminal of choice, like `cmd`, `powershell`, `bash`, etc.
    3. `cd` to your folder where you want the repo's folder to reside. For example, in my Windows user folder, I have a folder called `repos/`.
    
            > cd C:\Users\crimeraaa\repos
            C:\Users\crimeraaa\repos>

    4. Run this command:

            > git clone https://github.com/crimeraaa/dst-docs.git

    5. Your current working directory should now have a folder called `dst-docs/` inside it.
    6. **(Optional):** If you want the contents of `dst_gamescripts` alongside this repo, first run this command:

            > git submodule init

    7. **(Continued):** If you want the *full* contents of `dst_gamescripts`, as in the full commit history and all (~500 MB at the time of writing!), simply run this command:

            > git submodule update

    8. **(Continued):** If you *don't* want the full contents I don't blame you. You may run this command instead:

            > git submodule update --depth 1

        You may also replace `1` with any value you like. This just tells `git` up to how far down the most recent commit history it should retrieve.
    9. If you did all that you wanted to, you should be able to open this folder in your favorite code editor/IDE and get to work!

2. Cloning the repo using **GitHub desktop**
    1. Go to `File -> Clone Repository -> URL`.
    2. Paste `https://github.com/crimeraaa/dst-docs.git` in the *URL* textbox.
    3. **(Optional):** change the location contained in *Local path* textbox.
        - e.g. instead of `C:\Users\crimeraaa\Documents\Github\dst-docs`,
        I can put: `C:\Users\crimeraaa\repos\dst-docs`.
    4. Click `Clone` and wait. This will automatically retrieve the contents of the `dst_gamescripts` repo, which is *massive*.
    5. Open this folder in your favorite code editor/IDE and get to work!

### Visual Studio Code setup

I'd recommend creating/editing your own user or project-specific `settings.json`. This allows your instance of the extension to look up this repo's scripts and such to allow for automatic annotations, even if you're outside the repo directory.

I've included a file `./sample-user-settings.json` which shows the settings I'm currently using for the extension.

1. Install the `lua-language-server` extension if you don't have it already. You can install it [from the Marketplace](https://marketplace.visualstudio.com/items?itemName=sumneko.lua).
2. Edit your user settings or workspace settings:
    1. From UI
        1. Go to `Preferences -> Settings`.
        2. In the *Search settings* textbox type `@ext:sumneko.lua`.
        3. Look for the settings you'd like to modify and set their values accordingly. You can search by id (like `Lua.diagnostics.disable`) or by words, like just type out `Diagnostics` to see the relevant choices.
    2. From Command Palette
        1. Hit `CTRL + SHIFT + P` to open the command palette.
        2. Search for `Open User Settings (JSON)` or `Open Workspace Settings (JSON)` then hit `ENTER`.
        3. You'll be greeted by a new window containing a JSON file.
        4. Between the outermost pair of curly braces, write your desired settings. For example, here's some settings that I think help with annotations and such. Be careful as they may eat quite a bit of RAM.
        ```json
        {
            "Lua.diagnostics.enable": true,
            "Lua.codeLens.enable": true,
            "Lua.completion.requireSeparator": "/",
            "Lua.workspace.library": [
                "absolute-path-to-dst-docs/",
            ],
        }
        ```

        Replace `absolute-path-to-dst-docs` with the directory you cloned it to e.g. `C:/Users/crimeraaa/repos/dst-docs/`.

# Limitations

Currently, this only works with the [Lua Language Server](https://luals.github.io/) extension by sumneko, for **Visual Studio Code**. 

> Supposedly the extension works for **NeoVim**, but don't ask me anything about that cause I don't use it currently! Maybe in the future...

I chose this extension because the it provides a lot of annotations that are shown to you when you hover over variables that have said annotations. I make use of them a lot! However, they are specific to this extension so many other editors won't be able to make use of them.

In the future I'd like to create Markdown documents instead so that we don't have to rely on editor-specific extensions.


# TODO List

- [x] Actually start the project :D

Here's a sort of "Laundry List" to follow to subdivide the ordeal into smaller tasks

## Engine Constants

- [ ] Find out if a value is defined from the engine.
- [ ] Explain what it does.
- [ ] Determine its possible values.
- [ ] Determine how to use it.
- [ ] Add observations from usage in Klei's code and my own testing.

## Engine Functions

- [ ] Figure out if a given function is from C source or Lua.
- [ ] Divide table functions into hypothetical "categories".
- [ ] Determine parameters and return values.
- [ ] Add observations from usage in Klei's code and my own testing.


Note: there's a little under 1800 functions. So I doubt even if I were single-mindedly dedicated to *just* this task, I alone wouldn't be able to complete it in a lifetime...

# Credits

Hornet [created a thread to document][hornets-thread] the names of (most of) the engine functions at the time.

[There's a reply to that same thread][rickzzs-script] by Rickzzs. It's a script to dump all of the C sided functions which I think is really neat. I haven't tried using it myself, but as Klei updates the game I'll definitely think about using it to see what's changed.

<!-- Like in HTML, single newlines don't affect the output. -->
Although not a dependency, I think that having a well maintained archive of the game's scripts is essential to getting full context as to how the engine is being utilized and also to appreciate how the Lua side really comes together. 

I've added the [dst_gamescripts repository](https://github.com/penguin0616/dst_gamescripts) which is maintained by [penguin0616] and [Hornet] as a `git submodule`.

<!-- Not necessary, clogs up the visuals, probably just confuses people if I include this -->
<!-- 
To create a `submodule` within `git`:

    git submodule add <remote-url> [path]

If `path` is not specified, the resulting cloned repo's folder will take on the original project's folder name and it'll go to the current working directory.

For this repository, I set it to a directory to be called `./scripts/`.

    git submodule add https://github.com/penguin0616/dst_gamescripts scripts

As always, `git fetch` and `git pull` are your best friends when it comes to updating. 
-->

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

