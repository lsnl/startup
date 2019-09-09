# fserv への接続方法

## サーバ管理者から ssh に必要な秘密鍵をもらう

サーバ管理者は、 ryota(@resedet ), soma(@syasin-5d )

## 秘密鍵を `~/.ssh` に配置する。

入手したファイルは、自分のホームディレクトリ以下の `.ssh` というフォルダに保存する。
このとき、パーミッションには注意をする。パーミッションが適切に設定されていない場合、ssh できない場合がある。

通常、パーミッションは以下の通り、

> `.ssh` directory `700 (drwx------)`
> public key (`.pub` file): `644 (-rw-r--r--)`
> private key (`id_rsa`): `600 (-rw-------)`

## ssh によるログイン（研究室内）

fserv の IP アドレスは、192.168.1.211 なのでこの IP アドレスを指定して接続する。

ログインするユーザ名が、 `joe` の場合の例は以下

```bash
ssh joe@192.168.1.211
```

## ssh によるログイン（研究室外）

www.lsnl.jp の 995 番ポートが、研究室内にある fserv の 22 番ポートに転送されている。
そのため、995 番ポートを指定する必要がある。

```bash
ssh -p 995 joe@www.lsnl.jp
```

## 新しい ssh 鍵で通信を行う

### 新しい ssh 鍵の生成

```bash
$ ssh-keygen -b 4096

Generationg public/private rsa key pair.
Enter file in which to save the key (/home/hagi/.ssh/id_rsa):
# 鍵の名前を決める。
# 自分がわかりやすい名前にする。
/home/hagi/.ssh/fserv_rsa

Enter passphrase (empty for no passphrase):
# ssh キーを利用するときのパスフレーズ
# 毎度パスワードを入力するのには手間がかかるので、何も入力せずに Enter

Enter same passphrase again:
# もう一度 Enter
```

`~/.ssh/` 以下に、`fserv_rsa` `fserv_rsa.pub` が生成される。
`fserv_rsa` は、秘密鍵。`fserv_rsa.pub` は、公開鍵

公開鍵を fserv の `~/.ssh/authorized_keys` に書き込むと、ssh によるログインができる。

### ssh 鍵を fserv に登録する。

自分の計算機から fserv に公開鍵を転送する。

```bash
rsync ~/.ssh/fserv_rsa.pub  joe@192.168.1.211:~/.ssh
```

fserv にログインし、fserv の `~/.ssh/authorized_keys` に書き込む。

```bash
# fserv にログインする。
ssh joe@192.168.1.211

# 転送した公開鍵を `~/.ssh/authorized_keys` に追記する。
cat ~/.ssh/fserv_rsa.pub >> ~/.ssh/authorized_keys
```

**新しくターミナルを立ち上げ**、今までの ssh 鍵で通信できるかを確認する。

> 確認せず exit し、ログインできなくなった場合自分のアカウントへ一生入れなくなる可能性があるため。

```bash
ssh joe@192.168.1.211
```

問題なくログインできれば、`exit` で fserv から抜ける。

### 新しい ssh 鍵で接続を確認する。

```bash
ssh -i ~/.ssh/fserv_rsa joe@192.168.1.211
```

## config ファイルの設定

ssh を行う際に毎度オプションを書いてもいいが、非常に手間がかかる。
なので、`config` というファイルを作成し、設定を記述する。

`~/.ssh/config` というファイルを作成し、以下のように設定を記述する。

```bash
Host fserv
    HostName www.lsnl.jp
    port 995
    user joe
    IdentityFile ~/.ssh/fserv_rsa
    forwardX11 yes
```

設定が記述できれば、以下のコマンドで fserv へログインできるかどうか確認する。

```bash
ssh fserv
```
