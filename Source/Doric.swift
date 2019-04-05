// Doric
//
// Copyright (c) 2019 Jay K.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

/// Instance to access debug tools i.e. GraphView.
public class Doric: NSObject {
    private override init() {}
    
    /// Shared instance to access various properties and settings for graph debug view.
    public static let shared = Doric()
    
    /**
     Settings to configure graph view.
     
     Create instance of `Settings` and pass to 'Doric' to refect changes for graphView. Will refact only before view presented.
     */
    
    public var settings: Settings = Settings.default()
    
    /// Internal window to keep track of touchable area i.e close button.
    private class DebugWindow: UIWindow {
        // Keep reference of control to allow touch
        weak var button: UIButton?
        override func point(inside point: CGPoint, with _: UIEvent?) -> Bool {
            guard let rect = button?.frame else { return true }
            return rect.contains(point)
        }
    }
    
    /// Internal window on top of views will be displayed.
    private var window: DebugWindow?
    
    /**
     A Boolean value that determines whether the debugger graph view is hidden.
     
     Setting the value of this property to true hides the graph and setting it to false shows the graph. The default value is false.
     */
    public var isHidden: Bool = true {
        didSet {
            if !isHidden {
                showGraphView()
            } else {
                dismissGraphView()
            }
        }
    }
}

// MARK: - Support methods

fileprivate extension Doric {
    // Shows debugger window
    private func showGraphView() {
        if window != nil {
            return
        }
        
        let viewController = DesignDebuggerViewController(settings: settings)
        viewController.settings = settings
        
        window = DebugWindow(frame: UIScreen.main.bounds)
        window?.windowLevel = UIWindow.Level.statusBar + 1
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        window?.button = viewController.closeButton
    }
    
    // Hides debugger window
    private func dismissGraphView() {
        guard window != nil else {
            return
        }
        
        window?.button = nil
        window?.resignKey()
        window?.rootViewController = nil
        window = nil
    }
}
