# Note

<!-- Like in HTML, single newlines don't affect the output. -->
This repository relies on the
[dst_gamescripts repository](https://github.com/penguin0616/dst_gamescripts) which is maintained by 
[penguin0616](https://github.com/penguin0616) and 
[Hornet](https://github.com/omaremad74).

# TODO: Resolving Dependices

# Adding Dependencies

To create a "dependency" within `git`:

    git submodule add <remote-url> [custom-directory-name]

If `custom-directory-name` is not specified, the resulting cloned repo's folder will take on the original project's name.

For this repository, I set it to the `./scripts/` directory.

    git submodule add https://github.com/penguin0616/dst_gamescripts scripts

Note that if I simply ran `git clone`, you'd also automatically get the full 500 MB repo! That may or may not be what you want.
