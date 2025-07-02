//
//  TextFieldTests.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 30/06/2025.
//

import Testing
import Foundation
import StoryboardDecoder

struct TextFieldTests {

    @Test func testDefault() throws {
        let url = Bundle.module.url(forResource: "TextField", withExtension: "xml")!
        let file = try StoryboardFile(url: url)
        guard let viewController = file.document.scenes?.first?.viewController?.viewController else { throw IBError.elementNotFound }
        guard let textField = viewController.rootView?.children(of: TextField.self).first else { throw IBError.elementNotFound }
        // -- TextField
        #expect(textField.text == nil)
        // missing support for attributed text
        #expect(textField.textColor == nil)
        #expect(textField.adjustsFontForContentSizeCategory == nil)
        #expect(textField.textAlignment == "natural")
        #expect(textField.placeholder == nil)
        // missing support for background image
        // missing support for disabled image
        #expect(textField.borderStyle == "roundedRect")
        #expect(textField.clearButtonMode == nil)
        #expect(textField.clearsOnBeginEditing == nil)
        #expect(textField.minimumFontSize == 17)
        #expect(textField.adjustsFontSizeToFit == nil)
        #expect(textField.sizingRule == nil)
        #expect(textField.textInputTraits?.textContentType == nil)
        #expect(textField.textInputTraits?.autocapitalizationType == nil)
        #expect(textField.textInputTraits?.autocorrectionType == nil)
        #expect(textField.textInputTraits?.smartDashesType == nil)
        #expect(textField.textInputTraits?.smartInsertDeleteType == nil)
        #expect(textField.textInputTraits?.smartQuotesType == nil)
        #expect(textField.textInputTraits?.spellCheckingType == nil)
        #expect(textField.textInputTraits?.keyboardType == nil)
        #expect(textField.textInputTraits?.keyboardAppearance == nil)
        #expect(textField.textInputTraits?.returnKeyType == nil)
        #expect(textField.textInputTraits?.enablesReturnKeyAutomatically == nil)
        #expect(textField.textInputTraits?.secureTextEntry == nil)
        // -- Control
        #expect(textField.contentHorizontalAlignment == "left")
        #expect(textField.contentVerticalAlignment == "center")
        // missing support for Menu: Shows as Primary Action
        #expect(textField.isSelected == nil)
        #expect(textField.isEnabled == nil)
        #expect(textField.isHighlighted == nil)
        // missing support for tooltip
        // -- View
        #expect(textField.contentMode == "scaleToFill")
        // missing support for semantic
        // missing support for tag
        #expect(textField.userInteractionEnabled == nil)
        // missing support for multiple touch
        #expect(textField.alpha == nil)
        #expect(textField.backgroundColor == nil)
        #expect(textField.tintColor == nil)
        #expect(textField.opaque == false)
        #expect(textField.hidden == nil)
        // missing support for clears graphics context
        #expect(textField.clipsSubviews == nil)
        // missing support for autoresize subviews
        // missing supoort for stretching
    }

    @Test func storyboardTextFieldAllPropertiesCustomized() throws {
        let url = Bundle.module.url(forResource: "TextField", withExtension: "xml")!
        let file = try StoryboardFile(url: url)
        guard let viewController = file.document.scenes?.first?.viewController?.viewController else { throw IBError.elementNotFound }
        guard let textField = viewController.rootView?.children(of: TextField.self)[1] else { throw IBError.elementNotFound }
        // -- TextField
        #expect(textField.text == "text text")
        // missing support for attributed text
        #expect(textField.textColor != nil)
        #expect(textField.adjustsFontForContentSizeCategory == true)
        #expect(textField.textAlignment == "center")
        #expect(textField.placeholder == "placeholder text")
        // missing support for background image
        // missing support for disabled image
        #expect(textField.borderStyle == "line")
        #expect(textField.clearButtonMode == .whileEditing)
        #expect(textField.clearsOnBeginEditing == true)
        #expect(textField.minimumFontSize == 18)
        #expect(textField.adjustsFontSizeToFit == false)
        #expect(textField.sizingRule == .oversize)
        #expect(textField.textInputTraits?.textContentType == .name)
        #expect(textField.textInputTraits?.autocapitalizationType == .words)
        #expect(textField.textInputTraits?.autocorrectionType == false)
        #expect(textField.textInputTraits?.smartDashesType == false)
        #expect(textField.textInputTraits?.smartInsertDeleteType == false)
        #expect(textField.textInputTraits?.smartQuotesType == false)
        #expect(textField.textInputTraits?.spellCheckingType == false)
        #expect(textField.textInputTraits?.keyboardType == .alphabet)
        #expect(textField.textInputTraits?.keyboardAppearance == .alert)
        #expect(textField.textInputTraits?.returnKeyType == .go)
        #expect(textField.textInputTraits?.enablesReturnKeyAutomatically == true)
        #expect(textField.textInputTraits?.secureTextEntry == true)
        // -- Control
        #expect(textField.contentHorizontalAlignment == "center")
        #expect(textField.contentVerticalAlignment == "bottom")
        // missing support for Menu: Shows as Primary Action
        #expect(textField.isSelected == true)
        #expect(textField.isEnabled == false)
        #expect(textField.isHighlighted == true)
        // missing support for tooltip
        // -- View
        #expect(textField.contentMode == "scaleAspectFit")
        // missing support for semantic
        // missing support for tag
        #expect(textField.userInteractionEnabled == false)
        // missing support for multiple touch
        #expect(textField.alpha == 0.9)
        #expect(textField.backgroundColor != nil)
        #expect(textField.tintColor != nil)
        #expect(textField.opaque == nil)
        #expect(textField.hidden == true)
        // missing support for clears graphics context
        #expect(textField.clipsSubviews == true)
        // missing support for autoresize subviews
        // missing supoort for stretching
    }
}
