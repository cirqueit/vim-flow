if exists("g:vim_flow_loaded") || &cp
  finish
endif
let g:vim_flow_loaded = 1

" make sure that vim is compiled with correct python2.7 suppor
if !has("python")
  echo "vim-flow requires python support"
  finish
endif

python <<EOF
from os import path as p
import sys
import vim

lib_path = p.abspath(p.join(vim.eval("expand('<sfile>:p:h')"), "../lib"))
sys.path.insert(0, lib_path)

import cli
EOF

" run flow for the current window
command! FlowRun :python cli.run_flow()

" toggle lock on / off for current file
command! FlowToggleLock :python cli.toggle_lock()
