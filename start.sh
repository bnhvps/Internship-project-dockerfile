#!/bin/bash


[ ! -d "medusa-store-admin" ] && clone-admin-repo
[ ! -d "medusa-store-frontend" ] && clone-frontend-repo

clone-frontend-repo () {
git clone https://github.com/bnhvps/medusa-store-storefront.git medusa-store-frontend \
    && cd medusa-store-frontend 
    # && npm install
}

clone-admin-repo() {
git clone https://github.com/bnhvps/medusa-store-Admin-Panel.git medusa-store-admin \
    && cd medusa-store-admin
    # && npm install &
}


tmux new-session -d -s multisession

tmux rename-window -t multisession:0 'medusa-store-admin'
tmux send-keys -t multisession:0 "cd medusa-store-admin && npm install && npm run dev" C-m

tmux new-window -t multisession:1 -n 'medusa-store-frontend'
tmux send-keys -t multisession:1 "cd medusa-store-frontend && npm install && npm run dev" C-m

tmux new-window -t multisession:2 -n 'sync-project'
tmux send-keys -t multisession:2 "pip install requirements.txt && python3 sync.py" C-m

tmux attach-session -t multisession
