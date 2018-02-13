#!/bin/bash

#監視しているディレクトリ
monitor_dir=("etc" "var" "usr/local/src")
#現在の作業ディレクトリ
current_dir=`pwd`

#ディレクトリの有無を確認 なければ作成
cd /
if [ ! -d /git ]; then
    mkdir git
fi
cd git

git init > /inotify/commit_log

#監視しているディレクトリをコピー
for d in ${monitor_dir[@]}; do
 rsync -av /${d} . > /inotify/rsync_log
done

git add * >> /inotify/commit_log
git commit -m '0' >> /inotify/commit_log 

#元の作業ディレクトリに戻る
cd "$current_dir"
