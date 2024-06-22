# TimeLapse

This app represents a time lapse using SwiftUI and the MVVM architecture.
- It uses CoreAnimation, part of the QuartzCore framework.

## UIViewRepresentable protocol

`UIViewRepresentable` is a protocol in SwiftUI that allows you to integrate UIKit-based views into your SwiftUI views seamlessly. It acts as a bridge between SwiftUI's declarative approach and UIKit's imperative approach. Here’s a detailed description of `UIViewRepresentable`:

### Purpose
The primary purpose of `UIViewRepresentable` is to wrap a UIKit view (which conforms to `UIView`) so that it can be used as a SwiftUI view (`View`). This is useful when you want to:

- **Reuse Existing UIKit Components**: If you have custom or complex UI components written in UIKit (such as a map view, camera view, etc.), you can wrap them using `UIViewRepresentable` to leverage them within SwiftUI.
  
- **Access UIKit Features**: SwiftUI is still evolving, and not all UIKit functionalities are directly accessible from SwiftUI views. `UIViewRepresentable` allows you to access and utilize these features.

### Protocol Requirements
To conform to `UIViewRepresentable`, you need to implement the following requirements:

1. **makeUIView(context:)**: This function creates and returns an instance of your UIKit view (`UIView`). This is where you configure and customize your UIKit view, set up delegates, and perform any other necessary setup.

2. **updateUIView(_:context:)**: This function updates the UIKit view when the SwiftUI view’s state changes. You should update any properties or configurations of the UIKit view that depend on changes in SwiftUI's state.

3. **Coordinator (optional)**: You can define an inner type `Coordinator` to manage interactions between SwiftUI and UIKit, such as handling delegates or responding to events. This is achieved by implementing methods like `makeCoordinator()` and passing it to the SwiftUI view.

### Example Usage
Here’s a basic example of using `UIViewRepresentable`:

```swift
import SwiftUI
import UIKit

struct MyCustomView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Hello, UIViewRepresentable!"
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        // Update the label if needed
    }
}
```

### Integration with SwiftUI Views
Once you have defined a type that conforms to `UIViewRepresentable`, you can use it like any other SwiftUI view:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            MyCustomView()
                .frame(width: 200, height: 50)
                .background(Color.gray)
                .cornerRadius(10)
        }
    }
}
```

### Considerations
- **Lifecycle Management**: Ensure proper initialization and cleanup of UIKit views, especially when dealing with resources like timers or delegates.
  
- **Performance**: SwiftUI efficiently manages updates to views, but be mindful of potential performance implications when bridging to UIKit views.

By leveraging `UIViewRepresentable`, you can enhance your SwiftUI apps with existing UIKit components or take advantage of UIKit's extensive capabilities while still benefiting from SwiftUI's modern declarative syntax.
## Screenshots
<img src="https://github.com/did35/TimeLapse/assets/17040667/28c8d837-519e-47bc-90ed-d71d530a644b" width= "300">



