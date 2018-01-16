#!/bin/bash

#監視しているディレクトリ
monitor_dir=("etc" "var")
#現在の作業ディレクトリ
current_dir=`pwd`

cd /git

#監視しているディレクトリをコピー
for d in ${monitor_dir[@]}; do
 cp -rp ${d}/ ${d}"_back"  
 sudo cp -rp /${d} .
done

#diffコマンド
#授業の課題に従いコマンドを設定する
for d in ${monitor_dir[@]}; do
 diff -ru ${d}"_back" ${d} >> log/diff.log
done
diff -u etc_back/httpd/conf/httpd.conf etc/httpd/conf/httpd.conf >> log/httpd_conf.log

#gitコマンド
#実行したコマンド結果をgit_cmd.logに保存
git add * >> log/git_cmd.log 
git commit -m "0" >> log/git_cmd.log 

#元の作業ディレクトリに戻る
cd "$current_dir"