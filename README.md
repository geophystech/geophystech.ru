# README 

[![Build Status](https://travis-ci.org/geophystech/geophystech.ru.svg?branch=master)](https://travis-ci.org/geophystech/geophystech.ru)

## Официальный web-сайт ООО "Геофизические технологии" 

[geophystech.ru](https://geophystech.ru)

## Используемые технологии

На продакшене сайт представляет собой набор статических HTML-страниц. 

Для сборки страниц используется [middleman](https://middlemanapp.com/).

## Установка

`middleman` - это генератор, написанный на ruby.        
Для корректной работы требуется пакетный менеджер ruby - `rubygems`. 

Установка `rubygems` зависит от операционной системы. [Подробнее на официальном сайте](https://rubygems.org/pages/download)

Для локальной разработки нужно выполнить следующие шаги:

```
# Клонируем репозиторий:
git clone git@github.com:geophystech/geophystech.ru.git
cd geophystech.ru

gem install bundler
bundle install
```

## Разработка

`Middleman` поддерживает режим "горячего обновления" (hot reload). 
Это означает, что при внесении зименений в код, они автоматически распознаются и будут отображены. 

```
cd geophystech.ru

# Запустить локальный development-сервер
bundle exec middleman
```

По умолчанию сайт будет доступен по адресу http://localhost:4567

## Деплой в производство

Для деплоя готового сайта требуется его собрать:

```
cd geophystech.ru

bundle exec middleman build 
```

Собранный сайт будет помещён в каталог `build/`. 

Далее любым удобным способом загружаем содержимое `build/` на сервер с настроенным nginx.

Пример ручного деплоя:

```
rsync -avzr --delete -e ssh build/ USER@HOST:/opt/geophystech.ru
```
