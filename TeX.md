# TeX をインストール

```bash
sudo apt install texlive-full
```

## 大崎先生が作られたスタイルファイルを取得

```bash
sudo wget http://www.lsnl.jp/~ohsaki/software/tex/insertfig.sty -O /usr/share/texmf/tex/latex/insertfig.sty
sudo wget http://www.lsnl.jp/~ohsaki/software/tex/revhistory.sty -O /usr/share/texmf/tex/latex/revhistory.sty
```

スタイルファイル のインデックスを更新(？)
```bash
sudo mktexlsr
```

