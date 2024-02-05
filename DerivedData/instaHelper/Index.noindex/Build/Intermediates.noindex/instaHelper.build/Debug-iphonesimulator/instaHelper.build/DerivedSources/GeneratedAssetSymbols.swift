import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "Cleaner" asset catalog image resource.
    static let cleaner = DeveloperToolsSupport.ImageResource(name: "Cleaner", bundle: resourceBundle)

    /// The "Cook" asset catalog image resource.
    static let cook = DeveloperToolsSupport.ImageResource(name: "Cook", bundle: resourceBundle)

    /// The "Driver" asset catalog image resource.
    static let driver = DeveloperToolsSupport.ImageResource(name: "Driver", bundle: resourceBundle)

    /// The "rajni" asset catalog image resource.
    static let rajni = DeveloperToolsSupport.ImageResource(name: "rajni", bundle: resourceBundle)

    /// The "rajni1" asset catalog image resource.
    static let rajni1 = DeveloperToolsSupport.ImageResource(name: "rajni1", bundle: resourceBundle)

    /// The "shabham" asset catalog image resource.
    static let shabham = DeveloperToolsSupport.ImageResource(name: "shabham", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "Cleaner" asset catalog image.
    static var cleaner: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cleaner)
#else
        .init()
#endif
    }

    /// The "Cook" asset catalog image.
    static var cook: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .cook)
#else
        .init()
#endif
    }

    /// The "Driver" asset catalog image.
    static var driver: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .driver)
#else
        .init()
#endif
    }

    /// The "rajni" asset catalog image.
    static var rajni: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rajni)
#else
        .init()
#endif
    }

    /// The "rajni1" asset catalog image.
    static var rajni1: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .rajni1)
#else
        .init()
#endif
    }

    /// The "shabham" asset catalog image.
    static var shabham: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .shabham)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "Cleaner" asset catalog image.
    static var cleaner: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .cleaner)
#else
        .init()
#endif
    }

    /// The "Cook" asset catalog image.
    static var cook: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .cook)
#else
        .init()
#endif
    }

    /// The "Driver" asset catalog image.
    static var driver: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .driver)
#else
        .init()
#endif
    }

    /// The "rajni" asset catalog image.
    static var rajni: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rajni)
#else
        .init()
#endif
    }

    /// The "rajni1" asset catalog image.
    static var rajni1: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .rajni1)
#else
        .init()
#endif
    }

    /// The "shabham" asset catalog image.
    static var shabham: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .shabham)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: String, bundle: Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

