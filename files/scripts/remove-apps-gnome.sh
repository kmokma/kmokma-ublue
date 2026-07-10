#!/usr/bin/env bash
flatpak remove --system -y org.gnome.TextEditor || true
flatpak remove --system -y org.mozilla.thunderbird_esr || true