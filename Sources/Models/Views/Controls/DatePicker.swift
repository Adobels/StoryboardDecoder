//
//  DatePicker.swift
//  IBDecodable
//
//  Created by phimage on 01/04/2018.
//

import SWXMLHash

protocol DatePickerProtocol: ViewProtocol, ControlProtocol {
    var style: String? { get } // IB: Preferred Style; UIKit datePickerStyle: UIDatePickerStyle
    var datePickerMode: String? { get } // IB: Mode; UIKit: datePickerMode: UIDatePicker.Mode
    var locale: DatePickerLocale? { get }
    var minuteInterval: Int { get }
    var date: IBDate? { get }
    var minimumDate: IBDate? { get }
    var maximumDate: IBDate? { get }
}

public struct DatePicker: IBDecodable, DatePickerProtocol, IBIdentifiable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UIDatePicker"
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let userLabel: String?
    public let colorLabel: String?
    public let accessibility: Accessibility?
    public let contentMode: String?
    public let semanticContentAttribute: String?
    public let tag: Int?
    public let userInteractionEnabled: Bool?
    public let multipleTouchEnabled: Bool?
    public let alpha: Float?
    public let backgroundColor: Color?
    public let tintColor: Color?
    public let opaque: Bool?
    public let hidden: Bool?
    public let clearsContextBeforeDrawing: Bool?
    public let clipsSubviews: Bool?
    public let autoresizesSubviews: Bool?
    public let rect: Rect?
    public let translatesAutoresizingMaskIntoConstraints: Bool?
    public let autoresizingMask: AutoresizingMask?
    public let directionalLayoutMargins: DirectionalEdgeInsets?
    public let layoutMargins: EdgeInset?
    public let preservesSuperviewLayoutMargins: Bool?
    public let layoutMarginsFollowReadableWidth: Bool?
    public let insetsLayoutMarginsFromSafeArea: Bool?
    public let safeArea: LayoutGuide?
    public let keyboard: LayoutGuide?
    public let constraints: [Constraint]?
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let connections: [AnyConnection]?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    public let variations: [Variation]?
    public let subviews: [AnyView]?
    // MARK: UIControl
    public let contentHorizontalAlignment: String?
    public let contentVerticalAlignment: String?
    public let showsMenuAsPrimaryAction: Bool?
    public let isSelected: Bool?
    public let isEnabled: Bool?
    public let isHighlighted: Bool?
    public let toolTip: String?
    // MARK: UIDatePicker
    public let style: String?
    public let datePickerMode: String?
    public let locale: DatePickerLocale?
    public let minuteInterval: Int
    public let countDownDuration: Int?
    public let useCurrentDate: Bool?
    public let date: IBDate?
    public let minimumDate: IBDate?
    public let maximumDate: IBDate?

    enum ViewCodingKeys: CodingKey { case date }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> DatePicker {
        let view = try View.decode(xml)
        let control = try Control.decode(xml)
        let datePicker = xml.container(keys: CodingKeys.self)
        let datePickerDateContainer = xml.container(keys: ViewCodingKeys.self).nestedContainerIfPresent(of: .date, keys: KeyCodingKeys.self)
        return DatePicker(
            id:                                        view.id,
            key:                                       view.key,
            customClass:                               view.customClass,
            customModule:                              view.customModule,
            customModuleProvider:                      view.customModuleProvider,
            restorationIdentifier:                     view.restorationIdentifier,
            userDefinedRuntimeAttributes:              view.userDefinedRuntimeAttributes,
            userLabel:                                 view.userLabel,
            colorLabel:                                view.colorLabel,
            accessibility:                             view.accessibility,
            contentMode:                               view.contentMode,
            semanticContentAttribute:                  view.semanticContentAttribute,
            tag:                                       view.tag,
            userInteractionEnabled:                    view.userInteractionEnabled,
            multipleTouchEnabled:                      view.multipleTouchEnabled,
            alpha:                                     view.alpha,
            backgroundColor:                           view.backgroundColor,
            tintColor:                                 view.tintColor,
            opaque:                                    view.opaque,
            hidden:                                    view.hidden,
            clearsContextBeforeDrawing:                view.clearsContextBeforeDrawing,
            clipsSubviews:                             view.clipsSubviews,
            autoresizesSubviews:                       view.autoresizesSubviews,
            rect:                                      view.rect,
            translatesAutoresizingMaskIntoConstraints: view.translatesAutoresizingMaskIntoConstraints,
            autoresizingMask:                          view.autoresizingMask,
            directionalLayoutMargins:                  view.directionalLayoutMargins,
            layoutMargins:                             view.layoutMargins,
            preservesSuperviewLayoutMargins:           view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth:          view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea:           view.insetsLayoutMarginsFromSafeArea,
            safeArea:                                  view.safeArea,
            keyboard:                                  view.keyboard,
            constraints:                               view.constraints,
            horizontalHuggingPriority:                 view.horizontalHuggingPriority,
            verticalHuggingPriority:                   view.verticalHuggingPriority,
            horizontalCompressionResistancePriority:   view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority:     view.verticalCompressionResistancePriority,
            connections:                               view.connections,
            verifyAmbiguity:                           view.verifyAmbiguity,
            isMisplaced:                               view.isMisplaced,
            isAmbiguous:                               view.isAmbiguous,
            variations:                                view.variations,
            subviews:                                  view.subviews,
            contentHorizontalAlignment:                control.contentHorizontalAlignment,
            contentVerticalAlignment:                  control.contentVerticalAlignment,
            showsMenuAsPrimaryAction:                  control.showsMenuAsPrimaryAction,
            isSelected:                                control.isSelected,
            isEnabled:                                 control.isEnabled,
            isHighlighted:                             control.isHighlighted,
            toolTip:                                   control.toolTip,
            style:                                     datePicker.attributeIfPresent(of: .style),
            datePickerMode:                            datePicker.attributeIfPresent(of: .datePickerMode),
            locale:                                    datePicker.elementIfPresent(of: .locale),
            minuteInterval:                            try datePicker.attribute(of: .minuteInterval),
            countDownDuration:                         datePicker.attributeIfPresent(of: .countDownDuration),
            useCurrentDate:                            datePicker.attributeIfPresent(of: .useCurrentDate),
            date:                                      datePickerDateContainer?.withAttributeElement(.key, CodingKeys.date.stringValue),
            minimumDate:                               datePickerDateContainer?.withAttributeElement(.key, CodingKeys.minimumDate.stringValue),
            maximumDate:                               datePickerDateContainer?.withAttributeElement(.key, CodingKeys.maximumDate.stringValue),
        )
    }
}

public struct DatePickerLocale: IBDecodable, IBKeyable {

    public let key: String?
    public let localeIdentifier: String

    static func decode(_ xml: any XMLIndexerType) throws -> Self {
        let container = xml.container(keys: CodingKeys.self)
        return .init(
            key: container.attributeIfPresent(of: .key),
            localeIdentifier: try container.attribute(of: .localeIdentifier)
        )
    }
}
