# Dependencies

This repository relies on the `dst-gamescripts` GitHub repository by penguin0616 and Hornet.

To get the dependency and copy it to the current dir:
```shell
git submodule add remote-url custom-directory-name
```
If `custom-directory-name` is not specified, the resulting repo's folder will take on the original project's name.

For example, without a custom directory name:
```shell
git submodule add https://github.com/penguin0616/dst_gamescripts
```
With a custom directory name:
```shell
git submodule add https://github.com/penguin0616/dst_gamescripts scripts
```
