//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 01/07/2025.
//

import Testing
@testable import StoryboardDecoder
import Foundation

@Test func modifiedValuesForAttributesInspector() throws {
    guard let url = Bundle.module.url(forResource: "TableView_Modified", withExtension: "xml") else { throw IBError.elementNotFound }
    let sb = try StoryboardFile(url: url)
    let vc = sb.document.scenes?.first?.viewController?.viewController
    guard let tableViews = vc?.rootView?.children(of: TableView.self) else { throw IBError.elementNotFound }
    let sut = tableViews[0]
    // UITableView Attributes Inspector
    #expect(sut.dataMode == .static)
    #expect(sut.style == "insetGrouped")
    #expect(sut.separatorStyle == "singleLineEtched")
    #expect(sut.separatorColor != nil)
    #expect(sut.separatorInset != nil)
    #expect(sut.allowsSelection == nil)
    #expect(sut.allowsMultipleSelection == true)
    #expect(sut.allowsSelectionDuringEditing == true)
    #expect(sut.allowsMultipleSelectionDuringEditing == true)
    #expect(sut.springLoaded == true)
    #expect(sut.sectionIndexMinimumDisplayRowCount == 1)
    #expect(sut.sectionIndexColor != nil)
    #expect(sut.sectionIndexBackgroundColor != nil)
    #expect(sut.sectionIndexTrackingBackgroundColor != nil)
    // UIScrollView Attributes Inspector
    #expect(sut.indicatorStyle == .white)
    #expect(sut.showsHorizontalScrollIndicator == false)
    #expect(sut.showsVerticalScrollIndicator == false)
    #expect(sut.scrollEnabled == false)
    #expect(sut.pagingEnabled == true)
    #expect(sut.isPagingEnabled == true)
    #expect(sut.directionalLockEnabled == true)
    #expect(sut.isDirectionalLockEnabled == true)
    #expect(sut.bounces == false)
    #expect(sut.bouncesZoom == false)
    #expect(sut.alwaysBounceHorizontal == true)
    #expect(sut.alwaysBounceVertical == nil)
    #expect(sut.minimumZoomScale == 2)
    #expect(sut.maximumZoomScale == 3)
    #expect(sut.delaysContentTouches == false)
    #expect(sut.canCancelContentTouches == false)
    #expect(sut.keyboardDismissMode == "interactive")
    // UIView Attributes Inspector
    #expect(sut.contentMode == "bottom")
    #expect(sut.semanticContentAttribute == "forceLeftToRight")
    #expect(sut.tag == 1)
    #expect(sut.userInteractionEnabled == false)
    #expect(sut.multipleTouchEnabled == true)
    #expect(sut.alpha == 0.7)
    #expect(sut.backgroundColor == nil)
    #expect(sut.tintColor != nil)
    #expect(sut.opaque == false)
    #expect(sut.hidden == true)
    #expect(sut.clearsContextBeforeDrawing == false)
    #expect(sut.clipsSubviews == nil)
    #expect(sut.autoresizesSubviews == false)
}

@Test func modifiedValuesForSizeInspector() throws {
    guard let url = Bundle.module.url(forResource: "TableView_Modified", withExtension: "xml") else { throw IBError.elementNotFound }
    let sb = try StoryboardFile(url: url)
    let vc = sb.document.scenes?.first?.viewController?.viewController
    guard let tableViews = vc?.rootView?.children(of: TableView.self) else { throw IBError.elementNotFound }
    let sut = tableViews[0]
    // UITableView Size Inspector
    #expect(sut.rowHeight == 2)
    #expect(sut.estimatedRowHeight == 3)
    #expect(sut.sectionHeaderHeight == 443)
    #expect(sut.estimatedSectionHeaderHeight == 323)
    #expect(sut.sectionFooterHeight == 32)
    #expect(sut.estimatedSectionFooterHeight == 23)
    #expect(sut.contentViewInsetsToSafeArea == false)
    // UIScrollView Size Inspector
    #expect(sut.scrollIndicatorInsets != nil)
    #expect(sut.contentInsetAdjustmentBehavior == "never")
    #expect(sut.frameLayoutGuide != nil)
    #expect(sut.contentLayoutGuide != nil)
    // UIView Size Inspector
    #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
    #expect(sut.directionalLayoutMargins != nil)
    #expect(sut.edgeInset == nil)
    #expect(sut.preservesSuperviewLayoutMargins == true)
    #expect(sut.layoutMarginsFollowReadableWidth == true)
    #expect(sut.insetsLayoutMarginsFromSafeArea == false)
    #expect(sut.horizontalHuggingPriority == nil) // ?
    #expect(sut.verticalHuggingPriority == nil) // ?
    #expect(sut.horizontalCompressionResistancePriority == nil) // ?
    #expect(sut.verticalCompressionResistancePriority == nil) // ?
}
