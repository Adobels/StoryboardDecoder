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
//
//struct ScrollView: IBDecodable, ScrollViewProtocol, IBIdentifiable {
//
//    let indicatorStyle: IndicatorStyle?
//    let showsHorizontalScrollIndicator: Bool?
//    let showsVerticalScrollIndicator: Bool?
//    let scrollEnabled: Bool?
//    let pagingEnabled: Bool?
//    let directionalLockEnabled: Bool?
//    let bounces: Bool?
//    let bouncesZoom: Bool?
//    let alwaysBounceHorizontal: Bool?
//    let alwaysBounceVertical: Bool?
//    let minimumZoomScale: Float?
//    let maximumZoomScale: Float?
//    let delaysContentTouches: Bool?
//    let canCancelContentTouches: Bool?
//    let keyboardDismissMode: String?
//    let scrollIndicatorInsets: Inset?
//    let contentInsetAdjustmentBehavior: String?
//    let contentLayoutGuide: LayoutGuide?
//    let frameLayoutGuide: LayoutGuide?
//
//    static func decode(_ xml: XMLIndexerType) throws -> Self {
//        let container = xml.container(keys: CodingKeys.self)
//        return .init(
//            indicatorStyle: container.attributeIfPresent(of: .indicatorStyle),
//            showsHorizontalScrollIndicator: container.attributeIfPresent(of: .showsHorizontalScrollIndicator),
//            showsVerticalScrollIndicator: container.attributeIfPresent(of: .showsVerticalScrollIndicator),
//            scrollEnabled: container.attributeIfPresent(of: .scrollEnabled),
//            pagingEnabled: container.attributeIfPresent(of: .pagingEnabled),
//            directionalLockEnabled: container.attributeIfPresent(of: .directionalLockEnabled),
//            bounces: container.attributeIfPresent(of: .bounces),
//            bouncesZoom: container.attributeIfPresent(of: .bouncesZoom),
//            alwaysBounceHorizontal: container.attributeIfPresent(of: .alwaysBounceHorizontal),
//            alwaysBounceVertical: container.attributeIfPresent(of: .alwaysBounceVertical),
//            minimumZoomScale: container.attributeIfPresent(of: .minimumZoomScale),
//            maximumZoomScale: container.attributeIfPresent(of: .maximumZoomScale),
//            delaysContentTouches: container.attributeIfPresent(of: .delaysContentTouches),
//            canCancelContentTouches: container.attributeIfPresent(of: .canCancelContentTouches),
//            keyboardDismissMode: container.attributeIfPresent(of: .keyboardDismissMode),
//            scrollIndicatorInsets: container.elementIfPresent(of: .scrollIndicatorInsets),
//            contentInsetAdjustmentBehavior: container.attributeIfPresent(of: .contentInsetAdjustmentBehavior),
//            contentLayoutGuide: container.elementIfPresent(of: .contentLayoutGuide),
//            frameLayoutGuide: container.elementIfPresent(of: .frameLayoutGuide),
//        )
//    }
//}
