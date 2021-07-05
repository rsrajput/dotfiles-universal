 #!/bin/bash

 cd /home/rsrajput/.config/nvim/ 
 rm init.vim
 
 # wget https://raw.githubusercontent.com/rsrajput/dotfiles-universal/main/init.vim
 
 curl -H 'Authorization: token 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' \
  -H 'Accept: application/vnd.github.v3.raw' \
  -O \
  -L https://raw.githubusercontent.com/rsrajput/dotfiles-universal/main/init.vim