//
//  WeekTilesView.swift
//  Habit Maker
//
//  Created by Volodymyr Myhailyuk on 04.01.2023.
//

import SwiftUI

struct WeekTilesView: View {
    let items = [
        DayModel(dayOfWeek: "Mon", dayOfMonth: 12),
        DayModel(dayOfWeek: "Tue", dayOfMonth: 13),
        DayModel(dayOfWeek: "Wed", dayOfMonth: 14),
        DayModel(dayOfWeek: "Thu", dayOfMonth: 15),
        DayModel(dayOfWeek: "Fri", dayOfMonth: 16),
        DayModel(dayOfWeek: "Sat", dayOfMonth: 17),
        DayModel(dayOfWeek: "Sun", dayOfMonth: 18),
    ]

    var rows: [GridItem] = [
        GridItem(.fixed(85))
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(items) {
                    DayTileView(dayModel: $0, isSelected: .constant(false))
                }
            }
            .frame(maxHeight: 85)
            .padding(.horizontal)
        }
    }
}

struct WeekTilesView_Previews: PreviewProvider {
    static var previews: some View {
        WeekTilesView()
    }
}

1 here is ~/.gitconfig file
[difftool "sourcetree"]
    cmd = opendiff \"$LOCAL\" \"$REMOTE\"
    path =
[mergetool "sourcetree"]
    cmd = /Applications/Sourcetree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
    trustExitCode = true
[user]
    name = decquart
    email = decquart@gmail.com
[commit]
    template = /Users/volodymyr.myhailyuk/.stCommitMsg
[filter "lfs"]
    clean = git-lfs clean -- %f
    smudge = git-lfs smudge -- %f
    process = git-lfs filter-process
    required = true
[core]
    excludesfile = /Users/volodymyr.myhailyuk/.gitignore_global
[credential]
    helper = manager
Do not have  ~/.gitconfig.local and .git/config available in the file system
2 Here is "printenv" output:
__CFBundleIdentifier=com.apple.Terminal
TMPDIR=/var/folders/dv/n71s43k96qd44k008cr3vyyr0000gp/T/
XPC_FLAGS=0x0
LaunchInstanceID=E953CB69-B558-4BF2-89CC-4C8A883527DE
TERM=xterm-256color
SSH_AUTH_SOCK=/private/tmp/com.apple.launchd.oRe5b2BS4F/Listeners
SECURITYSESSIONID=186b2
XPC_SERVICE_NAME=0
TERM_PROGRAM=Apple_Terminal
TERM_PROGRAM_VERSION=445
TERM_SESSION_ID=CA27E312-26B7-4B0B-8039-347AFA6C8E45
SHELL=/bin/zsh
HOME=/Users/volodymyr.myhailyuk
LOGNAME=volodymyr.myhailyuk
USER=volodymyr.myhailyuk
PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/Apple/usr/bin
SHLVL=1
PWD=/Users/volodymyr.myhailyuk
OLDPWD=/
LC_CTYPE=UTF-8
_=/usr/bin/printenv
3 Do not have .git/hook file
4 Do not have ~/.bashrc, ~/.bash_profile, ~/.zshrc files
5 "git config --get-regexp alias" gives no output
