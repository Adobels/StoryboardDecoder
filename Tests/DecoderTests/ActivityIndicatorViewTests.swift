//
//  TextFieldTests.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 30/06/2025.
//

import Testing
import Foundation
import StoryboardDecoder

@Suite("ActivityIndicatorView Tests")
struct ActivityIndicatorViewTests {

    @Test func defaultConfiguration() throws {
        let sut: ActivityIndicatorView = try sut(from: "ActivityIndicatorView_Default")
        #expect(sut.style == "medium")
    }

    @Test func modifiedConfiguration() throws {
        let sut: ActivityIndicatorView = try sut(from: "ActivityIndicatorView_Modified")
        #expect(sut.hidesWhenStopped == true)
        #expect(sut.animating == true)
        #expect(sut.style == "large")
        #expect(sut.color.testDescription == color)
    }
}

private let color = """
.calibratedWhite(key: Optional("color"), white: 0.75, alpha: 1.0)
"""
