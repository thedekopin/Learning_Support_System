#!/bin/bash

# 接続先情報
SSH_USER=root
SSH_PASS=root
SSH_HOST=student
REMOTE_CMD1="find /var/www/html/test.html"

# 後述のSSH_ASKPASSで設定したプログラム(本ファイル自身)が返す内容
if [ -n "$PASSWORD" ]; then
  cat <<< "$PASSWORD"
  exit 0
fi

# SSH_ASKPASSで呼ばれるシェルにパスワードを渡すために変数を設定
export PASSWORD=$SSH_PASS

# SSH_ASKPASSに本ファイルを設定
export SSH_ASKPASS=$0
# ダミーを設定
export DISPLAY=dummy:0

# SSH接続 & リモートコマンド実行
setsid ssh $SSH_USER@$SSH_HOST $REMOTE_CMD1
setsid ssh $SSH_USER@$SSH_HOST echo $?
