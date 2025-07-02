//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 02/07/2025.
//

import Testing
import StoryboardDecoder
import Foundation

@Suite("View Default")
struct ViewTests {
    @Test func defaultView() throws {
        guard let url = Bundle.module.url(forResource: "View_Default", withExtension: "xml") else { throw IBError.elementNotFound }
        let sb = try StoryboardFile(url: url)
        let vc = sb.document.scenes?.first?.viewController?.viewController
        guard let views = vc?.rootView?.children(of: View.self) else { throw IBError.elementNotFound }
        let sut = views[0]
        #expect(sut.key == nil)
        // MARK: Identity Inspector
        #expect(sut.id == "FKW-Mx-rZt")
        #expect(sut.elementClass == "UIView")
        #expect(sut.customClass == nil)
        #expect(sut.customModule == nil)
        #expect(sut.customModuleProvider == nil)
        #expect(sut.userDefinedRuntimeAttributes == nil)
        #expect(sut.userLabel == nil)
        #expect(sut.colorLabel == nil)
        #expect(sut.accessibility == nil)
        //MARK: Attributes Inspector
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
        #expect(sut.clipsSubviews == nil)
        #expect(sut.autoresizesSubviews == nil)
        // MARK: Size Inspector
        #expect(sut.rect != nil)
        #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
        #expect(sut.autoresizingMask != nil)
        #expect(sut.directionalLayoutMargins == nil)
        #expect(sut.edgeInset == nil)
        #expect(sut.preservesSuperviewLayoutMargins == nil)
        #expect(sut.layoutMarginsFollowReadableWidth == nil)
        #expect(sut.insetsLayoutMarginsFromSafeArea == nil)
        #expect(sut.viewLayoutGuide == nil)
        #expect(sut.keyboardLayoutGuide == nil)
        #expect(sut.horizontalHuggingPriority == nil)
        #expect(sut.verticalHuggingPriority == nil)
        #expect(sut.horizontalCompressionResistancePriority == nil)
        #expect(sut.verticalCompressionResistancePriority == nil)
        #expect(sut.constraints == nil)
        #expect(sut.connections == nil)
        #expect(sut.variations == nil)
        #expect(sut.subviews == nil)
        #expect(sut.verifyAmbiguity == nil)
        #expect(sut.isMisplaced == nil)
        #expect(sut.isAmbiguous == nil)
    }

    @Test func modifiedView() throws {
        guard let url = Bundle.module.url(forResource: "View_Modified", withExtension: "xml") else { throw IBError.elementNotFound }
        let sb = try StoryboardFile(url: url)
        let vc = sb.document.scenes?.first?.viewController?.viewController
        guard let views = vc?.rootView?.children(of: View.self) else { throw IBError.elementNotFound }
        let sut = views[0]
        #expect(sut.key == nil)
        // MARK: Identity Inspector
        #expect(sut.id == "FKW-Mx-rZt")
        #expect(sut.elementClass == "UIView")
        #expect(sut.customClass == "CustomView")
        #expect(sut.customModule == "pocColor")
        #expect(sut.customModuleProvider == "target")
        #expect(sut.userDefinedRuntimeAttributes != nil)
        #expect(sut.userLabel == "My Custom View")
        #expect(sut.colorLabel == "IBBuiltInLabel-Purple")
        #expect(sut.accessibility != nil)
        //MARK: Attributes Inspector
        #expect(sut.contentMode == "center")
        #expect(sut.semanticContentAttribute == "forceLeftToRight")
        #expect(sut.tag == 2)
        #expect(sut.userInteractionEnabled == false)
        #expect(sut.multipleTouchEnabled == true)
        #expect(sut.alpha == 0.95)
        #expect(sut.backgroundColor == nil)
        #expect(sut.tintColor != nil)
        #expect(sut.opaque == false)
        #expect(sut.hidden == true)
        #expect(sut.clearsContextBeforeDrawing == false)
        #expect(sut.clipsSubviews == true)
        #expect(sut.autoresizesSubviews == false)
        // MARK: Size Inspector
        #expect(sut.rect != nil)
        #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
        #expect(sut.autoresizingMask == nil)
        #expect(sut.directionalLayoutMargins != nil)
        #expect(sut.edgeInset == nil)
        #expect(sut.preservesSuperviewLayoutMargins == true)
        #expect(sut.layoutMarginsFollowReadableWidth == true)
        #expect(sut.insetsLayoutMarginsFromSafeArea == false)
        #expect(sut.viewLayoutGuide != nil)
        #expect(sut.keyboardLayoutGuide != nil)
        #expect(sut.horizontalHuggingPriority == 100)
        #expect(sut.verticalHuggingPriority == 100)
        #expect(sut.horizontalCompressionResistancePriority == 200)
        #expect(sut.verticalCompressionResistancePriority == 200)
        #expect(sut.constraints != nil)
        #expect(sut.connections == nil)
        #expect(sut.variations == nil)
        #expect(sut.subviews == nil)
        #expect(sut.verifyAmbiguity != nil)
        #expect(sut.isMisplaced == nil)
        #expect(sut.isAmbiguous == nil)
    }
}
