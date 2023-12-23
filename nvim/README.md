# nvim
## golang 디버깅
> [go-delve](https://github.com/go-delve/delve) 를 설치해야함
gopath 등록
```
export GOPATH=$HOME/go
export GOROOT=/usr/local/Cellar/go/1.12.7/libexec
export PATH=$GOPATH/bin:$PATH
export PATH=$PATH:$GOROOT/bin
```

## lazygit 설정

> [nvim lazygit](https://github.com/kdheepak/lazygit.nvim) 에서 `Using neovim-remote` 항목 가이드 참고. 해당 항목을 완전 동일하게 따라가면 파일 edit / open 에 버그 존재.

- 위 참고 링크를 따라 neovim-remote 설치
- 4번 항목의 vimrc 는 vimrc.vim 파일에 있음
- zshrc

  - ```
    if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
      alias nvim=nvr -cc split --remote-wait +'set bufhidden=wipe'
    fi
    if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
        export VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
        export EDITOR="nvr -cc split --remote-wait +'set bufhidden=wipe'"
    else
      export VISUAL="nvim"
      export EDITOR="nvim"
    fi

    alias vim="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#I.#P').pipe"
    alias vi="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#I.#P').pipe"
    alias v="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#I.#P').pipe"
    ```

- LazyGitConfig (Neovim 에서 `LazyGitConfig` 명령어 실행)
  - ```
    os:
      editCommandTemplate: 'nvr -O {{filename}}; nvr --remote-send "<c-w>o<cr>:set nu<cr>"'
      editAtLineAndWait: "nvim +{{line}} {{filename}}"
      editAtLine: 'nvr -O {{filename}}; nvr --remote-send "<c-w>o<cr>:{{line}}<CR>:set nu<cr>"'
    ```

## iterm2 설정

> 자동완성 리스트 토글

1. preferenes
2. profiles
3. keys
4. key mappings
5. ![Screenshot 2023-09-07 at 11 33 17 PM](https://github.com/simian114/nvim/assets/49119625/3e01ffc2-6eab-43ef-a12d-51c53a533921)
6. opt + esc 로 ¡ send
7. cmd 매핑
  - cmd + k -> opt + k
  - cmd + q -> opt + k
  - cmd + e -> opt + r
  - cmd + a -> opt + a
  - cmd + d -> opt + d

## tmux 설정
