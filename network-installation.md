# ネットワークの設定

Debian を Host にインストールした場合、ネットワークの設定を行う必要がある。

管理者 (root)で以下のコマンドを実行。
パスワードを入力する。

## まず wpa_supplicant.conf というファイルを /etc/wpa_supplicant/ の下に作成する。

```
touch  /etc/wpa_supplicant/wpa_supplicant.conf
```

## /etc/wpa_supplicant/wpa_supplicant.conf` に設定を追加する

```
network={
	ssid=" Wifi-名"
	password="パスワード"
}
```

## `iwconfig` でインターフェース名を確認する。

```
lo        no wireless extensions.
enp0s31f6  no wireless extensions.
wlp0s20f3  IEEE 802.11  ESSID:off/any
          Mode: .......... 
          ................
          ................
          ................
          ................
```

このとき、`wlp0s20f3` がインターフェース名である

## `/etc/network/interfaces` に設定を追加する。

```
iface wlp0s20f3 inet dhcp
	wpa-conf /etc/wpa_supplicant/wpa_supplicant.conf
```

## `ifup wlp0s20f3` というコマンドでインターフェースが立ち上がる。

