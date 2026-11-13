# hbloader for Switch 2

based on nx-hbloader

The homebrew loader for Switch 2. kaiHEN runs it in a game process, it
starts hbmenu (`sdmc:/hbmenu.nro`), runs the program you pick, and returns to
hbmenu when the program exits.

Programs get the same environment as with nx-hbloader, so libnx
homebrew runs as usual. The loader does additional cleanup after NRO exits.

## Build

With the Switch 2 devkit installed in devkitPro:

```sh
make -C switch2 -f Makefile.clean
```

or with Docker (or Podman), in the devkit's image (`ounce-devkit`):

```sh
docker build --output out .     # -> out/main
```

The result, `build/clean/main` (`out/main` from Docker), is the game
process's `main` module.

## License

ISC, as upstream (`LICENSE.md`).
