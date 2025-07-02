//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 01/07/2025.
//

import Testing
@testable import StoryboardDecoder
import Foundation

@Test func defaultValuesForAttributesInspector() throws {
    guard let url = Bundle.module.url(forResource: "TableView_Default", withExtension: "xml") else { throw IBError.elementNotFound }
    let sb = try StoryboardFile(url: url)
    let vc = sb.document.scenes?.first?.viewController?.viewController
    guard let tableViews = vc?.rootView?.children(of: TableView.self) else { throw IBError.elementNotFound }
    let sut = tableViews[0]
    // UITableView Attributes Inspector
    #expect(sut.dataMode == .prototypes)
    #expect(sut.style == "plain")
    #expect(sut.separatorStyle == "default")
    #expect(sut.separatorColor == nil)
    #expect(sut.separatorInset == nil)
    #expect(sut.allowsSelection == nil)
    #expect(sut.allowsMultipleSelection == nil)
    #expect(sut.allowsSelectionDuringEditing == nil)
    #expect(sut.allowsMultipleSelectionDuringEditing == nil)
    #expect(sut.springLoaded == nil)
    #expect(sut.sectionIndexMinimumDisplayRowCount == nil)
    #expect(sut.sectionIndexColor == nil)
    #expect(sut.sectionIndexBackgroundColor == nil)
    #expect(sut.sectionIndexTrackingBackgroundColor == nil)
    // UIScrollView Attributes Inspector
    #expect(sut.indicatorStyle == nil)
    #expect(sut.showsHorizontalScrollIndicator == nil)
    #expect(sut.showsVerticalScrollIndicator == nil)
    #expect(sut.scrollEnabled == nil)
    #expect(sut.pagingEnabled == nil)
    #expect(sut.isPagingEnabled == nil)
    #expect(sut.directionalLockEnabled == nil)
    #expect(sut.isDirectionalLockEnabled == nil)
    #expect(sut.bounces == nil)
    #expect(sut.bouncesZoom == nil)
    #expect(sut.alwaysBounceHorizontal == nil)
    #expect(sut.alwaysBounceVertical == true)
    #expect(sut.minimumZoomScale == nil)
    #expect(sut.maximumZoomScale == nil)
    #expect(sut.delaysContentTouches == nil)
    #expect(sut.canCancelContentTouches == nil)
    #expect(sut.keyboardDismissMode == nil)
    // UIView Attributes Inspector
    #expect(sut.contentMode == "scaleToFill")
    #expect(sut.semanticContentAttribute == nil)
    #expect(sut.tag == nil)
    #expect(sut.userInteractionEnabled == nil)
    #expect(sut.multipleTouchEnabled == nil)
    #expect(sut.alpha == nil)
    #expect(sut.backgroundColor != nil)
    #expect(sut.tintColor == nil)
    #expect(sut.opaque == nil)
    #expect(sut.hidden == nil)
    #expect(sut.clearsContextBeforeDrawing == nil)
    #expect(sut.clipsSubviews == true)
    #expect(sut.autoresizesSubviews == nil)
}

@Test func defaultValuesForSizeInspector() throws {
    guard let url = Bundle.module.url(forResource: "TableView_Default", withExtension: "xml") else { throw IBError.elementNotFound }
    let sb = try StoryboardFile(url: url)
    let vc = sb.document.scenes?.first?.viewController?.viewController
    guard let tableViews = vc?.rootView?.children(of: TableView.self) else { throw IBError.elementNotFound }
    let sut = tableViews[0]
    // UITableView Size Inspector
    #expect(sut.rowHeight == -1)
    #expect(sut.estimatedRowHeight == -1)
    #expect(sut.sectionHeaderHeight == -1)
    #expect(sut.estimatedSectionHeaderHeight == -1)
    #expect(sut.sectionFooterHeight == -1)
    #expect(sut.estimatedSectionFooterHeight == -1)
    #expect(sut.contentViewInsetsToSafeArea == nil)
    // UIScrollView Size Inspector
    #expect(sut.scrollIndicatorInsets == nil)
    #expect(sut.contentInsetAdjustmentBehavior == nil)
    #expect(sut.frameLayoutGuide == nil)
    #expect(sut.contentLayoutGuide == nil)
    // UIView Size Inspector
    #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
    #expect(sut.preservesSuperviewLayoutMargins == nil)
    #expect(sut.layoutMarginsFollowReadableWidth == nil)
    #expect(sut.insetsLayoutMarginsFromSafeArea == nil)
    #expect(sut.horizontalHuggingPriority == nil)
    #expect(sut.verticalHuggingPriority == nil)
    #expect(sut.horizontalCompressionResistancePriority == nil)
    #expect(sut.verticalCompressionResistancePriority == nil)
}
