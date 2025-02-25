# 📌 Proyecto Flutter con Melos

Este repositorio contiene un proyecto Flutter estructurado como un **monorepo**, utilizando **Melos** para la gestión de paquetes. Implementa un sistema modular con arquitectura limpia, gestión de estado con BLoC, integración de Firebase y autenticación biométrica.

---

## 🚀 **Estructura del Proyecto**
```
seek-mobile-test/
│── melos.yaml
│── pubspec.yaml  # Proyecto principal
│── lib/
│   ├── main.dart
│── packages/
│   ├── qr_scanner/  # Módulo para escaneo de códigos QR
│   │   ├── lib/
│   │   │   ├── qr_scanner.dart
│   │   ├── pubspec.yaml
│   ├── auth_biometrics/  # Módulo para autenticación biométrica
│   │   ├── lib/
│   │   │   ├── auth_biometrics.dart
│   │   ├── pubspec.yaml
│── android/
│── ios/
│── test/
```

---

## 📦 **Configuración de Melos**

Melos facilita la administración del monorepo y permite manejar múltiples paquetes en un solo proyecto.

### **1. Instalación de Melos**
Ejecuta:
```sh
dart pub global activate melos
```

### **2. Configurar `melos.yaml`**
Crea un archivo `melos.yaml` en la raíz del proyecto:
```yaml
name: seek-mobile-test
packages:
  - packages/*

scripts:
  bootstrap:
    run: melos bootstrap
    description: Instala todas las dependencias del monorepo.
  analyze:
    run: melos run analyze
    description: Ejecuta el análisis estático en todos los paquetes.
  test:
    run: melos run test
    description: Ejecuta pruebas unitarias en todos los paquetes.
```

### **3. Inicializar Melos**
Ejecuta:
```sh
melos bootstrap
```
Esto instalará todas las dependencias del monorepo.

---

## 🔥 **Manejo de Dependencias en los Módulos**
Cada módulo tiene su propio `pubspec.yaml` y gestiona sus propias dependencias.

### **Ejemplo: `qr_scanner/pubspec.yaml`**
```yaml
name: qr_scanner
description: Módulo para escanear códigos QR.
version: 0.0.1
publish_to: "none"

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  camera: ^0.10.5
  cloud_firestore: ^4.9.1
```

### **Ejemplo: `auth_biometrics/pubspec.yaml`**
```yaml
name: auth_biometrics
description: Módulo para autenticación biométrica.
version: 0.0.1
publish_to: "none"

dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  local_auth: ^2.1.6
  firebase_auth: ^4.9.0
```

---

## 🔄 **Conectar los Módulos en el Proyecto Principal**
El proyecto principal **no instala** dependencias como `flutter_bloc`, solo importa los módulos:
```yaml
dependencies:
  flutter:
    sdk: flutter
  qr_scanner:
    path: packages/qr_scanner
  auth_biometrics:
    path: packages/auth_biometrics
```

---

## 🔥 **Configuración de Firebase**
### **1. Agregar Firebase al Proyecto**
1. Descarga los archivos de configuración:
   - `google-services.json` → **Colócalo en `android/app/`**
   - `GoogleService-Info.plist` → **Colócalo en `ios/Runner/`**
2. Instala FlutterFire CLI:
   ```sh
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
3. Agrega Firebase en `main.dart`:
   ```dart
   import 'package:firebase_core/firebase_core.dart';
   import 'firebase_options.dart';

   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
     runApp(const MyApp());
   }
   ```

---

## 🧪 **Ejecución de Pruebas**
Ejecuta todas las pruebas unitarias con:
```sh
melos run test
```
Ejemplo de prueba en `qr_scanner/test/qr_scanner_test.dart`:
```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:qr_scanner/qr_repository.dart';

void main() {
  test('Guardar un código QR', () async {
    final repo = QrRepository();
    await repo.saveQrCode('https://flutter.dev');
    final history = repo.getQrHistory();
    expect(history, isNotEmpty);
  });
}
```

---

## 🎯 **Resumen**
✅ **Melos** gestiona la estructura modular.
✅ **Cada módulo maneja sus propias dependencias.**
✅ **Firebase se configura en el proyecto principal.**
✅ **Los módulos solo importan Firebase si lo necesitan.**
✅ **Pruebas unitarias con Melos y Mockito.**

Con esta estructura, el monorepo está optimizado para escalabilidad y mantenibilidad. 🚀

---

## 📖 **Cómo Ejecutar la App**
```sh
flutter run
```
Para ejecutar un módulo específico:
```sh
cd packages/qr_scanner
flutter test
```

---

## 🌍 **Contribuciones**
¡Sientete libre de abrir un PR o reportar issues! 😃

