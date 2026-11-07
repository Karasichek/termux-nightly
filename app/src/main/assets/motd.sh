#!/data/data/com.termux/files/usr/bin/bash

# Termux-nightly MOTD
shopt -s checkwinsize 2>/dev/null || true
COLUMNS=$(stty size 2>/dev/null | awk '{print $2}')
[ -z "$COLUMNS" ] && COLUMNS=80

_shell="${SHELL:-${PREFIX:-/data/data/com.termux/files/usr}/bin/bash}"
_shell="${_shell##*/}"

if command -v figlet >/dev/null 2>&1 && command -v lolcat >/dev/null 2>&1; then
    figlet -c "Welcome back!" 2>/dev/null | lolcat 2>/dev/null
elif command -v figlet >/dev/null 2>&1; then
    figlet -c "Welcome back!" 2>/dev/null
else
    printf '\n  \e[1mWelcome back!\e[0m\n'
fi

printf '\n  You are in \e[1mTermux-nightly\e[0m\n\n'
printf '    Project github:  Termux-nightly |  \e[4mgithub.com/Karasichek/termux-nightly\e[0m\n'
printf '    Package manager: tvpkg          |  \e[4mgithub.com/termuxvoid/tvpkg\e[0m\n\n'
printf '    Current shell:   %s\n\n' "$_shell"
printf '    Using tvpkg open an interactive menu. Supports touch control!\n'
printf '    ↑/↓ move   ←/→ action   enter run   esc close\n\n'
printf '  Good luck!\n\n'
