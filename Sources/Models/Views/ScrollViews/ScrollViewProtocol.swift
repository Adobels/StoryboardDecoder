//
//  ScrollViewProtocol.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 01/07/2025.
//

import Foundation


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
