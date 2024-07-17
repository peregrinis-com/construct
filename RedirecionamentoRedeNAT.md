# Redirecionamento de portas para Máquinas Virtuais com rede NAT

No VirtualBox, clique na Máquina Virtual desejada e acesse as suas configurações. Na parte da rede, troque para **NAT**. Acesse a mesma e ache o seu IP utilizando ```ip a```.

 Clique em **Avançado** e depois no botão **Redirecionamento de portas**. Crie regras conforme exemplos abaixo:

 ```
 Protocolo: SSH
 Endereço Hospedeiro: 127.0.0.1
 Porta Hospedeiro: 1122
 IP Convidado: 10.0.2.15
 Porta Convidado: 22
 ```

Perceba no exemplo acima que no caso de portas sensíveis, a porta mapeada no **Hospedeiro** deve ser uma outra, diferente do padrão. 

 ```
 Protocolo: App1
 Endereço Hospedeiro: 127.0.0.1
 Porta Hospedeiro: 3000
 IP Convidado: 10.0.2.15
 Porta Convidado: 3000
 ```

No exemplo acima não há problema em mapear a mesma porta no **Convidado** e **Hospedeiro**.