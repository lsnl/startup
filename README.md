# startup

## 100 tips を読む

- [100 tips for your successful undergraduate/graduate school life/充実した大学・大学院生活のための 100 のヒント](http://www.lsnl.jp/~ohsaki/research/100-tips/)
- [100 tips for your successful laboratory life/充実した研究室生活のための 100 のヒント](http://www.lsnl.jp/~ohsaki/research/100-tips-lab/)
- [100 books for your successful research activities/充実した研究活動のための 100 の書籍](http://www.lsnl.jp/~ohsaki/research/100-books/)
- [10 tools for your successful research activities/充実した研究室生活のための 10 のツール](http://www.lsnl.jp/~ohsaki/research/10-tools/)
- [100 tools for your joyful computer life](http://www.lsnl.jp/~ohsaki/research/100-tools/)

これは、快適かつ有意義な研究生活を過ごすためのヒントです。また、大崎研
究室のルールでもあります。人に質問する方法や論文の書き方、ディレクトリ
の整理方法など、研究生活を行う上でのヒントがまとめられています。何か困っ
たときに、すぐに人に聞くのではなく、本当に質問すべき内容か、そうであれ
ばどのように質問すればよいかなどをこれを活用してください。

## PC のセットアップ

### Debian を入手

[Unofficial non-free images including firmware packages](http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/)

### Debian を PC にインストール

- ホストにインストールする場合 → install.md
- 仮想環境にインストールする場合 → virtualbox.md

#### Debian desktop environment のチェックを外す

xpywm を使うために、desktop environment はインストールしない。

### Caps Lock を Ctrl に割り当てる

`/etc/default/keyboard` の `XKBOPTIONS=""` を以下のように変更

```
XKBOPTIONS="ctrl:nocaps"
```

以下のコマンドを実行し、設定を反映させる。

```bash
/etc/init.d/console-setup.sh restart
```

### ネットワークの設定

Host に Debian をインストールした場合、ネットワークの設定を行う必要がある。 → network.md

### 必須アプリケーションのインストール

```bash
apt install sudo emacs25
```

### 自分をスーパーユーザにする

ユーザ名が hagi のとき、以下のコマンドを root で実行

```bash
adduser hagi sudo
```

### xpywm, xpymon, xpylog をインストール

- [xpywm](https://pypi.org/project/xpywm/)
- [xpymon](https://pypi.org/project/xpymon/)
- [xpylog](https://pypi.org/project/xpylog/)

#### pip3 のインストール

```bash
sudo apt install python3-pip
```

#### xpywm, xpymon に必要なパッケージをインストール

```bash
sudo apt install xserver-xorg xbase-clients rxvt-unicode wireless-tools
```

#### オプショナルだが、ほぼ必須のパッケージをインストール

```bash
sudo apt install redshift xfonts-terminus firefox-esr
```

#### xpywm, xpymon, xpylog をインストール

```bash
sudo pip3 install -U xpywm xpymon xpylog
```

#### sendscreen をインストール

```bash
sudo pip3 install sendscreen
```

##### moon のアドレスを登録

`/etc/hosts` に以下を追加する。

```
192.168.1.108 moon
```

アドレスを登録することによって、`sendscreen -s moon` で画面の送信が可能になる。

### dotfiles をホームディレクトリにコピー

Git を用いてサーバから取得する。

```bash
sudo apt install git
git clone https://github.com/lsnl/startup.git
cp -r startup/dotfiles/. ~
```

### mew 設定

```bash
emacs ~/.mew.el
```

```elisp
(setq mew-config-alist
        '(("default"
           ("proto" . "%")
           ("name" . "Your Name")
           ("user" . "abc12345")
           ("mail-domain" . "kwansei.ac.jp")
           ("smtp-user" . "abc12345@nuc.kwansei.ac.jp")
           ("smtp-server" . "smtp.office365.com")
           ("smtp-auth" . t)
           ("smtp-ssl-port" . "587")
           ("smtp-port" . "587")
           ("smtp-ssl" . t)
           ("imap-server" . "outlook.office365.com")
           ("imap-user" . "abc12345@nuc.kwansei.ac.jp")
           ("imap-ssl" . t)
           ("imap-port" . "143")
           ("imap-delete" . "nil")
           )))
```

### skk をインストール

```bash
sudo apt install ddskk skkdic uim uim-skk dbskkd-cdb skkdic-cdb
echo "(define default-im-name 'skk)" > ~/.uim
```

### fish をインストール

```bash
sudo apt install fish
chsh -s /usr/bin/fish
```
