# ネットワークの設定

Debian を Host にインストールした場合、ネットワークの設定を行う必要がある。

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
