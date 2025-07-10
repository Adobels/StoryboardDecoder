//
//  File.swift
//  StoryboardDecoder
//
//  Created by Blazej Sleboda on 02/07/2025.
//

import Testing
import StoryboardDecoder

@Suite("DatePicker")
struct DatePickerTests {

    @Test func defaultConfiguaration() throws {
        let rect = """
        Rect(x: 0.0, y: 426.0, width: 393.0, height: 0.0, key: Optional("frame"))
        """
        let autoresizingMask = """
        AutoresizingMask(key: Optional("autoresizingMask"), widthSizable: true, heightSizable: false, flexibleMaxX: false, flexibleMaxY: true)
        """
        let sut = try sut(from: "DatePicker_Default") as DatePicker
        #expect(sut.contentMode == "scaleToFill")
        #expect(sut.fixedFrame == true)
        #expect(sut.contentHorizontalAlignment == "center")
        #expect(sut.contentVerticalAlignment == "center")
        #expect(sut.datePickerMode == "dateAndTime")
        #expect(sut.minuteInterval == 1)
        #expect(sut.translatesAutoresizingMaskIntoConstraints == false)
        #expect(sut.id == "y14-R8-GOa")
        #expect(sut.rect.testDescription == rect)
        #expect(sut.autoresizingMask.testDescription == autoresizingMask)
    }

    @Test func modifiedDataPicker() throws {
        let sut = try sut(from: "DatePicker_Modified") as DatePicker
        #expect(sut.style == "compact")
        #expect(sut.datePickerMode == "dateAndTime")
        #expect(sut.locale?.localeIdentifier == "zu_ZA")
        #expect(sut.minuteInterval == 1)
        #expect(sut.countDownDuration == nil)
        #expect(sut.useCurrentDate == false)
        #expect(sut.date?.timeIntervalSinceReferenceDate == "773160130.47646999")
        #expect(sut.minimumDate?.timeIntervalSinceReferenceDate == "-978267600")
        #expect(sut.maximumDate?.timeIntervalSinceReferenceDate == "1167562800")
    }
}
