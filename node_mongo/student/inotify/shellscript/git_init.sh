#!/bin/bash

#監視しているディレクトリ
monitor_dir=("etc" "var")
#現在の作業ディレクトリ
current_dir=`pwd`

#ディレクトリの有無を確認 なければ作成
if [ ! -d git ];then
 mkdir git
fi
cd /git

#監視しているディレクトリをコピー
for d in ${monitor_dir[@]}; do
 cp -rp /${d} .
 cp -rp ${d}/ ${d}"_back"  
done

#取得するログを格納するディレクトリ
#取得したいログファイルを課題に合わせて作成
if [ ! -d log ];then
 mkdir log
 touch log/git_cmd.log
 touch log/httpd_conf.log
 touch log/diff.log
fi

#gitコマンド
#実行したコマンド結果をgit_cmd.logに保存
git init >> log/git_cmd.log 
git add * >> log/git_cmd.log 
git commit -m "0" >> log/git_cmd.log 

#元の作業ディレクトリに戻る
cd "$current_dir"
