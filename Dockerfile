FROM swift:5.9 as build

# Рабочая директория
WORKDIR /build

# Зависимости SPM
COPY ./Package.* ./
RUN swift package resolve

# Копирование всего проекта
COPY . .

# Билд
RUN swift build -c release

# Запуск приложения
CMD [".build/release/Run", "serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]

