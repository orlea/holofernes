# holofernes
ActiveDirectoryへのユーザ追加とグループ設定を行うPoShスクリプトです。

_2021/01/12更新_

workgroup環境用の類似スクリプトを作成しました。

## Usage

1. userlist-sample.csvを例にuserlist.csvを作成
2. ドメインコントローラへDomain Adminsでログイン
3. スクリプト本体とuserlist.csvを設置
4. `PS>.\Add-ADUsers.ps1 .\userlist.csv`

## Warn

- OUとグループはあらかじめ作成しておく必要があります
- グループ名に`,`が入っているグループを扱う場合はスクリプト改造してください
- エラー処理の欠如
- 明示的にリストへ記入しなければUsersには入らない
