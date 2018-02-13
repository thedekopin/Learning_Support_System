#! /bin/bash
cat -A /inotify/log/cmd.log | sed "s/\^G//g" | sed "s/\^\[\[C//g" | sed "s/\^\[\[K\$$//g" | sed "s/\^\[\[A//g" | sed "s/\$$//g" | sed "s/\^\[\[38\;5\;27m//g" | sed "s/\^\[\[0m//g" | sed "s/\^\[\[38\;5\;9m//g" | sed "s/\^\[\[48\;5\;10\;38\;5\;16m//g" | sed "s/\^M//g" | sed "s/\^\[\[m//g" > /inotify/cmd.log
