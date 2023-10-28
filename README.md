# Overview

This repository is a (probably futile) attempt to document as much as I can (or am patient enough to) document about DST's code. 

Firstly, there are 2 major parts to DST's code. The game engine, which is written in C++, and the scripting functionality, which you can do by writing Lua (`.lua`) scripts.

The game engine is inaccessible to us players while the scripts are free for us to poke around at. We can however at least know what functions are which since a lot of stuff is exposed from the Lua side. That is, we can call `debug.getinfo(<fn>)` on functions and get back a Lua table containing all sorts of information.

# Credits

Hornet [created a thread to document][engine-fn-list] the names of (most of) the engine functions at the time.

There's a reply to that same thread by Rickzzs'. It's a script to dump all of the C sided functions which I think is really neat. I haven't tried using it myself, but as Klei updates the game I'll definitely think about using it to see what's changed.

<!-- Like in HTML, single newlines don't affect the output. -->
Although not a dependency, I think that having a well maintained archive of the game's scripts is essential to getting full context as to how the engine is being utilized and also to appreciate how the Lua side really comes together. 

I've added the [dst_gamescripts repository](https://github.com/penguin0616/dst_gamescripts) which is maintained by [penguin0616] and [Hornet] as a `git submodule`.

# TODO: Resolving Dependices

# Personal Notes

To create a "dependency" within `git`:

    git submodule add <remote-url> [custom-directory-name]

If `custom-directory-name` is not specified, the resulting cloned repo's folder will take on the original project's name.

For this repository, I set it to the `./scripts/` directory.

    git submodule add https://github.com/penguin0616/dst_gamescripts scripts

Note that if I simply ran `git clone`, you'd also automatically get the full 500 MB repo! That may or may not be what you want.

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
[engine-fn-list]:https://forums.kleientertainment.com/forums/topic/126774-documentation-list-of-all-engine-functions/?do=findComment&comment=1623545
