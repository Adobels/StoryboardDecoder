//
//  Label.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol LabelProtocol: ViewProtocol {
    // MARK: UILabel Attributes Instpector
    var text: String? { get }
    var attributedText: AttributedString? { get }
    var textColor: Color? { get }
    var fontDescription: FontDescription? { get }
    var adjustsFontForContentSizeCategory: Bool? { get }
    var textAlignment: String? { get }
    var numberOfLines: Int? { get }
    var isEnabled: Bool? { get }
    var highlighted: Bool? { get }
    var showsExpansionTextWhenTruncated: Bool? { get }
    var baselineAdjustment: String? { get }
    var lineBreakMode: String? { get }
    // missing support for lineBreakStrategy
    var adjustsFontSizeToFit: Bool? { get }
    var minimumScaleFactor: Float? { get }
    var minimumFontSize: Float? { get }
    var fixedFrame: Bool? { get }
    var adjustsLetterSpacingToFitWidth: Bool? { get } // in UIKit: allowsDefaultTighteningForTruncation { get }
    var sizingRule: String? { get }
    var highlightedColor: Color? { get }
    var shadowColor: Color? { get }
    var shadowOffset: Size? { get }
    // MARK: UILabel Size Inspector
    var preferredMaxLayoutWidth: Float? { get }
}

public struct Label: IBDecodable, LabelProtocol, IBIdentifiable {
    // MARK: UIView
    public let key: String?
    public let id: String
    public let elementClass: String = "UILabel"
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
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let constraints: [Constraint]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    public let subviews: [AnyView]?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    // MARK: UILabel
    public let text: String?
    public let attributedText: AttributedString?
    public let textColor: Color?
    public let fontDescription: FontDescription?
    public let adjustsFontForContentSizeCategory: Bool?
    public let textAlignment: String?
    public let numberOfLines: Int?
    public let isEnabled: Bool?
    public let highlighted: Bool?
    public let showsExpansionTextWhenTruncated: Bool?
    public let baselineAdjustment: String?
    public let lineBreakMode: String?
    // missing support for lineBreakStrategy
    public let adjustsFontSizeToFit: Bool?
    public let minimumScaleFactor: Float?
    public let minimumFontSize: Float?
    public let fixedFrame: Bool?
    public let adjustsLetterSpacingToFitWidth: Bool? // in UIKit: allowsDefaultTighteningForTruncation
    public let sizingRule: String?
    public let highlightedColor: Color?
    public let shadowColor: Color?
    public let shadowOffset: Size?
    public let preferredMaxLayoutWidth: Float?

    enum ExternalCodingKeys: CodingKey { case color, string, mutableString }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Label {
        let view = try View.decode(xml)
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .attributedText: return "attributedString"
                case .isEnabled: return "enabled"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        let externalContainer = xml.container(keys: ExternalCodingKeys.self)
        let colors = externalContainer
            .nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let stringsContainer = externalContainer
            .nestedContainerIfPresent(of: .string, keys: KeyCodingKeys.self)
        let mutableStringsContainer = externalContainer
            .nestedContainerIfPresent(of: .mutableString, keys: KeyCodingKeys.self)
        _ = consume externalContainer
        var text: String? = container.attributeIfPresent(of: .text)
        if text == nil {
            let multiLineText: StringElement? = stringsContainer?.withAttributeElement(.key, CodingKeys.text.stringValue)
            text = multiLineText?.elementValue
        }
        _ = consume stringsContainer
        if text == nil {
            let multiLineText: StringElement? = mutableStringsContainer?.withAttributeElement(.key, CodingKeys.text.stringValue)
            text = multiLineText?.elementValue
        }
        _ = consume mutableStringsContainer
        return Label(
            key:                                        view.key,
            id:                                         view.id,
            customClass:                                view.customClass,
            customModule:                               view.customModule,
            customModuleProvider:                       view.customModuleProvider,
            restorationIdentifier:                      view.restorationIdentifier,
            userDefinedRuntimeAttributes:               view.userDefinedRuntimeAttributes,
            userLabel:                                  view.userLabel,
            colorLabel:                                 view.colorLabel,
            accessibility:                              view.accessibility,
            contentMode:                                view.contentMode,
            semanticContentAttribute:                   view.semanticContentAttribute,
            tag:                                        view.tag,
            userInteractionEnabled:                     view.userInteractionEnabled,
            multipleTouchEnabled:                       view.multipleTouchEnabled,
            alpha:                                      view.alpha,
            backgroundColor:                            view.backgroundColor,
            tintColor:                                  view.tintColor,
            opaque:                                     view.opaque,
            hidden:                                     view.hidden,
            clearsContextBeforeDrawing:                 view.clearsContextBeforeDrawing,
            clipsSubviews:                              view.clipsSubviews,
            autoresizesSubviews:                        view.autoresizesSubviews,
            rect:                                       view.rect,
            translatesAutoresizingMaskIntoConstraints:  view.translatesAutoresizingMaskIntoConstraints,
            autoresizingMask:                           view.autoresizingMask,
            directionalLayoutMargins:                   view.directionalLayoutMargins,
            layoutMargins:                              view.layoutMargins,
            preservesSuperviewLayoutMargins:            view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth:           view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea:            view.insetsLayoutMarginsFromSafeArea,
            horizontalHuggingPriority:                  view.horizontalHuggingPriority,
            verticalHuggingPriority:                    view.verticalHuggingPriority,
            horizontalCompressionResistancePriority:    view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority:      view.verticalCompressionResistancePriority,
            constraints:                                view.constraints,
            connections:                                view.connections,
            variations:                                 view.variations,
            subviews:                                   nil,
            verifyAmbiguity:                            view.verifyAmbiguity,
            isMisplaced:                                view.isMisplaced,
            isAmbiguous:                                view.isAmbiguous,
            text:                                       text,
            attributedText:                             container.elementIfPresent(of: .attributedText),
            textColor:                                  colors?.withAttributeElement(.key, CodingKeys.textColor.stringValue),
            fontDescription:                            container.elementIfPresent(of: .fontDescription),
            adjustsFontForContentSizeCategory:          container.attributeIfPresent(of: .adjustsFontForContentSizeCategory),
            textAlignment:                              container.attributeIfPresent(of: .textAlignment),
            numberOfLines:                              container.attributeIfPresent(of: .numberOfLines),
            isEnabled:                                  container.attributeIfPresent(of: .isEnabled),
            highlighted:                                container.attributeIfPresent(of: .highlighted),
            showsExpansionTextWhenTruncated:            container.attributeIfPresent(of: .showsExpansionTextWhenTruncated),
            baselineAdjustment:                         container.attributeIfPresent(of: .baselineAdjustment),
            lineBreakMode:                              container.attributeIfPresent(of: .lineBreakMode),
            adjustsFontSizeToFit:                       container.attributeIfPresent(of: .adjustsFontSizeToFit),
            minimumScaleFactor:                         container.attributeIfPresent(of: .minimumScaleFactor),
            minimumFontSize:                            container.attributeIfPresent(of: .minimumFontSize),
            fixedFrame:                                 container.attributeIfPresent(of: .fixedFrame),
            adjustsLetterSpacingToFitWidth:             container.attributeIfPresent(of: .adjustsLetterSpacingToFitWidth),
            sizingRule:                                 container.attributeIfPresent(of: .sizingRule),
            highlightedColor:                           colors?.withAttributeElement(.key, CodingKeys.highlightedColor.stringValue),
            shadowColor:                                colors?.withAttributeElement(.key, CodingKeys.shadowColor.stringValue),
            shadowOffset:                               container.elementIfPresent(of: .shadowOffset),
            preferredMaxLayoutWidth:                    container.attributeIfPresent(of: .preferredMaxLayoutWidth),
        )
    }

}

// MARK: - FontDescription

public enum FontDescription: IBDecodable {
    public typealias SystemFont = (key: String?, type: String, weight: String?, pointSize: Float)
    public typealias CustomFont = (key: String?, name: String, family: String, pointSize: Float)
    public typealias TextStyle = (key: String?, style: String)
    case system(SystemFont)
    case custom(CustomFont)
    case textStyle(TextStyle)

    public var pointSize: Float? {
        switch self {
        case .system(let systemFont):
            return systemFont.pointSize
        case .custom(let customFont):
            return customFont.pointSize
        case .textStyle:
            return nil
        }
    }

    enum CodingKeys: CodingKey {
        case key, type, weight, pointSize, name, family, style
    }

    public func encode(to encoder: Encoder) throws { fatalError() }

    static func decode(_ xml: XMLIndexerType) throws -> FontDescription {
        let container = xml.container(keys: CodingKeys.self)
        let key: String? = container.attributeIfPresent(of: .key)
        if let type: String = container.attributeIfPresent(of: .type) {
            return try .system((key: key,
                                type: type,
                                weight: container.attributeIfPresent(of: .weight),
                                pointSize: container.attribute(of: .pointSize)
                               ))
        } else if let name: String = container.attributeIfPresent(of: .name),
                  let family: String = container.attributeIfPresent(of: .family) {
            return try .custom((key: key,
                                name: name,
                                family: family,
                                pointSize: container.attribute(of: .pointSize)
                               ))
        } else if let style: String = container.attributeIfPresent(of: .style) {
            return .textStyle((key: key,
                               style: style
                              ))
        } else {
            throw IBError.unsupportedFontDescription
        }
    }
}

extension FontDescription: AttributeProtocol {

    public var key: String? {
        switch self {
        case .system(let systemFont):
            return systemFont.key
        case .custom(let customFont):
            return customFont.key
        case .textStyle(let textStyle):
            return textStyle.key
        }
    }
}

