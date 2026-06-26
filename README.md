ios-common-kit

An all-in-one Swift Package for iOS development that provides reusable networking, configuration, storage, UI components, and utilities.

✨ Features

* 🌐 Generic API Manager
* 🔐 Environment Configuration
* 📦 UserDefaults & Keychain Storage
* 🍞 Toast Notifications
* ⏳ Loader Manager
* 📡 HTTP Methods & Headers
* 📄 Generic API Response (TrendResponse)
* ⚠️ Common Error Handling (CoreError)
* 🧩 SwiftUI View Modifiers
* 🚀 Easy to integrate into any iOS project

⸻

Requirements

* iOS 15+
* Xcode 15+
* Swift 5.10+

⸻

Installation

Swift Package Manager

In Xcode:

File
→ Add Package Dependencies...

Package URL:

https://github.com/saravana46/ios-common-kit

⸻

Import Modules

Import only the modules you need.

import TrendCore
import TrendConfiguration
import TrendUI

⸻

Configuration

Configure your API URL using your project configuration.

Example:

API_URL=https://example.com

⸻

API Calling

Create your service method.

func fetchUserProfile(
    completion: @escaping (Result<UserProfile, CoreError>) -> Void
) {
    APIManager.shared.request(
        endpoint: "/profile",
        method: .get,
        completion: completion
    )
}

POST request

func login(
    request: LoginRequest,
    completion: @escaping (Result<LoginResponse, CoreError>) -> Void
) {
    APIManager.shared.request(
        endpoint: "/login",
        method: .post,
        body: request,
        completion: completion
    )
}

⸻

Toast

Attach the modifier once.

ContentView()
    .toast()

Show a toast.

ToastManager.shared.show(
    Toast(
        style: .success,
        message: "Login Successful"
    )
)

Configure toast appearance.

ToastManager.shared.configure(
    ToastConfiguration(
        backgroundColor: Color("CardBackground"),
        borderColor: Color("Border"),
        textColor: Color("TextPrimary")
    )
)

Customize icons.

ToastManager.shared.configureIcons(
    ToastIcons(
        success: Image("success"),
        error: Image("error"),
        warning: Image("warning"),
        info: Image("info")
    )
)

⸻

Loader

Attach the modifier once.

ContentView()
    .loader()

Show loader.

LoaderManager.shared.show()

Custom message.

LoaderManager.shared.show(
    message: "Please wait..."
)

Hide loader.

LoaderManager.shared.hide()

⸻

Error Handling

switch result {
case .success(let response):
    print(response)
case .failure(let error):
    print(error.message ?? "")
}

⸻

License

MIT License
