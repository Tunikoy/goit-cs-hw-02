#!/bin/bash

# Масив URL вебсайтів для перевірки
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
log_file="website_status.log"

# Очищення файлу логів перед записом нових результатів
> $log_file

# Цикл перевірки доступності кожного сайту
for site in "${websites[@]}"
do
    # Використання curl для перевірки доступності (дозволяє переадресацію)
    status_code=$(curl -o /dev/null -s -w "%{http_code}" -L "$site")

    # Перевірка статус-коду
    if [ "$status_code" -eq 200 ]; then
        echo "$site is UP" >> $log_file
    else
        echo "$site is DOWN" >> $log_file
    fi
done

# Виведення повідомлення після завершення перевірки
echo "Результати записані у файл $log_file."
