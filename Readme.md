# config 모음

## iterm2

iterm2 설치 후 sanamterm 의 설정 적용

```sh
sh init.sh

sh symlink.sh
```

## tmux

## nvim

아래처럼 링크시킨다.

```sh
ln -s ~/config/nvim ~/.config/nvim
```

## karabiner

1. [karabiner-elements](https://karabiner-elements.pqrs.org/) 를 다운받는다.
   - version 14 까지 실행완료
2. 아래 명령어로 링크
3. complex_modifications 설정에서 원하는 설정 on

```sh
ln -s /Users/mac/Desktop/personal/config/karabiner ~/.config/karabiner/assets/complex_modifications
```

## raycast

> spotlight / alfred 같은 프로그램

1. [raycast](https://www.raycast.com/) 다운로드
2. 깃헙 계정 로그인
3. 최신 setting import
