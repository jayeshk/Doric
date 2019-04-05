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

import Foundation
import UIKit

/// ThemeNotification
public struct ThemeNotification {
    public static let didChange = Notification.Name(rawValue: "com.doric.notification.theme.didchange")
}

extension Notification {
    /// Instance of `Theme`
    public var theme: Theme? {
        return userInfo?[String.themeKey] as? Theme
    }
    
    /// Create `Notification` using `Theme`
    ///
    /// - Parameters:
    ///   - name: Notification Name
    ///   - theme: Theme instance
    init(name: Notification.Name, theme: Theme) {
        self.init(name: name, object: nil, userInfo: [String.themeKey: theme])
    }
}

extension NotificationCenter {
    /// Posts notification.
    ///
    /// - Parameters:
    ///   - name: Notification Name
    ///   - theme: Theme instance
    func postNotification(named name: Notification.Name, with theme: Theme) {
        post(Notification(name: name, theme: theme))
    }
}

fileprivate extension String {
    /// Key for theme reference in notification instance.
    static let themeKey = "com.doric.theme.key"
}

/// Listens events for theme
public protocol ThemeListener {
    /// Notify theme change.
    func notifyChange(_ theme: Theme)
}

/// Default implemention of `ThemeListener` which posts notifications using `default` notification center.
final class ThemeNotificationCenterNotifier: ThemeListener {
    /// Notifies theme change
    ///
    /// - Parameter theme: Theme instance
    public func notifyChange(_ theme: Theme) {
        NotificationCenter.default.postNotification(named: ThemeNotification.didChange, with: theme)
    }
}
