## close-by-jumplist  

A plugin for vim to close buffer by vim's jumplist, and without break it.


                ,ad8888ba,  88888888ba          88   ~
               d8"'    `"8b 88      "8b         88   ~
              d8'           88      ,8P         88   ~
              88            88aaaaaa8P'         88   ~
              88            88""""""8b,         88   ~
              Y8,           88      `8b         88   ~
               Y8a.    .a8P 88      a8P 88,   ,d88   ~
                `"Y8888Y"'  88888888P"   "Y8888P"    ~

### Install  
```
Plug 'orlandoxu/close-by-jumplist'
```

### How to use:
```
:BdeleteByJumplist
```
The  command will help u close the buf by jumplist.

### how to ignore some buffer                      
You can use *g:close_by_jumplist_ignore_files* to ignore some buffer.
Like:
```viml
let g:close_by_jumplist_ignore_files = ['NERD_tree']
```
Notice: ['NERD_tree'] as default

### FAQ
1. Q: How to use cmd+w to close buffer in item2?  
> A: You can not use cmd key bindding, but there is a way to get around it.
> U can edit item2 preferences, "keys" => "+", enter the key you want to bindding, and select "send" action. Map the key to "\<C-o>\<C-h>" (You can change it to whatever u want.). Then map it in u'r '.vimrc' or 'init.nvim'

2. How to save buffer when close it?  
A: Map it like:
```
nnoremap <leader>s :w<CR>:BdeleteByJumplist<CR>
```
