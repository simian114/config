# Chad Custom config

## 설치

1. brew install neovim
2. [install nerd fonts 설치](https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts)
3. [ripgrep 설치](https://github.com/BurntSushi/ripgrep)
4. [NvChad](https://nvchad.com/docs/quickstart/install) 설치
5. example config 선택 단계에서 꼭 y 누르기 (N 이 default)
6. lua 폴더에서 custom 제거 후 해당 repo clone 후에 이름을 nvim -> custom 으로 변경한다.
7. lsp server ([서버 목록 확인](doc/server_configurations.md))
  - eslint: npm i -g vscode-langservers-extracted 로 eslint 서버 설치해야함 [참고](npm i -g vscode-langservers-extracted)
  - prettier: [참고1](https://github.com/MunifTanjim/prettier.nvim), [참고2](https://github.com/fsouza/prettierd#installation-guide)
  - tailwindcss
  - prisma
    - syntax highlighting 을 위해서는 `TSInstall prisma` 를 해아함
8. core-mapping 의 <C-c> 주석. saga 에서 사용함
9. cmp.lua 의 mapping 설정에 아래 줄 추가해야함
  - ```
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ```


## nvchad config

### plugins

#### nvim-tree
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [help](https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt) 에서 키 매핑 확인 가능



## custom config 설명

### plugins
- autotag
- vim visual multi
  - multi cursor
- nvim surround
- lazygit


### mapping

## todo
- 여러 버퍼가 있을 때 `:q` 로 close 하면 current buffer 를 close 하게 함수 짜기
  - 확인 결과 `:ls` 를 하면 현재 open 되어있는 buffer 의 경우 `%` 가 붙어있음을 확인할 수 있음. 해당 값을 이용해서 어떻게 할 수 있는지 알아보자.([참고](https://vi.stackexchange.com/a/5485))


## key mapping

| spacebar is leader key

- <leader>ch 를 통해 cheat 확인 가능
- 기타 키는 mappings 파일 통해 확인

