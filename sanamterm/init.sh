#!/bin/bash

function check_and_install {
  local program=$1
  local install_command=$2

  if ! command -v "$program" &> /dev/null; then
    echo "$program 명령어가 없습니다. 설치를 진행합니다..."
    eval "$install_command"
  else
    echo "$program 명령어가 이미 존재합니다..."
    return 0
  fi
}

# Homebrew 설치
check_and_install "brew" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

# oh my zsh 설치
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# z 설치
check_and_install "z" 'git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z'

# pet 설치
check_and_install "pet" "brew install knqyf263/pet/pet"

# tmux copy-mode 에서 복사 시 clipboard 에 저장
brew install reattach-to-user-namespace

