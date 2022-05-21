計算用 (研究室のメンバー向け)

計算用のサーバーを使いためには ~/.ssh/config に以下のものを追加する必要がある  

```
Host cserv1
Hostname 192.168.1.212
ProxyJump fserv
User xxx
IdentityFile ~/.ssh/id_ed25519

Host cserv2
Hostname 192.168.1.213
ProxyJump fserv
User xxx
IdentityFile ~/.ssh/id_ed25519

Host cserv3
Hostname 192.168.1.214
ProxyJump fserv
User xxx
IdentityFile ~/.ssh/id_ed25519
```
