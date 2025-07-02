//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 02/07/2025.
//

import Testing
import StoryboardDecoder
import Foundation

@Suite("DatePicker Tests")
struct DatePickerTests {

    @Test func modifiedDataPicker() throws {
        guard let url = Bundle.module.url(forResource: "DatePicker_Modified", withExtension: "xml") else { throw IBError.elementNotFound }
        let sb = try StoryboardFile(url: url)
        let vc = sb.document.scenes?.first?.viewController?.viewController
        guard let datePickers = vc?.rootView?.children(of: DatePicker.self) else { throw IBError.elementNotFound }
        let sut = datePickers[0]
        #expect(sut.style == "compact")
        #expect(sut.datePickerMode == "dateAndTime")
        #expect(sut.locale?.localeIdentifier == "zu_ZA")
        #expect(sut.minuteInterval == 1)
        #expect(sut.date?.timeIntervalSinceReferenceDate == "773160130.47646999")
        #expect(sut.minimumDate?.timeIntervalSinceReferenceDate == "-978267600")
        #expect(sut.maximumDate?.timeIntervalSinceReferenceDate == "1167562800")
    }
}
