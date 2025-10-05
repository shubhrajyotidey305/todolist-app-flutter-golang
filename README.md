# Task Manager App (Flutter + Golang)

This repository contains a simple task manager consisting of a Flutter client backed by a lightweight Go REST API. The Flutter app lets you add tasks and see the current list, while the Go service exposes endpoints for retrieving and creating tasks in memory.

## Repository structure
- `backend_api`: Go HTTP server exposing task CRUD endpoints with Gorilla Mux.
- `flutter_golang_app`: Flutter application using GetX for state management and network requests.

## Prerequisites
- [Go](https://go.dev/dl/) 1.20 or newer
- [Flutter](https://docs.flutter.dev/get-started/install) SDK 3.8+ with a configured device/emulator
- A recent version of `make` or your preferred terminal (optional)

## Running the Go API
1. Open a terminal at the repo root and start the API:
   ```bash
   cd backend_api
   go run main.go
   ```
2. The server listens on `http://127.0.0.1:8082` by default.
3. Endpoints:
   - `GET /gettasks` – list all known tasks.
   - `GET /gettask/{id}` – fetch a single task by its identifier.
   - `POST /create` – create a new task (JSON body with `task_name` and `task_detail`).
   - `DELETE /delete/{id}` and `PUT /update/{id}` are scaffolded but not yet implemented.

> The service uses an in-memory slice, so data resets every time you restart the server.

## Running the Flutter app
1. In a separate terminal, make sure the API above is running.
2. From the repo root run:
   ```bash
   cd flutter_golang_app
   flutter pub get
   flutter run
   ```
3. Choose your desired emulator or connected device when prompted.

The Flutter app assumes the API is reachable at `http://127.0.0.1:8082`. If you run on a real device or different emulator, update `BASE_URL` in `flutter_golang_app/lib/utils/app_constants.dart` (for example, Android emulator uses `10.0.2.2`).

## Development tips
- Use `flutter run -d chrome` for quick web previews.
- Run `flutter test` from `flutter_golang_app` to execute widget/unit tests (none are provided yet).
- Update `backend_api/main.go` if you add persistence or complete the missing delete/update handlers.

## Future improvements
- Persist tasks to a database instead of in-memory storage.
- Implement the missing `DELETE` and `PUT` handlers in the Go API.
- Add error handling and user feedback in the Flutter UI.
- Write integration tests that exercise both the API and Flutter client.
