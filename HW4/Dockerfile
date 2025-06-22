# Используем Nginx
FROM nginx:latest

# Немного о себе инфы
MAINTAINER Kaml

# Устанавливаю постгрес и чищу кэш
RUN apt-get update && \
    apt-get install -y --no-install-recommends postgresql && \
    rm -rf /var/lib/apt/lists/*

# Каталог для данных постгры
RUN mkdir -p /var/lib/postgresql/data

# Настраиваю рабочую директорию
WORKDIR /usr/share/nginx/html

# Переменные окружения для постгры
ENV POSTGRES_USER=user \
    POSTGRES_PASSWORD=password \
    POSTGRES_DB=mydb

# Копирую конфигурационные файлы nginx в контейнер
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Копирую исходные файлы 
COPY ./src/ .

# Добавляю доп файлы
ADD additional_files /usr/share/nginx/html/additional_files

# Указываю поинт для монтирования
VOLUME ["/usr/share/nginx/html/data"]

# Открываю порт
EXPOSE 80

# Запускаю от имени nginx
USER nginx

# Запускаю nginx в фоновом режиме
CMD ["nginx", "-g", "daemon off;"]
