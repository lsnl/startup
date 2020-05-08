# ホストに Debian をインストールする

インストールするためには、 Bootable USB を作成する必要がある

## Bootable USB の作成

### Debian を入手

[Unofficial non-free images including firmware packages](http://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/)

### Debian をインストールするためのディスクを作成

`sudo fdisk -l` で、USB がどのような名前で認識されているかを確認する。

`/dev/sdb1` という名前で認識されていた場合を記述する。

#### アンマウント

`sudo umount /dev/sdb1`

#### フォーマット

`sudo mkfs.vfat /dev/sdb1`

#### 書き込む

`sudo dd if=/path/to/debian.iso of=/dev/sdb1 bs=1048576`

## Debian を PC にインストール

### BIOS の設定

- Secure Boot を無効化
- ブートの方法を Legacy Only
- ブート順の変更(USB を SSD より前にする)
