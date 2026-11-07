# Route pkg through tvpkg (https://github.com/termuxvoid/tvpkg) when installed.
# apt/apt-get remain unchanged. Installed by termux-nightly; safe to remove.
# Loaded by login shells via profile.d and by bash subshells via ~/.bashrc.

_tvpkg_have() { command -v tvpkg >/dev/null 2>&1; }

_tvpkg_hint() {
    [ -e "${PREFIX:-/data/data/com.termux/files/usr}/var/lib/tvpkg-hint-shown" ] && return 0
    mkdir -p "${PREFIX:-/data/data/com.termux/files/usr}/var/lib" 2>/dev/null || true
    : > "${PREFIX:-/data/data/com.termux/files/usr}/var/lib/tvpkg-hint-shown" 2>/dev/null || true
    printf '%s\n' \
        "tvpkg is not installed yet (termuxvoid repo is configured). Run:" \
        "  pkg update && pkg install tvpkg" >&2
}

pkg() {
    if ! _tvpkg_have; then _tvpkg_hint; command pkg "$@"; return $?; fi
    case "${1-}" in
        uninstall) shift; command tvpkg remove "$@"; return $?;;
        show)      shift; command tvpkg info "$@";   return $?;;
        list-all)  shift; command tvpkg list "$@";   return $?;;
        autoclean|clean|files|fix|info|install|list|list-installed|remove|search|update|upgrade)
            command tvpkg "$@"; return $?;;
    esac
    command pkg "$@"
}
