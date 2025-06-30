//
//  TextField.swift
//  IBLinterCore
//
//  Created by Steven Deutsch on 3/11/18.
//

import SWXMLHash

public struct TextField: IBDecodable, ControlProtocol, IBIdentifiable {
    public let id: String
    public let elementClass: String = "UITextField"

    public let key: String?
    public let autoresizingMask: AutoresizingMask?
    public let borderStyle: String?
    public let clipsSubviews: Bool?
    public let constraints: [Constraint]?
    public let contentMode: String?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let fixedFrame: Bool?
    public let fontDescription: FontDescription?
    public let minimumFontSize: Float?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let opaque: Bool?
    public let rect: Rect?
    public let subviews: [AnyView]?
    public let text: String?
    public let textAlignment: String?
    public let placeholder: String?
    public let textColor: Color?
    public let translatesAutoresizingMaskIntoConstraints: Bool?
    public let userInteractionEnabled: Bool?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    public let backgroundColor: Color?
    public let tintColor: Color?
    public let isHidden: Bool?
    public let alpha: Float?

    public let isEnabled: Bool?
    public let isHighlighted: Bool?
    public let isSelected: Bool?
    public let contentHorizontalAlignment: String?
    public let contentVerticalAlignment: String?
    
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?

    public let accessibility: Accessibility?
    public let adjustsFontForContentSizeCategory: Bool?
    public let clearButtonMode: ClearButtonMode?
    public let clearsOnBeginEditing: Bool?
    public let adjustsFontSizeToFit: Bool?
    public let sizingRule: LetterformAwareSizingRule?
    public let textInputTraits: TextInputTraits?
    public let tag: Int?
    public let autoresizesSubviews: Bool?
    public let clearsContextBeforeDrawing: Bool?
    public let multipleTouchEnabled: Bool?
    public let semanticContentAttribute: String?

    enum ConstraintsCodingKeys: CodingKey { case constraint }
    enum VariationCodingKey: CodingKey { case variation }
    enum ExternalCodingKeys: CodingKey { case color, string, textInputTraits }
    enum ColorsCodingKeys: CodingKey { case key }
    enum StringsCodingKeys: CodingKey { case key }
    enum TextInputTraitsKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> TextField {
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .isMisplaced: return "misplaced"
                case .isAmbiguous: return "ambiguous"
                case .isHidden: return "hidden"
                case .isEnabled: return "enabled"
                case .isHighlighted: return "highlighted"
                case .isSelected: return "selected"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        let constraintsContainer = container.nestedContainerIfPresent(of: .constraints, keys: ConstraintsCodingKeys.self)
        let variationContainer = xml.container(keys: VariationCodingKey.self)
        let externalContainer = xml.container(keys: ExternalCodingKeys.self)
        let colorsContainer = externalContainer
            .nestedContainerIfPresent(of: .color, keys: ColorsCodingKeys.self)
        let stringsContainer = externalContainer
            .nestedContainerIfPresent(of: .string, keys: StringsCodingKeys.self)
        let textInputTraits = externalContainer.nestedContainerIfPresent(of: .textInputTraits, keys: TextInputTraitsKeys.self)
        var text: String? = container.attributeIfPresent(of: .text)
        if text == nil {
            let multiLineText: StringElement? = stringsContainer?.withAttributeElement(.key, CodingKeys.text.stringValue)
            text = multiLineText?.elementValue
        }
        
        var placeholder: String? = container.attributeIfPresent(of: .placeholder)
        if placeholder == nil {
            let multiLineText: StringElement? = stringsContainer?.withAttributeElement(.key, CodingKeys.placeholder.stringValue)
            placeholder = multiLineText?.elementValue
        }
        
        return TextField(
            id:                                        try container.attribute(of: .id),
            key:                                       container.attributeIfPresent(of: .key),
            autoresizingMask:                          container.elementIfPresent(of: .autoresizingMask),
            borderStyle:                               container.attributeIfPresent(of: .borderStyle),
            clipsSubviews:                             container.attributeIfPresent(of: .clipsSubviews),
            constraints:                               constraintsContainer?.elementsIfPresent(of: .constraint),
            contentMode:                               container.attributeIfPresent(of: .contentMode),
            customClass:                               container.attributeIfPresent(of: .customClass),
            customModule:                              container.attributeIfPresent(of: .customModule),
            customModuleProvider:                      container.attributeIfPresent(of: .customModuleProvider),
            userLabel:                                 container.attributeIfPresent(of: .userLabel),
            colorLabel:                                container.attributeIfPresent(of: .colorLabel),
            fixedFrame:                                container.attributeIfPresent(of: .fixedFrame),
            fontDescription:                           container.elementIfPresent(of: .fontDescription),
            minimumFontSize:                           container.attributeIfPresent(of: .minimumFontSize),
            isMisplaced:                               container.attributeIfPresent(of: .isMisplaced),
            isAmbiguous:                               container.attributeIfPresent(of: .isAmbiguous),
            verifyAmbiguity:                           container.attributeIfPresent(of: .verifyAmbiguity),
            opaque:                                    container.attributeIfPresent(of: .opaque),
            rect:                                      container.elementIfPresent(of: .rect),
            subviews:                                  container.childrenIfPresent(of: .subviews),
            text:                                      text,
            textAlignment:                             container.attributeIfPresent(of: .textAlignment),
            placeholder:                               placeholder,
            textColor:                                 colorsContainer?.withAttributeElement(.key, CodingKeys.textColor.stringValue),
            translatesAutoresizingMaskIntoConstraints: container.attributeIfPresent(of: .translatesAutoresizingMaskIntoConstraints),
            userInteractionEnabled:                    container.attributeIfPresent(of: .userInteractionEnabled),
            userDefinedRuntimeAttributes:              container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            connections:                               container.childrenIfPresent(of: .connections),
            variations:                                variationContainer.elementsIfPresent(of: .variation),
            backgroundColor:                           colorsContainer?.withAttributeElement(.key, CodingKeys.backgroundColor.stringValue),
            tintColor:                                 colorsContainer?.withAttributeElement(.key, CodingKeys.tintColor.stringValue),
            isHidden:                                  container.attributeIfPresent(of: .isHidden),
            alpha:                                     container.attributeIfPresent(of: .alpha),
            isEnabled:                                 container.attributeIfPresent(of: .isEnabled),
            isHighlighted:                             container.attributeIfPresent(of: .isHighlighted),
            isSelected:                                container.attributeIfPresent(of: .isSelected),
            contentHorizontalAlignment:                container.attributeIfPresent(of: .contentHorizontalAlignment),
            contentVerticalAlignment:                  container.attributeIfPresent(of: .contentVerticalAlignment),
            horizontalCompressionResistancePriority:   container.attributeIfPresent(of: .horizontalCompressionResistancePriority),
            verticalCompressionResistancePriority:     container.attributeIfPresent(of: .verticalCompressionResistancePriority),
            horizontalHuggingPriority:                 container.attributeIfPresent(of: .horizontalHuggingPriority),
            verticalHuggingPriority:                   container.attributeIfPresent(of: .verticalHuggingPriority),
            accessibility:                             container.elementIfPresent(of: .accessibility),
            adjustsFontForContentSizeCategory:         container.attributeIfPresent(of: .adjustsFontForContentSizeCategory),
            clearButtonMode:                           container.attributeIfPresent(of: .clearButtonMode),
            clearsOnBeginEditing:                      container.attributeIfPresent(of: .clearsOnBeginEditing),
            adjustsFontSizeToFit:                      container.attributeIfPresent(of: .adjustsFontSizeToFit),
            sizingRule:                                container.attributeIfPresent(of: .sizingRule),
            textInputTraits:                           textInputTraits?.withAttributeElement(.key, CodingKeys.textInputTraits.stringValue),
            tag:                                       container.attributeIfPresent(of: .tag),
            autoresizesSubviews:                       container.attributeIfPresent(of: .autoresizesSubviews),
            clearsContextBeforeDrawing:                container.attributeIfPresent(of: .clearsContextBeforeDrawing),
            multipleTouchEnabled:                      container.attributeIfPresent(of: .multipleTouchEnabled),
            semanticContentAttribute:                  container.attributeIfPresent(of: .semanticContentAttribute),
        )
    }

    public enum ClearButtonMode: XMLAttributeDecodable, KeyDecodable, Equatable {
        case never
        case whileEditing
        case unlessEditing
        case always
        case unknownValue(String)

        static func decode(_ attribute: XMLAttribute) throws -> TextField.ClearButtonMode {
            switch attribute.text {
            case "never": .never
            case "whileEditing": .whileEditing
            case "unlessEditing": .unlessEditing
            case "always": .always
            default: .unknownValue(attribute.text)
            }
        }
    }

    public enum LetterformAwareSizingRule: XMLAttributeDecodable, KeyDecodable, Equatable {
        case oversize
        case typographic
        case unknownValue(String)

        static func decode(_ attribute: XMLAttribute) throws -> TextField.LetterformAwareSizingRule {
            switch attribute.text {
            case "oversize": .oversize
            case "typographic": .typographic
            default: .unknownValue(attribute.text)
            }
        }
    }

    // MARK: - TextInputTraits

    public struct TextInputTraits: IBDecodable {
        public var autocapitalizationType: AutocapitalizationType?
        public var autocorrectionType: Bool?
        public var spellCheckingType: Bool?
        public var keyboardType: KeyboardType?
        public var keyboardAppearance: KeyboardAppearance?
        public var returnKeyType: ReturnKeyType?
        public var smartDashesType: Bool?
        public var smartInsertDeleteType: Bool?
        public var smartQuotesType: Bool?
        public var textContentType: TextContentType?
        public var enablesReturnKeyAutomatically: Bool?
        public var secureTextEntry: Bool?

        enum CodingKeys: CodingKey {
            case key
            case autocapitalizationType
            case autocorrectionType
            case spellCheckingType
            case keyboardType
            case keyboardAppearance
            case returnKeyType
            case smartDashesType
            case smartInsertDeleteType
            case smartQuotesType
            case textContentType
            case enablesReturnKeyAutomatically
            case secureTextEntry
        }

        public func encode(to encoder: Encoder) throws { fatalError() }

        static func decode(_ xml: XMLIndexerType) throws -> Self {
            let container = xml.container(keys: CodingKeys.self)
            let key = try? container.attribute(of: .key) as String
            guard key == "textInputTraits" else { throw IBError.unsupportedTextInputTraits }
            return .init(
                autocapitalizationType: container.attributeIfPresent(of: .autocapitalizationType),
                autocorrectionType: container.attributeIfPresent(of: .autocorrectionType),
                spellCheckingType: container.attributeIfPresent(of: .spellCheckingType),
                keyboardType: container.attributeIfPresent(of: .keyboardType),
                keyboardAppearance: container.attributeIfPresent(of: .keyboardAppearance),
                returnKeyType: container.attributeIfPresent(of: .returnKeyType),
                smartDashesType: container.attributeIfPresent(of: .smartDashesType),
                smartInsertDeleteType: container.attributeIfPresent(of: .smartInsertDeleteType),
                smartQuotesType: container.attributeIfPresent(of: .smartQuotesType),
                textContentType: container.attributeIfPresent(of: .textContentType),
                enablesReturnKeyAutomatically: container.attributeIfPresent(of: .enablesReturnKeyAutomatically),
                secureTextEntry: container.attributeIfPresent(of: .secureTextEntry),
            )
        }

        public enum AutocapitalizationType: XMLAttributeDecodable, KeyDecodable, Equatable {
            case words
            case sentences
            case allCharacters
            case unknownValue(String)

            static func decode(_ attribute: XMLAttribute) throws -> Self {
                switch attribute.text {
                case "words": .words
                case "sentences": .sentences
                case "allCharacters": .allCharacters
                default: .unknownValue(attribute.text)
                }
            }
        }
        public enum KeyboardType: XMLAttributeDecodable, KeyDecodable, Equatable {
            case alphabet
            case numbersAndPunctuation
            case url
            case numberPad
            case phonePad
            case namePhonePad
            case emailAddress
            case decimalPad
            case twitter
            case webSearch
            case asciiCapableNumberPad
            case unknownValue(String)

            static func decode(_ attribute: XMLAttribute) throws -> TextField.TextInputTraits.KeyboardType {
                switch attribute.text {
                case "alphabet": .alphabet
                case "numbersAndPunctuation": .numbersAndPunctuation
                case "URL": .url
                case "numberPad": .numberPad
                case "phonePad": .phonePad
                case "namePhonePad": .namePhonePad
                case "emailAddress": .emailAddress
                case "decimalPad": .decimalPad
                case "twitter": .twitter
                case "webSearch": .webSearch
                case "ASCIICapableNumberPad": .asciiCapableNumberPad
                default: .unknownValue(attribute.text)
                }
            }
        }
        public enum KeyboardAppearance: XMLAttributeDecodable, KeyDecodable, Equatable {
            case alert
            case light
            case unknown(String)
            static func decode(_ attribute: XMLAttribute) throws -> Self {
                let text = attribute.text
                return switch text {
                case "alert": .alert
                case "light": .light
                default: unknown(text)
                }
            }
        }
        public enum ReturnKeyType: XMLAttributeDecodable, KeyDecodable, Equatable {
            case go
            case google
            case join
            case next
            case route
            case search
            case send
            case yahoo
            case done
            case emergencyCall
            case `continue`
            case unknown(String)

            static func decode(_ attribute: XMLAttribute) throws -> TextField.TextInputTraits.ReturnKeyType {
                let text = attribute.text
                return switch text {
                case "go": .go
                case "google": .google
                case "join": .join
                case "next": .next
                case "route": .route
                case "search": .search
                case "send": .send
                case "yahoo": .yahoo
                case "done": .done
                case "emergencyCall": .emergencyCall
                case "continue": .continue
                default: .unknown(text)
                }
            }
        }
        public enum TextContentType: XMLAttributeDecodable, KeyDecodable, Equatable {
            case name
            case honorifixPrefix
            case givenName
            case additionalName
            case familyName
            case honorifixSuffix
            case nickname
            case organizationTitle
            case organization
            case location
            case streetAddress
            case addressLine1
            case addressLine2
            case addressLevel2
            case addressLevel1
            case addressLevel1And2
            case addressLevel3
            case countryName
            case postalCode
            case tel
            case email
            case url
            case username
            case password
            case newPassword
            case oneTimeCode
            case bday
            case bdayDay
            case bdayMonth
            case bdayYear
            case shipmentTrackingNumber
            case flightNumber
            case dateTime
            case ccNumber
            case ccName
            case ccGivenName
            case ccAdditionalName
            case ccFamilyName
            case ccType
            case ccExp
            case ccExpMonth
            case ccExpYear
            case ccCsc
            case unknown(String)

            static func decode(_ attribute: XMLAttribute) throws -> Self {
                let text = attribute.text
                return switch text {
                case "name": .name
                case "honorifix-prefix": .honorifixPrefix
                case "given-name": .givenName
                case "additional-name": .additionalName
                case "family-name": .familyName
                case "honorifix-suffix": .honorifixSuffix
                case "nickname": .nickname
                case "organization-title": .organizationTitle
                case "organization": .organization
                case "location": .location
                case "street-address": .streetAddress
                case "address-line1": .addressLine1
                case "address-line2": .addressLine2
                case "address-level2": .addressLevel2
                case "address-level1": .addressLevel1
                case "address-level1+2": .addressLevel1And2
                case "address-level3": .addressLevel3
                case "country-name": .countryName
                case "postal-code": .postalCode
                case "tel": .tel
                case "email": .email
                case "url": .url
                case "username": .username
                case "password": .password
                case "new-password": .newPassword
                case "one-time-code": .oneTimeCode
                case "bday": .bday
                case "bday-day": .bdayDay
                case "bday-month": .bdayMonth
                case "bday-year": .bdayYear
                case "shipment-tracking-number": .shipmentTrackingNumber
                case "flight-number": .flightNumber
                case "date-time": .dateTime
                case "cc-number": .ccNumber
                case "cc-name": .ccName
                case "cc-given-name": .ccGivenName
                case "cc-additional-name": .ccAdditionalName
                case "cc-family-name": .ccFamilyName
                case "cc-type": .ccType
                case "cc-exp": .ccExp
                case "cc-exp-month": .ccExpMonth
                case "cc-exp-year": .ccExpYear
                case "cc-csc": .ccCsc
                default: .unknown(text)
                }
            }
        }
    }
}
