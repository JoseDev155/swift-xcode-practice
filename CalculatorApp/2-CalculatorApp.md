# App 2 - Calculadora sencilla

Una APP tipo calculadora sencilla:

* 2.1 Usando SWIFTUI
* 2.2 2Usando UIkit

## Cambiar entre frameworks

Comentar y descomentar el framework a elegir en el archivo `ContentView.swift`:

```swift
struct ContentView: View {
    var body: some View {
        // Escoger alguna de las vistas

        // 2.1 SwiftUI
        //SwiftUICalculatorView()

        // 2.2 UIKit
        UIKitView()
    }
}
```

>Por defecto, usa el framework **UIKit**
