//
//  AppBackgroundView.swift
//  AnalogClock
//
//  Created by Justin Reusch on 5/29/20.
//  Copyright © 2020 Justin Reusch. All rights reserved.
//

import SwiftUI

/// Wraps content within a full-screen (edge-to-edge) background
@available(iOS 13.0, *)
@available(OSX 10.15, *)
@available(watchOS 6.0, *)
public struct AppBackgroundView<Content, S>: View where Content : View, S: ShapeStyle {
    
    /// The fill for the background
    public var fill: S = Color.clear as! S
    
    /// The fill style
    public var style: FillStyle = FillStyle()
    
    /// Stores the content function builder
    public var content: () -> Content
    
    // Initializer ---------------------------- /
    
    /**
     - Parameter fill: The fill for the background
     - Parameter style: The fill style
     - Parameter content: The view builder content to pass
     */
    @inlinable public init(
        _ fill: S = Color.clear as! S,
        style: FillStyle = FillStyle(),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.fill = fill
        self.style = style
        self.content = content
    }
    
    // Body ---------------------------- /
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(fill)
                .edgesIgnoringSafeArea(.all)
            content()
        }
    }
}
