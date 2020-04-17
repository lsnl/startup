# 辞書

EPWING 形式の辞書を Emacs から利用する。

## EPWING 形式の辞書を購入

- [ヤフオク](https://auctions.yahoo.co.jp/)
- [メルカリ](https://www.mercari.com/jp/)

## 辞書のデータを自身の計算機にコピー

コピーする場所はどこでも問題ない。
ここでは、`~/dict` というディレクトリにコピーする。

```bash
sudo mkdir /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom
mkdir ~/dict
cp -r /mnt/cdrom ~/dict/kojien
sudo umount /mnt/cdrom
```

## 必要なパッケージのインストール

```bash
sudo apt install eblook lookup-el
```

## `~/.emacs.el` に設定を書く

```
(setq lookup-search-agents
  '(
    (ndeb "~/dict/kojien")
  ))
(setq lookup-enable-splash nil)
(autoload 'lookup "lookup" nil t)
(autoload 'lookup-region "lookup" nil t)
(autoload 'lookup-pattern "lookup" nil t)
(global-set-key (kbd "M-d ") 'lookup-pattern)
(global-set-key (kbd "M-D ") 'lookup-region)
(setq lookup-default-dictionary-options
'((:stemmer . stem-english)))
(setq lookup-use-kakasi nil)
```
