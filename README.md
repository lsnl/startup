# startup

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

### ネットワークの設定

`/etc/wpa_supplicant/wpa_supplicant.conf` を作成し、ファイルを以下のように編集する。

```
network = {
    ssid="ここに SSID(Wi-Fi の名前)を書く"
    psk="ここに Wi-Fi のパスワードを書く"
}
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

### プロキシの設定
```bash
export http_proxy=http://proxy.ksc.kwansei.ac.jp:8080
export https_proxy=http://proxy.ksc.kwansei.ac.jp:8080
export ftp_proxy=http://proxy.ksc.kwansei.ac.jp:8080
```

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
