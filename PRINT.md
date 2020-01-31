# プリンタを使った印刷
## 概要

Linux におけるプリンタを使った印刷は基本的に、`/etc/hosts/`
`/etc/printcap` に設定を記述し、`lpr FILENAME.pdf`で可能である。しかし、
研究室で使用しているプリンタ HL-L2365DW では、pdf ファイルをそのまま印
刷することはできない。印刷するためには、プリンタで印刷可能なファイル形
式 (以下 br3 形式) に変換する必要がある。以下では HL-L2365DW を使った
pdf の印刷方法について説明する

また、以下ではコメントを % 以降に記述する

## 設定
### lpr パッケージをインストールする

```bash
sudo apt install lpr
```

### /etc/hosts に使用するプリンタの IP アドレスの情報を追加する

```
192.168.1.XXX hll2365
```

使用するプリンタの IP アドレスは机の島によって異なる。自分の机の島のプ
リンタの IP アドレスを確認して追加する。

% 自分の島のプリンタを責任を持って管理・使用する。例えば自分の島のプリ
ンタが壊れたとき、壊れたプリンタを "誰かが直してくれるだろう" と考えて
放置し他の島のプリンタを使用するのではなく、自分たちで壊れたプリンタを
修理する。

### `/etc/printcap` を以下のように設定する

```
lp|Brother HL-L2365DW:\
        :lp=:rm=hll2365:rp=lp:sd=/var/spool/lpd/lp:\
        :lf=/var/log/lp-errs:mx#0:
        :if=/opt/brother/Printers/BrGenML1/lpd/filter_BrGenML1:
```

### ps2br3 の設定

64 ビット版 をインストールしている場合、32 ビット版のパッケージをインストールする。

```bash
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386
```
% 3 つ全て必要か不明
ref: https://askubuntu.com/questions/454253/how-to-run-32-bit-app-in-ubuntu-64-bit

`fserv:/home/kaz/tmp/brother` をディレクトリごとローカルに落とし、
`/usr/local/stow/brother` に置く

% ps2br3 はシェルスクリプトなので中身を見ればファイルの配置場所などは
分かると思います

stow パッケージをインストールする。/usr/local 以下にシンボリックリンク
を生成する。

```bash
sudo apt install stow
cd /usr/local/stow
sudo stow -v brother
```

`sudo  lpc restart lp`

## 印刷
  
```bash
pdf2ps FILENAME.pdf FILENAME.ps
ps2br3 < FILENAME.ps > FILENAME.br3
lpr FILENAME.br3 
```
