//
//  ButtonTests.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 03/07/2025.
//

import Testing
import StoryboardDecoder
import Foundation

@Suite("Button Tests")
struct ButtonTests {

    @Test func defaultTest() throws {
        let sut = try sut(from: "Button_Default") as Button
        let rect = """
        Rect(x: 120.0, y: 354.0, width: 75.0, height: 35.0, key: Optional("frame"))
        """
        let autoresizingMask = """
        AutoresizingMask(key: Optional("autoresizingMask"), widthSizable: false, heightSizable: false, flexibleMaxX: true, flexibleMaxY: true)
        """
        let state = """
        [StoryboardDecoder.Button.State(key: Optional("normal"), title: Optional("Button"), color: nil, titleColor: nil, titleShadowColor: nil, image: nil, backgroundImage: nil, catalog: nil)]
        """
        #expect(sut.opaque == false)
        #expect(sut.contentMode == "scaleToFill")
        #expect(sut.fixedFrame == true)
        #expect(sut.contentHorizontalAlignment == "center")
        #expect(sut.contentVerticalAlignment == "center")
        #expect(sut.buttonType == "system")
        #expect(sut.lineBreakMode == "middleTruncation")
        #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
        #expect(sut.id == "gkn-rx-Y7i")
        #expect(sut.rect.testDescription == rect)
        #expect(sut.autoresizingMask.testDescription == autoresizingMask)
        #expect(sut.state.testDescription == state)
    }

    @Test func modifiedTest() throws {
        guard let url = Bundle.module.url(forResource: "Button_Modified", withExtension: "xml") else { throw IBError.elementNotFound }
        let sb = try StoryboardFile(url: url)
        let vc = sb.document.scenes?.first?.viewController?.viewController
        guard let buttons = vc?.rootView?.children(of: Button.self) else { throw IBError.elementNotFound }
        let sut = buttons[0]
        #expect(sut.buttonType == nil)
        #expect(sut.reversesTitleShadowWhenHighlighted == true)
        #expect(sut.showsTouchWhenHighlighted == true)
        #expect(sut.adjustsImageWhenHighlighted == false)
        #expect(sut.adjustsImageWhenDisabled == false)
        #expect(sut.contentEdgeInsets != nil)
        #expect(sut.titleEdgeInsets != nil)
        #expect(sut.imageEdgeInsets != nil)
    }

    @Test("t0B-71-CAf") func t0B71CAf() throws {
        guard let url = Bundle.module.url(forResource: "Button_Modified", withExtension: "xml") else { throw IBError.elementNotFound }
        let sb = try StoryboardFile(url: url)
        let vc = sb.document.scenes?.first?.viewController?.viewController
        guard let buttons = vc?.rootView?.children(of: Button.self) else { throw IBError.elementNotFound }
        let sut = buttons[1]
        #expect(sut.hidden == true)
        #expect(sut.opaque == false)
        #expect(sut.contentMode == "scaleToFill")
        #expect(sut.contentHorizontalAlignment == "center")
        #expect(sut.contentVerticalAlignment == "center")
        #expect(sut.buttonType == "system")
        #expect(sut.lineBreakMode == "middleTruncation")
        #expect(sut.reversesTitleShadowWhenHighlighted == nil)
        #expect(sut.showsTouchWhenHighlighted == nil)
        #expect(sut.adjustsImageWhenHighlighted == nil)
        #expect(sut.adjustsImageWhenDisabled == nil)
        #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
        #expect(sut.id == "t0B-71-CAf")
        #expect(sut.customClass == "CustomButton")
        #expect(sut.customModule == "Designable")
        #expect(sut.rect?.x == 334)
        #expect(sut.rect?.y == 48)
        #expect(sut.rect?.width == 80)
        #expect(sut.rect?.height == 56)
        #expect(sut.constraints?.count == 2)
        #expect(sut.constraints?[0].firstAttribute == .height)
        #expect(sut.constraints?[0].constant == 56)
        #expect(sut.constraints?[0].id == "oqn-rH-8Al")
        #expect(sut.constraints?[1].firstItem == nil)
        #expect(sut.constraints?[1].firstAttribute == .width)
        #expect(sut.constraints?[1].secondItem == nil)
        #expect(sut.constraints?[1].secondAttribute == nil)
        #expect(sut.constraints?[1].constant == 80)
        #expect(sut.constraints?[1].id == "zNT-vD-wNX")
        #expect(sut.fontDescription.testDescription == TOB71CAfHelper.fontDescription)
        #expect(sut.tintColor.testDescription == TOB71CAfHelper.tintColorTOB71CAf)
        #expect(sut.contentEdgeInsets == nil)
        #expect(sut.titleEdgeInsets.testDescription == TOB71CAfHelper.titleEdgeInsetsTOB71CAf)
        #expect(sut.imageEdgeInsets == nil)
        #expect(sut.userDefinedRuntimeAttributes?.count == 1)
        #expect(sut.userDefinedRuntimeAttributes?[0].type == "string")
        #expect(sut.userDefinedRuntimeAttributes?[0].keyPath == "locKey")
        #expect(sut.userDefinedRuntimeAttributes?[0].value as! String ==  "button.confirm.top")
        #expect((sut.connections?.first?.connection as! Action).selector == "confirmWithButton:")
        #expect((sut.connections?.first?.connection as! Action).destination == "J0H-ww-VqV")
        #expect((sut.connections?.first?.connection as! Action).eventType == "touchUpInside")
        #expect((sut.connections?.first?.connection as! Action).id == "Lhr-C8-Hnk")
        #expect(sut.subviews == nil)
    }
}

struct TOB71CAfHelper {
    static let fontDescription = """
.system(key: Optional("fontDescription"), type: "system", weight: Optional("medium"), pointSize: 15.0)
"""
    static let titleEdgeInsetsTOB71CAf = """
Inset(key: Optional("titleEdgeInsets"), minX: Optional(12.0), minY: Optional(0.0), maxX: Optional(0.0), maxY: Optional(0.0))
"""
    static let tintColorTOB71CAf = """
.gamma22Gray(key: Optional("tintColor"), white: 1.0, alpha: 1.0)
"""
}
