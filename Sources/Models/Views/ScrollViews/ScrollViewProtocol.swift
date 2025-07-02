//
//  ScrollViewProtocol.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 01/07/2025.
//

import Foundation

public protocol ScrollViewProtocol: ViewProtocol {
    // UIScrollView Attributes Inspector
    var indicatorStyle: IndicatorStyle? { get }
    var showsHorizontalScrollIndicator: Bool? { get }
    var showsVerticalScrollIndicator: Bool? { get }
    var scrollEnabled: Bool? { get }
    var pagingEnabled: Bool? { get }
    var directionalLockEnabled: Bool? { get }
    var bounces: Bool? { get }
    var bouncesZoom: Bool? { get }
    var alwaysBounceHorizontal: Bool? { get }
    var alwaysBounceVertical: Bool? { get }
    var minimumZoomScale: Float? { get }
    var maximumZoomScale: Float? { get }
    var delaysContentTouches: Bool? { get }
    var canCancelContentTouches: Bool? { get }
    var keyboardDismissMode: String? { get } // Do not Dismiss -> not present, Dismiss on drag -> onDrag, Dismiss interactively -> interactive,
    // UIScrollView Size Inspector
    var scrollIndicatorInsets: Inset? { get }
    var contentInsetAdjustmentBehavior: String? { get } // automatic(not present in storyboard) scrollableAxes, never, always
    var contentLayoutGuide: LayoutGuide? { get }
    var frameLayoutGuide: LayoutGuide? { get }
}
