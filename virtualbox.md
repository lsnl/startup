# virtualbox-setup

debian on virtualbox

# Debian Download

[Unofficial non-free images including firmware packages](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/current/amd64/iso-cd/)からディスクイメージをダウンロードする

# VirtualBox

1. [このページ](https://www.virtualbox.org/wiki/Downloads)から自分の OS にあったパッケージをダウンロードする

2. ダウンロードしたファイルを実行し、VirtualBox をインストールする

3. 「新規」をクリックする

4. 以下の通りに入力する
   ```
   名前: 任意()
   タイプ: Linux
   バージョン: Debian (64-bit)
   ```

5. メモリーサイズを選択する
   
6. 「仮想ハードディスクを作成する」を選択し、「作成」をクリックする

7. 「VDI (VirtualBox Disk Image)」を選択する

8. 「可変サイズ」を選択する

9. ファイルデータの上限を指定する

10. ホーム画面に戻り、上記で作成した仮想マシンの「設定」をクリックする

11. ストレージ→コントローラー:IDE→空→属性 内のディスクのマークをクリックする. 「仮想光学ディスクの選択/作成」をクリックして、上記でダウンロードした iso ファイルを選択する

12. ホーム画面に戻り、上記で作成した仮想マシンの「起動」をクリックすると Debian が起動する(はず)

## 参考
- [VirtualBox](https://www.virtualbox.org/)

# Debian Installation

## 参考
- https://github.com/lsnl/startup
- https://github.com/iPolyomino/debian-setup
- https://github.com/yukiue/debian-setup
