#!/bin/bash

log_file="./script.log"

log() {
    echo "$1" | tee -a "$log_file"
}

if ! getent group dev > /dev/null; then
    groupadd dev
    log "Группа dev создана."
else
    log "Группа dev уже существует."
fi

awk -F: '$3 >= 1000 && $1 != "nobody"' /etc/passwd | while IFS=: read -r username _; do
    if id "$username" &>/dev/null; then
        usermod -aG dev "$username"
        log "Пользователь $username добавлен в группу dev."
    fi
done

if ! grep -q '^%dev ALL=(ALL) NOPASSWD: ALL' /etc/sudoers; then
    echo '%dev ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
    log "Группе dev выданы права sudo без пароля."
else
    log "Группа dev уже имеет права sudo без пароля."
fi

while getopts "d:" option; do
    case $option in
        d)
            directory_path="$OPTARG"
            ;;
    esac
done

if [[ -z "$directory_path" ]]; then
    read -rp "Введите путь до корневой директории: " directory_path
fi

if [ ! -d "$directory_path" ]; then
    log "Ошибочка: путь к корневой директории недоступен"
    exit 1
fi

log "Создание рабочих директорий пользователей в $directory_path..."

awk -F: '$3 >= 1000 && $1 != "nobody"' /etc/passwd | while IFS=: read -r username _; do
    user_group=$(id -gn "$username")
    workdir="${directory_path}/${username}_workdir"

    mkdir -p "$workdir"
    chown "$username:$user_group" "$workdir"
    chmod 660 "$workdir"

    setfacl -m g:dev:r-- "$workdir"

    log "Директория $workdir создана для пользователя $username (владелец: $username, группа: $user_group)"
done

log "Все директории созданы. Лог сохранен в $log_file."
