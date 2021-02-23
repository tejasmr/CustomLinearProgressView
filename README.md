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
// adding
var progressBarHostingController = UIHostingController(rootView: LinearProgressView(progress: 0.0))

setSwiftUIView(progressBarHostingController)
setAutoConstraints(someView: progressBarHostingController.view!, width: totalScreenWidth / 3, height: totalScreenWidth / 3, xOffset: screenWidth / 12, yOffset: screenHeight / 10, xRelative: false, yRelative: true, xLeading: true, yTop: false)
        
// modifying
self.progressBarHostingController.view!.removeFromSuperview()
            
self.progressBarHostingController = UIHostingController(rootView: ProgressBarView(progressValue: Float((totalTime - time)) / Float(totalTime), timer: (min > 9 ? "\(min)" : "0\(min)") + ":" + (sec > 9 ? "\(sec)" : "0\(sec)"), width: screenWidth / 3, height: screenWidth / 3, isLightMode: self.isLightMode))
            
self.setSwiftUIView(self.progressBarHostingController)
self.setAutoConstraints(someView: self.progressBarHostingController.view!, width: totalScreenWidth / 3, height: totalScreenWidth / 3, xOffset: screenWidth / 12, yOffset: screenHeight / 10, xRelative: false, yRelative: true, xLeading: true, yTop: false)

// deleting
self.progressBarHostingController.view!.removeFromSuperview()


// set swiftui view function
fileprivate func setSwiftUIView(_ child: UIHostingController<ProgressBarView>) {
    child.view.translatesAutoresizingMaskIntoConstraints = false
    child.view.frame = self.view.bounds
    // First, add the view of the child to the view of the parent
    self.view.addSubview(child.view)
    // Then, add the child to the parent
    self.addChild(child)
}
```

## Usage - SwiftUI
```swift
LinearProgressView(progress: 0.0)
```

## Auto Layout function
```swift
// set auto constraints

func setAutoConstraints(someView: UIView, width: CGFloat, height: CGFloat, xOffset: CGFloat, yOffset: CGFloat, xRelative: Bool, yRelative: Bool, xLeading: Bool, yTop: Bool) {
            
    someView.translatesAutoresizingMaskIntoConstraints = false

    let widthConstraint = NSLayoutConstraint(
       item: someView,
       attribute: NSLayoutConstraint.Attribute.width,
       relatedBy: NSLayoutConstraint.Relation.equal,
       toItem: nil,
       attribute: NSLayoutConstraint.Attribute.notAnAttribute,
       multiplier: 1,
       constant: width
    )
    let heightConstraint = NSLayoutConstraint(
       item: someView,
       attribute: NSLayoutConstraint.Attribute.height,
       relatedBy: NSLayoutConstraint.Relation.equal,
       toItem: nil,
       attribute: NSLayoutConstraint.Attribute.notAnAttribute,
       multiplier: 1,
       constant: height
    )
    var xConstraint = NSLayoutConstraint(
        item: someView,
        attribute: NSLayoutConstraint.Attribute.centerX,
        relatedBy: NSLayoutConstraint.Relation.equal,
        toItem: view,
        attribute: NSLayoutConstraint.Attribute.centerX,
        multiplier: 1,
        constant: 0
    )
    var yConstraint = NSLayoutConstraint(
        item: someView,
        attribute: NSLayoutConstraint.Attribute.centerY,
        relatedBy: NSLayoutConstraint.Relation.equal,
        toItem: view,
        attribute: NSLayoutConstraint.Attribute.centerY,
        multiplier: 1,
        constant: 0
    )
    if xRelative {
        if xLeading {
            xConstraint = NSLayoutConstraint(
               item: someView,
               attribute: NSLayoutConstraint.Attribute.leading,
               relatedBy: NSLayoutConstraint.Relation.equal,
               toItem: view,
               attribute: NSLayoutConstraint.Attribute.leadingMargin,
               multiplier: 1.0,
               constant: xOffset
            )
        }
        else {
            xConstraint = NSLayoutConstraint(
               item: someView,
               attribute: NSLayoutConstraint.Attribute.trailing,
               relatedBy: NSLayoutConstraint.Relation.equal,
               toItem: view,
               attribute: NSLayoutConstraint.Attribute.trailingMargin,
               multiplier: 1.0,
               constant: -xOffset
            )
        }

    }
    if yRelative {
        if yTop {
            yConstraint = NSLayoutConstraint(
                item: someView,
                attribute: NSLayoutConstraint.Attribute.top,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: view,
                attribute: NSLayoutConstraint.Attribute.topMargin,
                multiplier: 1.0,
                constant: yOffset
            )
        }
        else {
            yConstraint = NSLayoutConstraint(
                item: someView,
                attribute: NSLayoutConstraint.Attribute.bottom,
                relatedBy: NSLayoutConstraint.Relation.equal,
                toItem: view,
                attribute: NSLayoutConstraint.Attribute.bottomMargin,
                multiplier: 1.0,
                constant: -yOffset
            )
        }

    }
    view.addConstraints([widthConstraint, heightConstraint, xConstraint, yConstraint])
}
```
