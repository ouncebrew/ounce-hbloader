# nx-hbloader for Switch 2

The homebrew loader for Switch 2. kaiHEN runs it in a game process: it
starts hbmenu (`sdmc:/hbmenu.nro`), runs the program you pick, and returns to
hbmenu when the program exits.

Programs get the same environment as with upstream nx-hbloader, so libnx
homebrew runs as usual. The loader also cleans up after programs that exit
without tidying up, such as threads that SDL leaves running, so the next
program starts clean. If something cannot be cleaned up safely, it ends the
game process instead. What the last program left behind is written to
`/kaihen/nro-cleanup.txt`.

Based on nx-hbloader 82b9512. The Switch 1 loader is not included.

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
