# SwiftAK
AppKit code that is fun to write.

## Example Code

```swift
import Cocoa
import SwiftAK

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.center {
            NSView().vstack {
                [
                    
                    NSView(backgroundColor: .red)
                        .frame(height: 100, width: 100)
                        .padding()
                        .background(color: .yellow),
                    
                    NSText()
                        .configure {
                        $0.string = "Hello World!"
                    }
                    .background(color: .blue)
                    .frame(height: 60, width: 100)
                ]
            }
        }
    }
}
```

## Example 

![SwiftAK Example](https://i.imgur.com/h8Gt8lq.png)
