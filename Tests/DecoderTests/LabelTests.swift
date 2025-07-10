//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 03/07/2025.
//

import Testing
import StoryboardDecoder
import Foundation

@Suite("Label Tests")
struct LabelTests {

    @Test func defaultDefinition() throws {
        let sut = try sut(from: "Label_Default") as Label
        #expect(sut.opaque == false)
        #expect(sut.userInteractionEnabled == false)
        #expect(sut.contentMode == "left")
        #expect(sut.horizontalHuggingPriority == 251)
        #expect(sut.verticalHuggingPriority == 251)
        #expect(sut.fixedFrame == true)
        #expect(sut.text == "Label")
        #expect(sut.textAlignment == "natural")
        #expect(sut.lineBreakMode == "tailTruncation")
        #expect(sut.baselineAdjustment == "alignBaselines")
        #expect(sut.adjustsFontSizeToFit == false)
        #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
        #expect(sut.id == "UDe-i0-D2i")
        #expect(sut.rect.testDescription == rect)
        #expect(sut.autoresizingMask.testDescription == autoresizingMask)
        #expect(sut.fontDescription.testDescription == fontDescription)
    }

    @Test func attributesWhichAreNotSetInStoryboard2() throws {
        let sut = try sut(from: "Label_Default 2") as Label
        #expect(sut.textColor != nil)
    }
    @Test func attributesWhichAreNotSetInStoryboard() throws {
        let sut = try sut(from: "Label_Default") as Label
        #expect(sut.key == nil)
        #expect(sut.elementClass == "UILabel")
        #expect(sut.customClass == nil)
        #expect(sut.customModule == nil)
        #expect(sut.customModuleProvider == nil)
        #expect(sut.restorationIdentifier == nil)
        #expect(sut.userDefinedRuntimeAttributes == nil)
        #expect(sut.userLabel == nil)
        #expect(sut.colorLabel == nil)
        #expect(sut.accessibility == nil)
        #expect(sut.semanticContentAttribute == nil)
        #expect(sut.tag == nil)
        #expect(sut.multipleTouchEnabled == nil)
        #expect(sut.alpha == nil)
        #expect(sut.backgroundColor == nil)
        #expect(sut.tintColor == nil)
        #expect(sut.hidden == nil)
        #expect(sut.clearsContextBeforeDrawing == nil)
        #expect(sut.clipsSubviews == nil)
        #expect(sut.autoresizesSubviews == nil)
        #expect(sut.directionalLayoutMargins == nil)
        #expect(sut.layoutMargins == nil)
        #expect(sut.preservesSuperviewLayoutMargins == nil)
        #expect(sut.layoutMarginsFollowReadableWidth == nil)
        #expect(sut.insetsLayoutMarginsFromSafeArea == nil)
        #expect(sut.safeArea == nil)
        #expect(sut.keyboard == nil)
        #expect(sut.constraints == nil)
        #expect(sut.horizontalCompressionResistancePriority == nil)
        #expect(sut.verticalCompressionResistancePriority == nil)
        #expect(sut.connections == nil)
        #expect(sut.verifyAmbiguity == nil)
        #expect(sut.misplaced == nil)
        #expect(sut.ambiguous == nil)
        #expect(sut.variations == nil)
        #expect(sut.subviews == nil)
        // MARK: UILabel
        #expect(sut.attributedText == nil)
        #expect(sut.textColor == nil)
        #expect(sut.adjustsFontForContentSizeCategory == nil)
        #expect(sut.numberOfLines == nil)
        #expect(sut.enabled == nil)
        #expect(sut.highlighted == nil)
        #expect(sut.showsExpansionTextWhenTruncated == nil)
        #expect(sut.minimumScaleFactor == nil)
        #expect(sut.minimumFontSize == nil)
        #expect(sut.adjustsLetterSpacingToFitWidth == nil)
        #expect(sut.sizingRule == nil)
        #expect(sut.highlightedColor == nil)
        #expect(sut.shadowColor == nil)
        #expect(sut.shadowOffset == nil)
        #expect(sut.preferredMaxLayoutWidth == nil)
    }
}

private let rect = """
Rect(x: 175.0, y: 415.0, width: 42.0, height: 21.0, key: Optional("frame"))
"""
private let autoresizingMask = """
AutoresizingMask(key: Optional("autoresizingMask"), widthSizable: false, heightSizable: false, flexibleMaxX: true, flexibleMaxY: true)
"""

private let fontDescription = """
.system(key: Optional("fontDescription"), type: "system", weight: nil, pointSize: 17.0)
"""
