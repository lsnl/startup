# startup

### エディッタのインストール

```bash
apt install sudo vim
```

### i3wm をインストール

[i3](https://i3wm.org/)

#### i3 のインストール

```bash
sudo apt install i3
```

`~/.xinitrc` に以下を追記する。

```bash
exec i3
```

#### オプショナルだが、ほぼ必須のパッケージをインストールする。

```bash
sudo apt install i3status dmenu
```

#### sendscreen をインストールする。

```bash
sudo pip3 install sendscreen
```

##### sendscreen するときに、画面がはみ出ないようにする

```bash
sudo apt install wmctl xdotool
```

`.config/i3/config` に追記する。

```
bindsym Mod1+Control+apostrophe floating toggle, exec "wmctrl -i -r $(printf 0x%x $(xdotool getwindowfocus)) -e 0,0,0,800,600"
```

Mod1+Control+apostrophe で、800 x 600 にウィンドウサイズを設定することができる。

##### moon のアドレスを登録する。

`/etc/hosts` に以下を追加する。

```
192.168.1.108 moon
```

アドレスを登録することによって、`sendscreen -s moon` で画面の送信が可能になる。

### mozc をインストール

```bash
$ sudo apt install fcitx fcitx-mozc dbus-x11
```

```bash
$ im-config
```

`fcitx` を選択

```
$ fcitx-configtool
```

`mozc` を追加

`~/.xinitrc` に以下を追記する。

```
export DefaultImModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx-autostart
```

### zsh をインストール

```bash
sudo apt install zsh
chsh -s /usr/bin/zsh
```
