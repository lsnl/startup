# startup  (2022)

## 100 tips を読む

- [100 tips for your successful undergraduate/graduate school life/充実した大学・大学院生活のための 100 のヒント](http://www.lsnl.jp/~ohsaki/research/100-tips/)
- [100 tips for your successful laboratory life/充実した研究室生活のための 100 のヒント](http://www.lsnl.jp/~ohsaki/research/100-tips-lab/)
- [100 books for your successful research activities/充実した研究活動のための 100 の書籍](http://www.lsnl.jp/~ohsaki/research/100-books/)
- [10 tools for your successful research activities/充実した研究室生活のための 10 のツール](http://www.lsnl.jp/~ohsaki/research/10-tools/)
- [100 tools for your joyful computer life](http://www.lsnl.jp/~ohsaki/research/100-tools/)

これは、快適かつ有意義な研究生活を過ごすためのヒントです。また、大崎研究室のルールでもあります。人に質問する方法や論文の書き方、ディレクトリの整理方法など、研究生活を行う上でのヒントがまとめられています。何か困ったときに、すぐに人に聞くのではなく、本当に質問すべき内容か、そうであればどのように質問すればよいかなどをこれを活用してください。

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

Host に Debian をインストールした場合、ネットワークの設定を行う必要がある。 → https://github.com/lsnl/startup/network-installation-2022.md

### 必須アプリケーションのインストール

```bash
apt install sudo emacs
```

### 自分をスーパーユーザにする

ユーザ名が xxx のとき、以下のコマンドを root で実行

```bash
adduser xxx sudo
```

### startx のインストール

```
wget -O - lsnl.jp/xpywm | sh
tar xzvf home.tgz
startx
```

### fish をインストール

```bash
sudo apt install fish
chsh -s /usr/bin/fish
```

### fsever の設定

 → https://github.com/lsnl/startup/fserver-2022.md
