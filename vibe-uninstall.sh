#!/usr/bin/env bash
# 바이브코딩 수업용 설치물 제거 (Git 및 git config는 원래 있던 것이라 건드리지 않음)
set -u
echo "다음 항목을 삭제합니다:"
L=(/home/neojun6007/opencode/vibe-tools ~/.omo ~/.config/opencode ~/.local/share/opencode ~/.local/state/opencode ~/.cache/opencode ~/.npm/_npx ~/.ssh/known_hosts)
printf '  %s\n' "${L[@]}"
[ -d ~/vibe-coding ] && echo "  (선택) ~/vibe-coding 실습 폴더"
read -rp "계속할까요? [y/N] " a; [ "$a" = y ] || exit 0
rm -rf "${L[@]}"
sed -i '/# >>> vibe-tools >>>/,/# <<< vibe-tools <<</d' ~/.zshrc
if [ -d ~/vibe-coding ]; then read -rp "실습 폴더 ~/vibe-coding도 지울까요? [y/N] " b; [ "$b" = y ] && rm -rf ~/vibe-coding; fi
echo "완료. 터미널을 새로 열어 주세요."
rm -f "$0"
