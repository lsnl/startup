# startup

## 100 tips を読む

* [100 tips for your successful undergraduate/graduate school life/充実した大学・大学院生活のための 100 のヒント](http://www.lsnl.jp/~ohsaki/research/100-tips/)

* [100 tips for your successful laboratory life/充実した研究室生活のための 100 のヒント](http://www.lsnl.jp/~ohsaki/research/100-tips-lab/)

- [100 books for your successful research activities/充実した研究活動のための 100 の書籍](http://www.lsnl.jp/~ohsaki/research/100-books/)

- [10 tools for your successful research activities/充実した研究室生活のための 10 のツール](http://www.lsnl.jp/~ohsaki/research/10-tools/)

- [100 tools for your joyful computer life](http://www.lsnl.jp/~ohsaki/research/100-tools/)

これは、快適かつ有意義な研究生活を過ごすためのヒントです。また、大崎研
究室のルールでもあります。人に質問する方法や論文の書き方、ディレクトリ
の整理方法など、研究生活を行う上でのヒントがまとめられています。何か困っ
たときに、すぐに人に聞くのではなく、本当に質問すべき内容か、そうであれ
ばどのように質問すればよいかなどをこれを活用してください。

## PC のセットアップ

### Debian を入手する。

[Unofficial non-free images including firmware packages](http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/)

### Debian をインストールするためのディスクを作成する。

`sudo fdisk -l` で、USB がどのような名前で認識されているかを確認する。

`/dev/sdb1` という名前で認識されていた場合を記述する。

#### アンマウントする

`sudo umount /dev/sdb1`

#### フォーマットする

`sudo mkfs.vfat /dev/sdb1`

#### 書き込む

`sudo dd if=/home/hagi/Downloads/debian.iso of=/dev/sdb1 bs=1048576`

### Debian を PC にインストールする。

#### BIOS の設定

Secure Boot を無効化
ブートの方法を Legacy Only
ブート順の変更(USB を SSD より前にする)

#### Debian desktop environment のチェックを外す．

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

管理者 (root)で以下のコマンドを実行。
パスワードを入力する。

```
wpa_passphrase "lsnl" >> /etc/wpa_supplicant/wpa_supplicant.conf
```

`iwconfig` でインターフェース名を確認する。

```
wlp2s0    IEEE 802.11  ESSID:off/any
          Mode:Managed  Access Point: Not-Associated   Tx-Power=22 dBm
          Retry short limit:7   RTS thr:off   Fragment thr:off
          Encryption key:off
          Power Management:on

lo        no wireless extensions.
enp0s31f6 no wireless extensions.
```

このとき、`wlp2s0` がインターフェース名

`/etc/network/interfaces` に設定を追加する。

```
iface wlp2s0 inet dhcp
	wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

`ifup wlp2s0` というコマンドでインターフェースが立ち上がる。

### 必須アプリケーションのインストール

```bash
apt install sudo emacs25
```

### 自分をスーパーユーザにする。

ユーザ名が hagi のとき、以下のコマンドを実行

```bash
adduser hagi sudo
```

### xpywm, xpymon, xpylog をインストール

xpywm, xpymon, xpylog
https://pypi.org/project/xpywm/
https://pypi.org/project/xpymon/
https://pypi.org/project/xpylog/

#### pip3 のインストール

```bash
sudo apt install python3-pip
```

#### xpywm, xpymon に必要なパッケージをインストールする。

```bash
sudo apt install xserver-xorg xbase-clients rxvt-unicode net-tools
```

#### オプショナルだが、ほぼ必須のパッケージをインストールする。

```bash
sudo apt install redshift xfonts-terminus firefox-esr
```

#### xpywm, xpymon, xpylog をインストールする。

```bash
sudo pip3 install -U xpywm xpymon xpylog
```

#### sendscreen をインストールする。

```bash
sudo pip3 install sendscreen
```

##### moon のアドレスを登録する。

`/etc/hosts` に以下を追加する。

```
192.168.1.108 moon
```

アドレスを登録することによって、`sendscreen -s moon` で画面の送信が可能になる。

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
