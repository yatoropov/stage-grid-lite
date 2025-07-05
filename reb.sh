#!/bin/bash

echo "🔧 Зупиняємо всі контейнери та видаляємо обʼєкти..."
docker-compose down --volumes --remove-orphans

echo "🧹 Видаляємо всі контейнери..."
docker rm -f $(docker ps -aq) 2>/dev/null

echo "🧼 Видаляємо всі образи..."
docker rmi -f $(docker images -q) 2>/dev/null

echo "🚿 Очищення кешу builder'а..."
docker builder prune -af

echo "🔨 Збираємо проект без кешу..."
docker-compose build --no-cache

echo "🚀 Запускаємо проект..."
docker-compose up -d

echo "✅ Готово!"
