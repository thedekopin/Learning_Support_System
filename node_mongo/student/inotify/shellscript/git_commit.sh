#!/bin/bash

#監視しているディレクトリ
monitor_dir=("/etc" "/var" "/usr/local/src")
#現在の作業ディレクトリ
current_dir=`pwd`

cd /git

#監視しているディレクトリをコピー
for d in ${monitor_dir[@]}; do
 rsync -av ${d} . >> /inotify/rsync_log
done

#gitコマンド
#実行したコマンド結果をgit_cmd.logに保存
git add *  >> /inotify/commit_log
git commit -m "0" >> /inotify/commit_log

#元の作業ディレクトリに戻る
cd "$current_dir"
