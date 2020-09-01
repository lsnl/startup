# TeX をインストール

```bash
sudo apt install texlive-full
```

## 大崎先生が管理する bib ファイルと大崎先生が作られたスタイルファイルを取得

http://www.lsnl.jp/~ohsaki/research/100-tips-lab/

> fserv:~ohsaki/bib の bib ファイルはそのまま使用する (複製 → 編集を _しない_)
>
> fserv:~ohsaki/bib へのシンボリックリンクを張るか、 環境変数 BIBINPUTS に ~ohsaki/bib を追加しましょう。
>
> fserv:~ohsaki/bib の bib ファイルを変更したい時は、 差分ファイル (diff -u の出力) を送ってください。
>
> スタイルファイルは Debian のパッケージのものをそのまま利用する
>
> texlive-base と texlive-extra パッケージに必要なほとんどの スタイルファイルが含まれています。
>
> 追加的なスタイルファイルは macro/ ディレクトリにコピーを置く
>
> fserv:~ohsaki/inputs のスタイルファイルはそのまま使用する (複製 → 編集を _しない_)
>
> fserv:~ohsaki/inputs へのシンボリックリンクを張るか、環境変数 TEXINPUTS に ~ohsaki/inputs を追加しましょう。

### fserv から必要なディレクトリを rsync でとってくる

```bash
rsync -av fserv:~ohsaki/inputs/ /path/to/fserv/home/ohsaki/inputs/
rsync -av fserv:~ohsaki/bib/ /path/to/fserv/home/ohsaki/bib/
```

### 環境変数を追加

bash, zsh

```bash
export TEXINPUTS="$TEXINPUTS:/path/to/fserv/home/ohsaki/inputs//"
export BIBINPUTS="$BIBINPUTS:/path/to/fserv/home/ohsaki/bib/"
```

fish

```fish
set -x TEXINPUTS .:/path/to/fserv/home/ohsaki/inputs//:/usr/share/texlive/texmf-dist//:/etc/texmf//
set -x BIBINPUTS .:/path/to/fserv/home/ohsaki/bib/
```

(※ `/path/to/fserv/ohsaki` は各自適切に設定してください。)