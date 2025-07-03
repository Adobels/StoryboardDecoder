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
    public let id: String
    public let elementClass: String = "UIDatePicker"
    public let key: String?
    public let autoresizingMask: AutoresizingMask?
    public let clipsSubviews: Bool?
    public let constraints: [Constraint]?
    public let contentMode: String?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let opaque: Bool?
    public let rect: Rect?
    public let subviews: [AnyView]?
    public let translatesAutoresizingMaskIntoConstraints: Bool?
    public let userInteractionEnabled: Bool?
    public let viewLayoutGuide: LayoutGuide?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    public let backgroundColor: Color?
    public let tintColor: Color?
    public let hidden: Bool?
    public let alpha: Float?

    public let isEnabled: Bool?
    public let isHighlighted: Bool?
    public let isSelected: Bool?
    public let contentHorizontalAlignment: String?
    public let contentVerticalAlignment: String?

    public let datePickerMode: String?
    public let date: IBDate?
    public let style: String?
    public let useCurrentDate: Bool?
    public let countDownDuration: Int?
    public let minimumDate: IBDate?
    public let maximumDate: IBDate?
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?
    public let accessibility: Accessibility?
    public let tag: Int?
    public let autoresizesSubviews: Bool?
    public let clearsContextBeforeDrawing: Bool?
    public let multipleTouchEnabled: Bool?
    public let semanticContentAttribute: String?
    public let preservesSuperviewLayoutMargins: Bool?
    public let layoutMarginsFollowReadableWidth: Bool?
    public let insetsLayoutMarginsFromSafeArea: Bool?
    public let directionalLayoutMargins: DirectionalEdgeInsets?
    public let layoutMargins: EdgeInset?
    public let toolTip: String?
    public let showsMenuAsPrimaryAction: Bool?
    public let locale: DatePickerLocale?
    public let minuteInterval: Int

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
            autoresizingMask:                          view.autoresizingMask,
            clipsSubviews:                             view.clipsSubviews,
            constraints:                               view.constraints,
            contentMode:                               view.contentMode,
            customClass:                               view.customClass,
            customModule:                              view.customModule,
            customModuleProvider:                      view.customModuleProvider,
            restorationIdentifier:                     view.restorationIdentifier,
            userLabel:                                 view.userLabel,
            colorLabel:                                view.colorLabel,
            isMisplaced:                               view.isMisplaced,
            isAmbiguous:                               view.isAmbiguous,
            verifyAmbiguity:                           view.verifyAmbiguity,
            opaque:                                    view.opaque,
            rect:                                      view.rect,
            subviews:                                  view.subviews,
            translatesAutoresizingMaskIntoConstraints: view.translatesAutoresizingMaskIntoConstraints,
            userInteractionEnabled:                    view.userInteractionEnabled,
            viewLayoutGuide:                           view.viewLayoutGuide,
            userDefinedRuntimeAttributes:              view.userDefinedRuntimeAttributes,
            connections:                               view.connections,
            variations:                                view.variations,
            backgroundColor:                           view.backgroundColor,
            tintColor:                                 view.tintColor,
            hidden:                                    view.hidden,
            alpha:                                     view.alpha,
            isEnabled:                                 control.isEnabled,
            isHighlighted:                             control.isHighlighted,
            isSelected:                                control.isSelected,
            contentHorizontalAlignment:                control.contentHorizontalAlignment,
            contentVerticalAlignment:                  control.contentVerticalAlignment,
            datePickerMode:                            datePicker.attributeIfPresent(of: .datePickerMode),
            date:                                      datePickerDateContainer?.withAttributeElement(.key, CodingKeys.date.stringValue),
            style:                                     datePicker.attributeIfPresent(of: .style),
            useCurrentDate:                            datePicker.attributeIfPresent(of: .useCurrentDate),
            countDownDuration:                         datePicker.attributeIfPresent(of: .countDownDuration),
            minimumDate:                               datePickerDateContainer?.withAttributeElement(.key, CodingKeys.minimumDate.stringValue),
            maximumDate:                               datePickerDateContainer?.withAttributeElement(.key, CodingKeys.maximumDate.stringValue),
            horizontalCompressionResistancePriority:   view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority:     view.verticalCompressionResistancePriority,
            horizontalHuggingPriority:                 view.horizontalHuggingPriority,
            verticalHuggingPriority:                   view.verticalHuggingPriority,
            accessibility:                             view.accessibility,
            tag:                                       view.tag,
            autoresizesSubviews:                       view.autoresizesSubviews,
            clearsContextBeforeDrawing:                view.clearsContextBeforeDrawing,
            multipleTouchEnabled:                      view.multipleTouchEnabled,
            semanticContentAttribute:                  view.semanticContentAttribute,
            preservesSuperviewLayoutMargins:           view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth:          view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea:           view.insetsLayoutMarginsFromSafeArea,
            directionalLayoutMargins:                  view.directionalLayoutMargins,
            layoutMargins:                             view.layoutMargins,
            toolTip:                                   control.toolTip,
            showsMenuAsPrimaryAction:                  control.showsMenuAsPrimaryAction,
            locale:                                    datePicker.elementIfPresent(of: .locale),
            minuteInterval:                            try datePicker.attribute(of: .minuteInterval),
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
