//
//  TextFieldTests.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 30/06/2025.
//

import Testing
import Foundation
import StoryboardDecoder
import SWXMLHash

struct TextFieldTests {

    @Test func testDefault() throws {
        let url = Bundle.module.url(forResource: "TextField_Default", withExtension: "xml")!
        let file = try StoryboardFile(url: url)
        guard let viewController = file.document.scenes?.first?.viewController?.viewController else { throw IBError.elementNotFound }
        guard let textField = viewController.rootView?.children(of: TextField.self).first else { throw IBError.elementNotFound }
        // -- TextField
        #expect(textField.text == nil)
        #expect(textField.textColor == nil)
        #expect(textField.adjustsFontForContentSizeCategory == nil)
        #expect(textField.textAlignment == "natural")
        #expect(textField.allowsEditingTextAttributes == nil)
        #expect(textField.placeholder == nil)
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
        #expect(textField.showsMenuAsPrimaryAction == nil)
        #expect(textField.selected == nil)
        #expect(textField.enabled == nil)
        #expect(textField.highlighted == nil)
        #expect(textField.toolTip == nil)
        // -- View
        #expect(textField.contentMode == "scaleToFill")
        #expect(textField.semanticContentAttribute == nil)
        #expect(textField.tag == nil)
        #expect(textField.userInteractionEnabled == nil)
        #expect(textField.multipleTouchEnabled == nil)
        #expect(textField.alpha == nil)
        #expect(textField.backgroundColor == nil)
        #expect(textField.tintColor == nil)
        #expect(textField.opaque == false)
        #expect(textField.hidden == nil)
        #expect(textField.clearsContextBeforeDrawing == nil)
        #expect(textField.clipsSubviews == nil)
        #expect(textField.autoresizesSubviews == nil)
    }

    @Test func storyboardTextFieldAllPropertiesCustomized() throws {
        let url = Bundle.module.url(forResource: "TextField_Modified", withExtension: "xml")!
        let file = try StoryboardFile(url: url)
        guard let viewController = file.document.scenes?.first?.viewController?.viewController else { throw IBError.elementNotFound }
        guard let textField = viewController.rootView?.children(of: TextField.self).first else { throw IBError.elementNotFound }
        // -- TextField
        #expect(textField.text == "text text")
        #expect(textField.textColor != nil)
        #expect(textField.adjustsFontForContentSizeCategory == true)
        #expect(textField.textAlignment == "center")
        #expect(textField.allowsEditingTextAttributes == nil)
        #expect(textField.placeholder == "placeholder text")
        #expect(textField.borderStyle == "line")
        #expect(textField.clearButtonMode == .whileEditing)
        #expect(textField.clearsOnBeginEditing == true)
        #expect(textField.minimumFontSize == 18)
        #expect(textField.adjustsFontSizeToFit == false)
        #expect(textField.sizingRule == .oversize)
        #expect(textField.textInputTraits?.textContentType == .name)
        #expect(textField.textInputTraits?.autocapitalizationType == .words)
        #expect(textField.textInputTraits?.autocorrectionType == "no")
        #expect(textField.textInputTraits?.smartDashesType == "no")
        #expect(textField.textInputTraits?.smartInsertDeleteType == "no")
        #expect(textField.textInputTraits?.smartQuotesType == "no")
        #expect(textField.textInputTraits?.spellCheckingType == "no")
        #expect(textField.textInputTraits?.keyboardType == .alphabet)
        #expect(textField.textInputTraits?.keyboardAppearance == .alert)
        #expect(textField.textInputTraits?.returnKeyType == .go)
        #expect(textField.textInputTraits?.enablesReturnKeyAutomatically == true)
        #expect(textField.textInputTraits?.secureTextEntry == true)
        // -- Control
        #expect(textField.contentHorizontalAlignment == "center")
        #expect(textField.contentVerticalAlignment == "bottom")
        #expect(textField.showsMenuAsPrimaryAction == true)
        #expect(textField.selected == true)
        #expect(textField.enabled == false)
        #expect(textField.highlighted == true)
        #expect(textField.toolTip == "my tooltip")
        // -- View
        #expect(textField.contentMode == "scaleAspectFit")
        #expect(textField.semanticContentAttribute == "playback")
        #expect(textField.tag == 1)
        #expect(textField.userInteractionEnabled == false)
        #expect(textField.multipleTouchEnabled == true)
        #expect(textField.alpha == 0.9)
        #expect(textField.backgroundColor != nil)
        #expect(textField.tintColor != nil)
        #expect(textField.opaque == nil)
        #expect(textField.hidden == true)
        #expect(textField.clearsContextBeforeDrawing == false)
        #expect(textField.clipsSubviews == true)
        #expect(textField.autoresizesSubviews == false)
    }
}
