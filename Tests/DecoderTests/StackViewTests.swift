//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 03/07/2025.
//

import Testing
import StoryboardDecoder
import Foundation

@Suite("StackView")
struct StackViewTests {

    @Test func defaultDefinition() throws {
        let sut = try sut(from: "StackView_Default") as StackView
        #expect(sut.axis == nil)
        #expect(sut.distribution == nil)
        #expect(sut.alignment == nil)
        #expect(sut.spacing == nil)
        #expect(sut.spacingType == nil)
        #expect(sut.baselineRelativeArrangement == nil)
    }

    @Test func modifiedDefinition() throws {
        let sut = try sut(from: "StackView_Modified") as StackView
        #expect(sut.axis == "vertical")
        #expect(sut.distribution == "fillEqually")
        #expect(sut.alignment == "top")
        #expect(sut.spacing == 3)
        #expect(sut.spacingType == nil)
        #expect(sut.baselineRelativeArrangement == true)
    }
}

private let rect = """
Rect(x: 96.0, y: 371.0, width: 200.0, height: 110.0, key: Optional("frame"))
"""
private let autoresizingMask = """
AutoresizingMask(key: Optional("autoresizingMask"), widthSizable: false, heightSizable: false, flexibleMaxX: true, flexibleMaxY: true)
"""
