# ios-common-kit
An all-in-one Swift Package for iOS development featuring networking, configuration, authentication, storage, alerts, and reusable utilities.


## API Calling Usage

```swift
func fetchUserProfile(completion: @escaping (Result<UserProfile, CoreError>) -> Void) {
        APIManager.shared.request(
            endpoint: "YOUR_API_NAME",
            method: .get, // API CALL METHOD
            completion: completion
        )
    }
```

## Toast Usage

```swift
ToastManager.shared.show(
    Toast(
        style: .success,
        message: viewModel.errorMessage
    )
)
```
