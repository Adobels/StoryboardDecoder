//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 03/07/2025.
//

import Testing
import StoryboardDecoder
import Foundation

@Suite("StackView Tests")
struct StackViewTests {

    @Test func defaultDefinition() throws {

    }

    @Test func modifiedDefinition() throws {
        guard let url = Bundle.module.url(forResource: "StackView_Modified", withExtension: "xml") else { throw IBError.elementNotFound }
        let sb = try StoryboardFile(url: url)
        let vc = sb.document.scenes?.first?.viewController?.viewController
        guard let stackViews = vc?.rootView?.children(of: StackView.self) else { throw IBError.elementNotFound }
        let sut = stackViews[0]
        #expect(sut.key == nil)
        // MARK: Identity Inspector
        #expect(sut.id == "oDe-Pa-wt3")
        #expect(sut.elementClass == "UIStackView")
        #expect(sut.customClass == "MyStackView")
        #expect(sut.customModule == "pocColor")
        #expect(sut.customModuleProvider == "target")
        #expect(sut.userDefinedRuntimeAttributes != nil)
        #expect(sut.userLabel == "My Stack View Label")
        #expect(sut.colorLabel == "IBBuiltInLabel-Green")
        #expect(sut.accessibility == nil)
        //MARK: Attributes Inspector
        #expect(sut.contentMode == "scaleAspectFit")
        #expect(sut.semanticContentAttribute == "playback")
        #expect(sut.tag == 3)
        #expect(sut.userInteractionEnabled == false)
        #expect(sut.multipleTouchEnabled == true)
        #expect(sut.alpha == 0.95)
        #expect(sut.backgroundColor != nil)
        #expect(sut.tintColor != nil)
        #expect(sut.opaque == nil)
        #expect(sut.hidden == true)
        #expect(sut.clearsContextBeforeDrawing == false)
        #expect(sut.clipsSubviews == true)
        #expect(sut.autoresizesSubviews == false)
        // MARK: Size Inspector
        #expect(sut.rect != nil)
        #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
        #expect(sut.autoresizingMask == nil)
        #expect(sut.directionalLayoutMargins == nil)
        //#expect(sut.layoutMargins.testDescription == layoutMarginsTestDescription)
        #expect(sut.preservesSuperviewLayoutMargins == true)
        #expect(sut.layoutMarginsFollowReadableWidth == true)
        #expect(sut.insetsLayoutMarginsFromSafeArea == false)
        //#expect(sut.viewLayoutGuide != nil)
        //#expect(sut.keyboardLayoutGuide != nil)
        #expect(sut.horizontalHuggingPriority == 251)
        #expect(sut.verticalHuggingPriority == 251)
        #expect(sut.horizontalCompressionResistancePriority == 749)
        #expect(sut.verticalCompressionResistancePriority == 749)
        #expect(sut.constraints != nil)
        #expect(sut.constraints?.count == 2)
        #expect(sut.connections == nil)
        #expect(sut.variations == nil)
        #expect(sut.subviews != nil)
        #expect(sut.subviews?.count == 1)
        #expect(sut.verifyAmbiguity.testDescription == ".off")
        #expect(sut.misplaced == nil)
        #expect(sut.ambiguous == true)
    }
}
