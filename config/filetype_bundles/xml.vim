" ====================================================
"   Copyright (C) 2021  All rights reserved.
"
"   Author        : bbxytl
"   Email         : bbxytl@gmail.com
"   File Name     : xml.vim
"   Last Modified : 2021-04-02 12:23
"   Describe      : 
"
" ====================================================


" ###############################
" XML

Bundle 'ftplugin/xml.vim'
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete
" ————————————————
" 版权声明：本文为CSDN博主「RobotSlam」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
" 原文链接：https://blog.csdn.net/sinat_38343378/article/details/78360978
