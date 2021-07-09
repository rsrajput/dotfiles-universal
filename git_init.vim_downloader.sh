 #!/bin/bash

 cd /home/rsrajput/.config/nvim/ 
 mv init.vim init.vim.backup # backup existing file before download or deleting.
 
# download latest init.vim from github.

 curl -H 'Authorization: token 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' \
  -H 'Accept: application/vnd.github.v3.raw' \
  -O \
  -L https://raw.githubusercontent.com/rsrajput/dotfiles-universal/main/init.vim

 echo "init.vim successfully updated from Github repo."

# delete backup file if curl successfully downloaded init.vim from github.
if [ -f init.vim ] ; then
    rm init.vim.backup
fi
