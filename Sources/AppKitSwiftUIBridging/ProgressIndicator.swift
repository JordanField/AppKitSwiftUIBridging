import SwiftUI
import AppKit

/// A spinning progress indicator used to represent an indeterminate amount of
/// loading.
public struct IndeterminateProgressIndicator: NSViewRepresentable {
  public typealias NSViewType = NSProgressIndicator
  
  @Binding private var animating: Bool
  
  public func makeNSView(context: NSViewRepresentableContext<IndeterminateProgressIndicator>) -> NSProgressIndicator {
    let progressIndicator = NSProgressIndicator()
    progressIndicator.isIndeterminate = true
    progressIndicator.style = .spinning
    return progressIndicator
  }
  
  public func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<IndeterminateProgressIndicator>) {
    if animating {
      nsView.startAnimation(nil)
    } else {
      nsView.stopAnimation(nil)
    }
  }
  
  /// Initialise a `IndeterminateProgressIndicator` with the given binding for its
  /// animation.
  ///
  /// - Parameter animating: A binding to a `Bool` that determines whether the
  /// indicator should be spinning or not.
  public init(animating: Binding<Bool>) {
    self.$animating = animating
  }
}

/// A determinate progress indicator shown as a circular filling "pie chart."
public struct ProgressIndicator: NSViewRepresentable {
  public typealias NSViewType = NSProgressIndicator
  
  private var range: ClosedRange<Double>
  @Binding private var currentValue: Double
  
  public func makeNSView(context: NSViewRepresentableContext<ProgressIndicator>) -> NSProgressIndicator {
    let progressIndicator = NSProgressIndicator()
    progressIndicator.isIndeterminate = false
    progressIndicator.style = .spinning
    return progressIndicator
  }
  
  public func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<ProgressIndicator>) {
    nsView.doubleValue = currentValue
  }
  
  /// Initialise a `ProgressIndicator` with the given range and current value binding.
  ///
  /// - Parameter range: What range the progress indicator should represent.
  /// The lower bound is treated as the minimum, and the upper bound the maximum
  /// - Parameter currentValue: A binding to a `Double` that represents
  /// how far the indicator should be filled.
  public init(range: ClosedRange<Double>, currentValue: Binding<Double>) {
    self.range = range
    self.$currentValue = currentValue
  }
}

/// A pulsing progress bar used to represent an indeterminate amount of
/// loading.
public struct IndeterminateProgressBar: NSViewRepresentable {
  public typealias NSViewType = NSProgressIndicator
  
  @Binding private var animating: Bool
  
  public func makeNSView(context: NSViewRepresentableContext<IndeterminateProgressBar>) -> NSProgressIndicator {
    let progressIndicator = NSProgressIndicator()
    progressIndicator.isIndeterminate = true
    progressIndicator.style = .bar
    return progressIndicator
  }
  
  public func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<IndeterminateProgressBar>) {
    if animating {
      nsView.startAnimation(nil)
    } else {
      nsView.stopAnimation(nil)
    }
  }
  
  /// Initialise a `IndeterminateProgressBar` with the given binding for its
  /// animation.
  ///
  /// - Parameter animating: A binding to a `Bool` that determines whether the
  /// bar should be pulsing or not.
  public init(animating: Binding<Bool>) {
    self.$animating = animating
  }
}

/// A progress bar used to represent a determinate amount of loading.
public struct ProgressBar: NSViewRepresentable {
  public typealias NSViewType = NSProgressIndicator
  
  private var range: ClosedRange<Double>
  @Binding private var currentValue: Double
  
  public func makeNSView(context: NSViewRepresentableContext<ProgressBar>) -> NSProgressIndicator {
    let progressIndicator = NSProgressIndicator()
    progressIndicator.isIndeterminate = false
    progressIndicator.style = .bar
    progressIndicator.maxValue = range.upperBound
    progressIndicator.minValue = range.lowerBound
    return progressIndicator
  }
  
  public func updateNSView(_ nsView: NSProgressIndicator, context: NSViewRepresentableContext<ProgressBar>) {
    nsView.doubleValue = currentValue
  }
  
  /// Initialise a `ProgressBar` with the given range and current value binding.
  ///
  /// - Parameter range: What range the progress bar should represent.
  /// The lower bound is treated as the minimum, and the upper bound the maximum
  /// - Parameter currentValue: A binding to a `Double` that represents
  /// how far the bar should be filled.
  public init(range: ClosedRange<Double>, currentValue: Binding<Double>) {
    self.range = range
    self.$currentValue = currentValue
  }
}
