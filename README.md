# CustomLinearProgressView

## Code

```swift
struct LinearProgressView: View {
    @State var width = UIScreen.main.bounds.width
    @State var height = UIScreen.main.bounds.height
    @State var color = Color.red
    @State var progress: Double
    
    var body: some View {
        withAnimation {
            VStack {
                HStack {
                    VStack {
                        ZStack {
                            VStack {
                                Rectangle()
                                    .frame(width: width * 0.7, height: 20)
                                    .cornerRadius(20)
                                    .foregroundColor(color.opacity(0.3))
                            }
                            .frame(width: width * 0.7, height: 20, alignment: .leading)
                            VStack {
                                Rectangle()
                                    .trim(from: 0.0, to: 0.459 * CGFloat(min(self.progress, 1.0)))
                                    .stroke(Color.red, lineWidth: 40)
                                    .frame(width: (width * 0.7), height: 20)
                                    .cornerRadius(20)
                                    .foregroundColor(color.opacity(0.9))
                            }.frame(width: width * 0.7, height: 20, alignment: .leading)
                        }.frame(width: width * 0.7, height: 20, alignment: .leading)
                    }
                    
                    VStack {
                        if progress <= 0.099 {
                            HStack(spacing: 0.0) {
                                Text("00")
                                    .font(.custom("AvenirNext-Bold", size: 20.0))
                                    .opacity(0.0)
                                Text(String(format: "%.0f%%", min(self.progress, 1.0)*100.0))
                                    .font(.custom("AvenirNext-Bold", size: 20.0))
                            }
                        }
                        else if progress <= 0.999 {
                            HStack(spacing: 0.0) {
                                Text("0")
                                    .font(.custom("AvenirNext-Bold", size: 20.0))
                                    .opacity(0.0)
                                Text(String(format: "%.0f%%", min(self.progress, 1.0)*100.0))
                                    .font(.custom("AvenirNext-Bold", size: 20.0))
                            }
                        }
                        else {
                            HStack(spacing: 0.0) {
                                Text(String(format: "%.0f%%", min(self.progress, 1.0)*100.0))
                                    .font(.custom("AvenirNext-Bold", size: 20.0))
                            }
                        }
                    }
                }
            }
        }
    }
}
```

## Usage - UIKit
```swift
var progressBarHostingController = UIHostingController(rootView: LinearProgressView(progress: 0.0))
```

## Usage - SwiftUI
```swift
LinearProgressView(progress: 0.0)
```
