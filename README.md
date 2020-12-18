# holofernes
ActiveDirectoryへのユーザ追加とグループ設定を行うPoShスクリプトです。

## Usage

1. userlist-sample.csvを例にuserlist.csvを作成
2. ドメインコントローラへDomain Adminsでログイン
3. スクリプト本体とuserlist.csvを設置
4. `PS>.\Add-ADUsers.ps1 .\userlist.csv`

## Warn

- OUとグループはあらかじめ作成しておく必要があります
- グループ名に`,`が入っているグループを扱う場合はスクリプト改造してください
- エラー処理の欠如
