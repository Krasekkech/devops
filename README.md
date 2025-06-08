# Итоговая работа 
## Описание
Это итоговое задание по предмету DevOps. Формулировка задания: 
* запаковать ваше любое веб приложение в контейнеры с использованием compose/minikube
* обеспечить логирование вашего приложения в "централизованное хранилище" (loki/elasticksearch/clickhouse или любой продукт на выбор не из списка, главное чтобы поддерживался как источник данных в grafana)
* сделать возможность просмотров ваших логов через grafana
* сборка зависимостей кода должна быть описана через multistage если зависимости имеются
* сборка и развертывание контейнеров должно быть реализовано через bash скрипты. Скрипты должны иметь параметр запуска -t который задает тег образа который будет собран или запущен
 
## Ход работы

### 1. Запаковал приложение на spring java и react.ts с использованием docker compose
![Screen](https://github.com/Krasekkech/devops/blob/finalTest/screenshots/Снимок%20экрана%202025-06-08%20170024.png)

### 2. Обеспечил логирование через loki и дополнительно promtail для отправки логов в сам loki

### 3. Настроил grafana для просмотра логов
![Screen](https://github.com/Krasekkech/devops/blob/finalTest/screenshots/Снимок%20экрана%202025-06-08%20192221.png)

### 4. Mutlistage в Dockerfile'ах фронта и бэка
![Screen](https://github.com/Krasekkech/devops/blob/finalTest/screenshots/Снимок%20экрана%202025-06-08%20201736.png)
![Screen](https://github.com/Krasekkech/devops/blob/finalTest/screenshots/Снимок%20экрана%202025-06-08%20201811.png)
