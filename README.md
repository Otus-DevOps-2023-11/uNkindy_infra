### Описание ДЗ №3 Otus DevOps

В рамках выполнения ДЗ были выполнены следующие этапы:
1. Был создан аккаунт Yandex Cloud
2. Были созданы 2 ВМ bastion и someinternalhost с указанными в ДЗ ресурсами

IPs:
bastion = 178.154.206.227 (external IP), 10.128.0.25 (internal IP)
someinternalhost = 10.128.0.34 (internal IP)
user = kita

3. Проверяем доступ до ВМ bastion через SSH:

```console
➜  Desktop ssh -i ~/.ssh/id_rsa kita@178.154.206.227
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Sat Dec 23 11:47:49 2023 from 95.72.106.126
kita@bastion:~$
```
4. Сделаны настройки, позволяющие подключаться к someinternalhost с bastion хоста. Проверим:

```console
➜  Desktop ssh -i ~/.ssh/id_rsa -A kita@178.154.206.227
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Sat Dec 23 11:56:20 2023 from 95.72.106.126
kita@bastion:~$ ssh kita@10.128.0.34
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Sat Dec 23 11:43:41 2023 from 10.128.0.25
kita@someinternalhost:~$
```

5. __Дополнительные задания__

- ___Возможность подключения к хосту someinternalhost в одну команду.___ Предлагается использовать bastion хост как jump хост для подключения к хосту someinternalhost. При этом команда подключения будет выглядеть следующим образом:

```console
➜  Desktop ssh -J kita@178.154.206.227 10.128.0.34
```
Проверим:
```console
➜  Desktop ssh -J kita@178.154.206.227 10.128.0.34
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Sat Dec 23 12:01:22 2023 from 10.128.0.25
kita@someinternalhost:~$
```
- ___Возможность подключения к хосту someinternalhost в одну команду.___ Для подключения к хостам по протоколу ssh без параметров предлагается использовать стандартные alias для ssh (config). Создадим файл ~/.ssh/config (добавлен в репозиторий), пропишем хосты bastion и someinternalhost в конфигурацию.

Проверим подключение:

```console
➜  Desktop ssh bastion
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Sat Dec 23 12:01:20 2023 from 95.72.106.126
kita@bastion:~$
```

```console
➜  Desktop ssh someinternalhost
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
Failed to connect to https://changelogs.ubuntu.com/meta-release-lts. Check your Internet connection or proxy settings

Last login: Sat Dec 23 12:06:19 2023 from 10.128.0.25
kita@someinternalhost:~$
```
6. Установлен сервер pritunl на хост bastion при помощи скрипта setupvpn.sh. В скрипте исправлены ошибки
7. Настроен сервер pritunl через web интерфейс
8. Сформирован файл конфигурации для openvpn (прилагаю)
9. Организовано VPN подключение с локального хоста к bastion хосту:

```console
5: tun0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group default qlen 500
    link/none
    inet 192.168.241.2/24 scope global tun0
       valid_lft forever preferred_lft forever
    inet6 fe80::55d6:9db1:f90:89e0/64 scope link stable-privacy
       valid_lft forever preferred_lft forever
```
10. Проверена возможность подключения по ssh к хосту someinternalhost через VPN:

```console
➜  Desktop ssh kita@10.128.0.25
The authenticity of host '10.128.0.25 (10.128.0.25)' can't be established.
ED25519 key fingerprint is SHA256:NOsfKv16cB8XGz1UP6bA6I8Md3ItoAeFoEEb9SnRfnE.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:4: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.128.0.25' (ED25519) to the list of known hosts.
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-169-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage
New release '22.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Sat Dec 23 12:11:31 2023 from 95.72.106.126
kita@bastion:~$
```
11. Дополнительное задание: не охото разбираться=D
