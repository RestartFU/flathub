# Cinnabar Flatpak

Build with the Flatpak builder and the Freedesktop 26.08 SDK, including its Go
extension:

```sh
flatpak run --command=flathub-build org.flatpak.Builder app.cinnabar.client.json
flatpak install --user ./repo app.cinnabar.client
flatpak run app.cinnabar.client
```

The manifest builds the tagged client and its companion executables from source.
Rust build tools are pinned separately to satisfy the release's compiler requirement.
First-run setup prepares game assets in the user's Flatpak data directory.

Regenerate `cargo-sources.json` from the selected release's `Cargo.lock` using
[flatpak-cargo-generator](https://github.com/flatpak/flatpak-builder-tools/tree/74697c75b630d7330e77250fc13cb5ea688d9479/cargo).
Generate `go-sources.json` from both `core` and `tools/localserver`, including
the selected module downloads and the older `.mod` files required by their module
graphs. Each downloaded file must carry the SHA-256 of its public URL's response.

Keep the source pin, dependency lists, compiler version and AppStream release
metadata together when updating. Automatic source updates are disabled until those
inputs can be regenerated and validated together.
