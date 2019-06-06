//
//  File.swift
//  
//
//  Created by Jordan Field Beta on 05/06/2019.
//

import Foundation
import SwiftUI
import AppKit

/// A box that contains an enclosed `View` with a header.
public struct Box<Content>: NSViewRepresentable where Content: View {
  public typealias NSViewType = NSBox
  private var containing: Content
  private var title: String
  
  public func makeNSView(context: NSViewRepresentableContext<Box>) -> NSBox {
    let box = NSBox()
    let hostingView = NSHostingView(rootView: containing)
    box.contentView = hostingView
    box.title = title
    return box
  }
  
  public func updateNSView(_ nsView: NSBox, context: NSViewRepresentableContext<Box>) {}
  
  /// Initialise a `Box` with the given header and contents.
  ///
  /// - Parameter header: The header string shown above the box.
  /// - Parameter contents: The view stored inside the box.
  public init(header: String, contents: () -> Content) {
    self.title = header
    self.containing = contents()
  }
}
