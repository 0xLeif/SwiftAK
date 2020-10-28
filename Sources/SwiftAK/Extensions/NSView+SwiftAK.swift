//
//  NSView+SwiftAK.swift
//  SwiftAK
//
//  Created by Zach Eriksen on 10/27/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import Cocoa

public enum Padding {
    case leading(Float)
    case trailing(Float)
    case top(Float)
    case bottom(Float)
}

@available(OSX 10.11, *)
public extension NSView {
    
    convenience init(withPadding padding: Float = 0,
                     backgroundColor: NSColor? = .clear,
                     _ closure: (() -> NSView)? = nil) {
        self.init(frame: .zero)
        
        layer = CALayer()
        layer?.backgroundColor = backgroundColor?.cgColor
        
        _ = closure.map { embed(withPadding: padding, $0) }
    }
    
    convenience init(withPadding padding: [Padding],
                     backgroundColor: NSColor? = .clear,
                     _ closure: (() -> NSView)? = nil) {
        self.init(frame: .zero)
        
        layer = CALayer()
        layer?.backgroundColor = backgroundColor?.cgColor
        
        _ = closure.map { embed(withPadding: padding, $0) }
    }
    
    /// Embed a Stack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: NSStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: NSStackView.Distribution)
    ///     - axis: Keys that specify a horizontal or vertical layout constraint between objects (source: NSUserInterfaceLayoutOrientation)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func stack(withSpacing spacing: Float = 0,
               padding: Float = 0,
               alignment: NSLayoutConstraint.Attribute = .top,
               distribution: NSStackView.Distribution = .fill,
               axis: NSUserInterfaceLayoutOrientation,
               _ closure: () -> [NSView?]) -> Self {
        let viewsInVStack = closure()
            .compactMap { $0 }
        
        let stackView = NSStackView(views: viewsInVStack)
        stackView.spacing = CGFloat(spacing)
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.orientation = axis
        
        embed(withPadding: padding) {
            stackView
        }
        
        return self
    }
    
    /// Embed a Stack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: NSStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: NSStackView.Distribution)
    ///     - axis: Keys that specify a horizontal or vertical layout constraint between objects (source: NSUserInterfaceLayoutOrientation)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func stack(withSpacing spacing: Float = 0,
               padding: [Padding],
               alignment: NSLayoutConstraint.Attribute = .top,
               distribution: NSStackView.Distribution = .fill,
               axis: NSUserInterfaceLayoutOrientation,
               _ closure: () -> [NSView?]) -> Self {
        let viewsInVStack = closure()
            .compactMap { $0 }
        
        let stackView = NSStackView(views: viewsInVStack)
        stackView.spacing = CGFloat(spacing)
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.orientation = axis
        
        embed(withPadding: padding) {
            stackView
        }
        
        return self
    }
    
    /// Embed a VStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: NSStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: NSStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func vstack(withSpacing spacing: Float = 0,
                padding: Float = 0,
                alignment: NSLayoutConstraint.Attribute = .top,
                distribution: NSStackView.Distribution = .fill,
                _ closure: () -> [NSView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .vertical,
                     closure)
    }
    
    /// Embed a VStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: NSStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: NSStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func vstack(withSpacing spacing: Float = 0,
                padding: [Padding],
                alignment: NSLayoutConstraint.Attribute = .top,
                distribution: NSStackView.Distribution = .fill,
                _ closure: () -> [NSView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .vertical,
                     closure)
    }
    
    /// Embed a HStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: NSStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: NSStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func hstack(withSpacing spacing: Float = 0,
                padding: Float = 0,
                alignment: NSLayoutConstraint.Attribute = .top,
                distribution: NSStackView.Distribution = .fill,
                _ closure: () -> [NSView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .horizontal,
                     closure)
    }
    
    /// Embed a HStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: NSStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: NSStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func hstack(withSpacing spacing: Float = 0,
                padding: [Padding],
                alignment: NSLayoutConstraint.Attribute = .top,
                distribution: NSStackView.Distribution = .fill,
                _ closure: () -> [NSView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .horizontal,
                     closure)
    }
    
    /// Embed a View to all anchors (top, bottom, leading, trailing)
    /// - Parameters:
    ///     - withPadding: The amount of space between the embedded view and this view
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func embed(withPadding padding: Float = 0,
               _ closure: () -> NSView) -> Self {
        let viewToEmbed = closure()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        NSLayoutConstraint.activate([
            viewToEmbed.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(padding)),
            viewToEmbed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-padding)),
            viewToEmbed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(padding)),
            viewToEmbed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-padding))
        ])
        
        return self
    }
    
    /// Center a View
    /// - Parameters:
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func center(_ closure: () -> NSView) -> Self {
        let viewToEmbed = closure()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        NSLayoutConstraint.activate([
            viewToEmbed.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewToEmbed.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        return self
    }
    
    /// Embed a View to certain anchors (top, bottom, leading, trailing)
    /// - Parameters:
    ///     - withPadding: The amount of space between the embedded view and this view
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func embed(withPadding padding: [Padding],
               _ closure: () -> NSView) -> Self {
        let viewToEmbed = closure()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        NSLayoutConstraint.activate(
            padding.map {
                switch $0 {
                case .leading(let constant):
                    return viewToEmbed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(constant))
                case .trailing(let constant):
                    return viewToEmbed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-constant))
                case .top(let constant):
                    return viewToEmbed.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(constant))
                case .bottom(let constant):
                    return viewToEmbed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-constant))
                }
            }
        )
        
        return self
    }
    
    @discardableResult
    func setVertical(huggingPriority: NSLayoutConstraint.Priority) -> Self {
        setContentHuggingPriority(huggingPriority, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func setHorizontal(huggingPriority: NSLayoutConstraint.Priority) -> Self {
        setContentHuggingPriority(huggingPriority, for: .horizontal)
        
        return self
    }
    
    @discardableResult
    func setVertical(compressionResistance: NSLayoutConstraint.Priority) -> Self {
        setContentCompressionResistancePriority(compressionResistance, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func setHorizontal(compressionResistance: NSLayoutConstraint.Priority) -> Self {
        setContentCompressionResistancePriority(compressionResistance, for: .horizontal)
        
        return self
    }
    
    /// Clear all subviews from this view
    @discardableResult
    func clear() -> Self {
        subviews.forEach { $0.removeFromSuperview() }
        
        return self
    }
    
    /// Embed this view inside another with some padding
    /// - Parameters:
    ///     - padding: The amount of space between this view and its parent view
    @discardableResult
    func padding(_ padding: Float = 8) -> NSView {
        return NSView(withPadding: padding,
                      backgroundColor: nil) { self }
//            .accessibility(label: accessibilityLabel,
//                           identifier: accessibilityIdentifier,
//                           traits: accessibilityTraits)
    }
    
    /// Set the height and width anchors to constant values (if nil it will not update the constraint)
    /// - Parameters:
    ///     - height: Value for the heightAnchor
    ///     - width: Value for the widthAnchor
    @discardableResult
    func frame(height: Float? = nil, width: Float? = nil) -> Self {
        if let height = height {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        
        return self
    }
    
    /// Update the height and width anchors to constant values (if nil it will not update the constraint)
    /// - Parameters:
    ///     - height: Value for the heightAnchor
    ///     - width: Value for the widthAnchor
    @available(OSX 10.12, *)
    @discardableResult
    func update(height: Float? = nil, width: Float? = nil) -> Self {
        if let height = height {
            constraints.first { (constraint) -> Bool in
                constraint.firstAnchor == heightAnchor
                }?.constant = CGFloat(height)
        }
        
        if let width = width {
            constraints.first { (constraint) -> Bool in
                constraint.firstAnchor == widthAnchor
                }?.constant = CGFloat(width)
        }
        
        return self
    }
    
    /// Update a padding anchor's constant value
//    @available(iOS 10.0, *)
//    @discardableResult
//    func update(padding: Padding) -> Self {
//        switch padding {
//        case .top(let value):
//            topConstraints.first?.constant = CGFloat(value)
//        case .bottom(let value):
//            bottomConstraints.first?.constant = CGFloat(-value)
//        case .leading(let value):
//            leadingConstraints.first?.constant = CGFloat(value)
//        case .trailing(let value):
//            trailingConstraints.first?.constant = CGFloat(-value)
//        }
//
//        return self
//    }
    
    /// Update an array of padding anchors' constant values
//    @available(iOS 10.0, *)
//    @discardableResult
//    func update(padding: [Padding]) -> Self {
//        padding.forEach { update(padding: $0) }
//
//        return self
//    }
    
    /// Update all padding anchors' constant value
//    @available(iOS 10.0, *)
//    @discardableResult
//    func update(padding: Float) -> Self {
//        update(padding: [
//            .top(padding),
//            .bottom(padding),
//            .leading(padding),
//            .trailing(padding)
//        ])
//
//        return self
//    }
    
    
    /// Remove the height anchor constraint
    @available(OSX 10.12, *)
    @discardableResult
    func removeHeightConstraint() -> Self {
        if let heightConstraint = constraints.first(where: { $0.firstAnchor == heightAnchor }) {
            removeConstraint(heightConstraint)
        }
        
        return self
    }
    
    /// Remove the width anchor constraint
    @available(OSX 10.12, *)
    @discardableResult
    func removeWidthConstraint() -> Self {
        if let widthConstraint = constraints.first(where: { $0.firstAnchor == widthAnchor }) {
            removeConstraint(widthConstraint)
        }
        
        return self
    }
    
    /// Activate LayoutConstraints
    /// - Parameters:
    ///     - constraints: A trailing closure that accepts an array of NSLayoutConstraint
    @discardableResult
    func activateLayoutConstraints(_ constraints: () -> [NSLayoutConstraint]) -> Self {
        NSLayoutConstraint.activate(constraints())
        
        return self
    }
    
    /// Offset the View's center by (x, y)
    /// - Parameters:
    ///     - x: Value to add to the center.x
    ///     - y: Value to add to the center.y
//    @discardableResult
//    func offset(x: Float? = nil, y: Float? = nil) -> Self {
//        if let x = x {
//            center.x += CGFloat(x)
//        }
//        if let y = y {
//            center.y += CGFloat(y)
//        }
//
//        return self
//    }
    
    /// Set the View's center to (x, y)
    /// - Parameters:
    ///     - x: Value to set the center.x
    ///     - y: Value to set the center.y
//    @discardableResult
//    func center(x: Float? = nil, y: Float? = nil) -> Self {
//        if let x = x {
//            center.x = CGFloat(x)
//        }
//        if let y = y {
//            center.y = CGFloat(y)
//        }
//
//        return self
//    }
    
    /// Constrains the View's centerAnchors
    @discardableResult
    func center(xOffset: Float? = nil, yOffset: Float? = nil, in view: NSView) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        
        if let x = xOffset {
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: CGFloat(x)).isActive = true
        }
        if let y = yOffset {
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(y)).isActive = true
        }
        
        return self
    }
    
//    @discardableResult
//    func animate(withDuration duration: TimeInterval,
//                 animation: @escaping (NSView) -> Void,
//                 completion: ((NSView) -> Void)? = nil) -> Self {
//
//        NSView.animate(withDuration: duration,
//                       animations: { animation(self) }) { (isComplete) in
//                        if isComplete {
//                            completion?(self)
//                        }
//        }
//
//        return self
//    }
    
//    @discardableResult
//    func animate(withDuration duration: TimeInterval,
//                 delay: TimeInterval,
//                 options: NSView.AnimationOptions,
//                 animation: @escaping (NSView) -> Void,
//                 completion: ((NSView) -> Void)? = nil) -> Self {
//
//        NSView.animate(withDuration: duration,
//                       delay: delay,
//                       options: options,
//                       animations: { animation(self) }) { (isComplete) in
//                        if isComplete {
//                            completion?(self)
//                        }
//        }
//
//        return self
//    }
    
    /// Hide the view
    /// - Parameters:
    ///     - if: A bool that determines if the view should be hidden
    @discardableResult
    func hide(if shouldHide: Bool) -> Self {
        isHidden = shouldHide
        
        return self
    }
    
    /// Hide the view
    /// - Parameters:
    ///     - if: A closure that determines if the view should be hidden
    @discardableResult
    func hide(if shouldHide: () -> Bool) -> Self {
        isHidden = shouldHide()
        
        return self
    }
    
    /// Hide the view
//    @discardableResult
//    func hidden(withAnimatedDuration duration: Double = 0) -> Self {
//        alpha = 1
//
//        animate(withDuration: duration,
//                animation: { view in
//                    view.alpha = 0
//        }) { view in
//            view.isHidden = true
//            view.alpha = 1
//
//        }
//
//        return self
//    }
    
    /// Show the view
//    @discardableResult
//    func appear(withAnimatedDuration duration: Double = 0) -> Self {
//        alpha = 0
//        isHidden = false
//
//        animate(withDuration: duration,
//                animation: { view in
//                    view.alpha = 1
//        }) { view in
//            view.isHidden = false
//            view.alpha = 1
//
//        }
//
//        return self
//    }
    
//    @discardableResult
//    func transform(_ closure: (CGAffineTransform) -> CGAffineTransform) -> Self {
//        transform = closure(transform)
//
//        return self
//    }
    
//    @discardableResult
//    func accessibility(label: String? = nil,
//                       identifier: String? = nil,
//                       traits: NSAccessibilityTraits? = nil) -> Self {
//
//        label.map { accessibilityLabel = $0 }
//        identifier.map { accessibilityIdentifier = $0 }
//        traits.map { accessibilityTraits = $0 }
//
//        return self
//    }
    
    /// Add a GestureRecognizer to the view
    /// - Parameters:
    ///     - closure: A trailing closure that accepts a NSGestureRecognizer
    @discardableResult
    func gesture(_ closure: () -> NSGestureRecognizer) -> Self {
        let gesture = closure()
        
        addGestureRecognizer(gesture)
        
        return self
    }
    
    @discardableResult
    func background(color: NSColor?) -> Self {
        layer?.backgroundColor = color?.cgColor
        

        return self
    }
//
//    @discardableResult
//    func clipsToBounds(_ shouldClip: Bool = true) -> Self {
//        self.clipsToBounds = shouldClip
//
//        return self
//    }
}

public extension NSView {
    var allSubviews: [NSView] {
        getSubviews(forView: self)
    }

    @discardableResult
    func debug() -> Self {
        var randomColor: NSColor {
            return NSColor(red: CGFloat.random(in: 0 ... 255) / 255,
                           green: CGFloat.random(in: 0 ... 255) / 255,
                           blue: CGFloat.random(in: 0 ... 255) / 255,
                           alpha: 1)
        }

        let subviews = allSubviews

        print("DEBUG LOG:")
        print("Root Debug View: \(self)")
        print("Number of Views: \(subviews.count + 1)")

//        subviews.forEach {
//            $0.backgroundColor = randomColor
//        }

        return self
    }

    private func getSubviews(forView view: NSView) -> [NSView] {
        var views: [NSView] = []
        for view in view.subviews {
            views.append(view)
            views.append(contentsOf: getSubviews(forView: view))
        }
        return views
    }
}
