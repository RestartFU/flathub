#!/usr/bin/env bash
set -euo pipefail

source packaging/common/stage-payload.sh
stage_runtime_binaries "$FLATPAK_DEST/bin"
stage_resources "$FLATPAK_DEST/share/cinnabar" "$ASSETC"
install -Dm0644 packaging/linux/cinnabar.desktop "$FLATPAK_DEST/share/applications/cinnabar.desktop"
install -Dm0644 packaging/icons/cinnabar.svg "$FLATPAK_DEST/share/icons/hicolor/scalable/apps/cinnabar.svg"
install -Dm0644 app.cinnabar.client.metainfo.xml "$FLATPAK_DEST/share/metainfo/app.cinnabar.client.metainfo.xml"
install -Dm0644 LICENSE "$FLATPAK_DEST/share/licenses/$FLATPAK_ID/LICENSE"
install -Dm0644 THIRD_PARTY_NOTICES.md "$FLATPAK_DEST/share/licenses/$FLATPAK_ID/THIRD_PARTY_NOTICES.md"
