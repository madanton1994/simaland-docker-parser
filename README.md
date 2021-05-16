# Парсер товаров сималэнд

* Форкнутый репо https://github.com/sima-land/api-php-client.git 

Данный репозиторий содержит файлы для запуска парсера в Docker контейнере и выводе результата парсинга в CSV, с настраиваемыми полями из JSON

## Как запускать

---

* На ПК необходимо установить Docker
* Склонировать репозиторий 
    ```bash
    git clone https://github.com/madanton1994/simaland-docker-parser.git
    ```
* Перейти в склонированный каталог `cd $(pwd)/simaland-docker-parser`
* Выполнить сборку контейнера 
    ```bash 
    docker build -t simaland-docker-parser . --build-arg SIMA_LOGIN="you.   simaland@email.ru" --build-arg SIMA_PASS="YouSimalandPass"
    ```
* После сборки контейнера выполнить комманду `docker images`

* Скопировать IMAGE ID только что собранного контейнера
* Запустить парсинг комманой
   ```bash
      docker run -v "$(pwd):/tmp/data" IMAGE_ID
   ```
* Вывод результат будет в текущий каталог, по оканчанию работы PHP скрипта выполнится консертация item.txt в item.csv с 3 полями (id , name , balance)
* Поля можно настраивать в файле entrypoint.sh
    ```bash
    cat item.txt| jq -r '[.id, .name, .balance] | join(";")' > item.csv
    ```
* Разделитель в CSV точка с запятой

> Все поля можно посмотреть в файле item.txt