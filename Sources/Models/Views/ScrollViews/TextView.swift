//
//  TextView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

public struct TextView: IBDecodable, ScrollViewProtocol, IBIdentifiable {
    public let id: String
    public let elementClass: String = "UITextView"

    public let key: String?
    public let autoresizingMask: AutoresizingMask?
    public let bounces: Bool?
    public let bouncesZoom: Bool?
    public let clipsSubviews: Bool?
    public let constraints: [Constraint]?
    public let contentMode: String?
    public let customClass: String?
    public let customModule: String?
    public let customModuleProvider: String?
    public let restorationIdentifier: String?
    public let userLabel: String?
    public let colorLabel: String?
    public let fontDescription: FontDescription?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let opaque: Bool?
    public let rect: Rect?
    public let scrollEnabled: Bool?
    public let showsHorizontalScrollIndicator: Bool?
    public let showsVerticalScrollIndicator: Bool?
    public let subviews: [AnyView]?
    public let text: String?
    public let textAlignment: String?
    public let textColor: Color?
    public let translatesAutoresizingMaskIntoConstraints: Bool?
    public let userInteractionEnabled: Bool?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    public let editable: Bool?
    public let backgroundColor: Color?
    public let tintColor: Color?
    public let hidden: Bool?
    public let alpha: Float?

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
    public var indicatorStyle: IndicatorStyle?
    // MARK: ScrollView Protocol
    public let pagingEnabled: Bool?
    public let directionalLockEnabled: Bool?
    public let alwaysBounceHorizontal: Bool?
    public let alwaysBounceVertical: Bool?
    public let minimumZoomScale: Float?
    public let maximumZoomScale: Float?
    public let delaysContentTouches: Bool?
    public let canCancelContentTouches: Bool?
    public let keyboardDismissMode: String?
    public let scrollIndicatorInsets: Inset?
    public let contentInsetAdjustmentBehavior: String?
    public let contentLayoutGuide: LayoutGuide?
    public let frameLayoutGuide: LayoutGuide?

    enum ElementKey: CodingKey {
        case color
        case string
        case constraint
        case directionalEdgeInsets
        case edgeInsets
        case inset
        case variation
        case viewLayoutGuide
    }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> TextView {
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .isMisplaced: return "misplaced"
                case .isAmbiguous: return "ambiguous"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        let elementContainer = xml.container(keys: ElementKey.self)
        let constraintsContainer = container.nestedContainerIfPresent(of: .constraints, keys: ElementKey.self)
        let colorsContainer = elementContainer.nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let stringsContainer = elementContainer.nestedContainerIfPresent(of: .string, keys: KeyCodingKeys.self)
        let viewLayoutGuidesContainer = elementContainer.nestedContainerIfPresent(of: .viewLayoutGuide, keys: KeyCodingKeys.self)
        let directionalEdgeInsetsContainer = elementContainer.nestedContainerIfPresent(of: .directionalEdgeInsets, keys: KeyCodingKeys.self)
        let edgeInsetsContainer = elementContainer.nestedContainerIfPresent(of: .edgeInsets, keys: KeyCodingKeys.self)
        let insetContainer = elementContainer.nestedContainerIfPresent(of: .inset, keys: KeyCodingKeys.self)
        var text: String? = container.attributeIfPresent(of: .text)
        if text == nil {
            let multiLineText: StringElement? = stringsContainer?.withAttributeElement(.key, CodingKeys.text.stringValue)
            text = multiLineText?.elementValue
        }
        
        return TextView(
            id:                                        try container.attribute(of: .id),
            key:                                       container.attributeIfPresent(of: .key),
            autoresizingMask:                          container.elementIfPresent(of: .autoresizingMask),
            bounces:                                   container.attributeIfPresent(of: .bounces),
            bouncesZoom:                               container.attributeIfPresent(of: .bouncesZoom),
            clipsSubviews:                             container.attributeIfPresent(of: .clipsSubviews),
            constraints:                               constraintsContainer?.elementsIfPresent(of: .constraint),
            contentMode:                               container.attributeIfPresent(of: .contentMode),
            customClass:                               container.attributeIfPresent(of: .customClass),
            customModule:                              container.attributeIfPresent(of: .customModule),
            customModuleProvider:                      container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier:                     container.attributeIfPresent(of: .restorationIdentifier),
            userLabel:                                 container.attributeIfPresent(of: .userLabel),
            colorLabel:                                container.attributeIfPresent(of: .colorLabel),
            fontDescription:                           container.elementIfPresent(of: .fontDescription),
            isMisplaced:                               container.attributeIfPresent(of: .isMisplaced),
            isAmbiguous:                               container.attributeIfPresent(of: .isAmbiguous),
            verifyAmbiguity:                           container.attributeIfPresent(of: .verifyAmbiguity),
            opaque:                                    container.attributeIfPresent(of: .opaque),
            rect:                                      container.elementIfPresent(of: .rect),
            scrollEnabled:                             container.attributeIfPresent(of: .scrollEnabled),
            showsHorizontalScrollIndicator:            container.attributeIfPresent(of: .showsHorizontalScrollIndicator),
            showsVerticalScrollIndicator:              container.attributeIfPresent(of: .showsVerticalScrollIndicator),
            subviews:                                  container.childrenIfPresent(of: .subviews),
            text:                                      text,
            textAlignment:                             container.attributeIfPresent(of: .textAlignment),
            textColor:                                 colorsContainer?.withAttributeElement(.key, CodingKeys.textColor.stringValue),
            translatesAutoresizingMaskIntoConstraints: container.attributeIfPresent(of: .translatesAutoresizingMaskIntoConstraints),
            userInteractionEnabled:                    container.attributeIfPresent(of: .userInteractionEnabled),
            userDefinedRuntimeAttributes:              container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            connections:                               container.childrenIfPresent(of: .connections),
            variations:                                elementContainer.elementsIfPresent(of: .variation),
            editable:                                  container.attributeIfPresent(of: .editable),
            backgroundColor:                           colorsContainer?.withAttributeElement(.key, TextView.CodingKeys.backgroundColor.stringValue),
            tintColor:                                 colorsContainer?.withAttributeElement(.key, TextView.CodingKeys.tintColor.stringValue),
            hidden:                                    container.attributeIfPresent(of: .hidden),
            alpha:                                     container.attributeIfPresent(of: .alpha),
            horizontalCompressionResistancePriority:   container.attributeIfPresent(of: .horizontalCompressionResistancePriority),
            verticalCompressionResistancePriority:     container.attributeIfPresent(of: .verticalCompressionResistancePriority),
            horizontalHuggingPriority:                 container.attributeIfPresent(of: .horizontalHuggingPriority),
            verticalHuggingPriority:                   container.attributeIfPresent(of: .verticalHuggingPriority),
            accessibility:                             container.elementIfPresent(of: .accessibility),
            tag:                                       container.attributeIfPresent(of: .tag),
            autoresizesSubviews:                       container.attributeIfPresent(of: .autoresizesSubviews),
            clearsContextBeforeDrawing:                container.attributeIfPresent(of: .clearsContextBeforeDrawing),
            multipleTouchEnabled:                      container.attributeIfPresent(of: .multipleTouchEnabled),
            semanticContentAttribute:                  container.attributeIfPresent(of: .semanticContentAttribute),
            preservesSuperviewLayoutMargins:           container.attributeIfPresent(of: .preservesSuperviewLayoutMargins),
            layoutMarginsFollowReadableWidth:          container.attributeIfPresent(of: .layoutMarginsFollowReadableWidth),
            insetsLayoutMarginsFromSafeArea:           container.attributeIfPresent(of: .insetsLayoutMarginsFromSafeArea),
            directionalLayoutMargins:                  container.elementIfPresent(of: .insetsLayoutMarginsFromSafeArea),
            layoutMargins:                                 container.elementIfPresent(of: .layoutMargins),
            pagingEnabled:                             container.attributeIfPresent(of: .pagingEnabled),
            directionalLockEnabled:                    container.attributeIfPresent(of: .directionalLockEnabled),
            alwaysBounceHorizontal:                    container.attributeIfPresent(of: .alwaysBounceHorizontal),
            alwaysBounceVertical:                      container.attributeIfPresent(of: .alwaysBounceVertical),
            minimumZoomScale:                          container.attributeIfPresent(of: .minimumZoomScale),
            maximumZoomScale:                          container.attributeIfPresent(of: .maximumZoomScale),
            delaysContentTouches:                      container.attributeIfPresent(of: .delaysContentTouches),
            canCancelContentTouches:                   container.attributeIfPresent(of: .canCancelContentTouches),
            keyboardDismissMode:                       container.attributeIfPresent(of: .keyboardDismissMode),
            scrollIndicatorInsets:                     insetContainer?.withAttributeElement(.key, CodingKeys.scrollIndicatorInsets.stringValue),
            contentInsetAdjustmentBehavior:            container.attributeIfPresent(of: .contentInsetAdjustmentBehavior),
            contentLayoutGuide:                        viewLayoutGuidesContainer?.withAttributeElement(.key, CodingKeys.contentLayoutGuide.stringValue),
            frameLayoutGuide:                          viewLayoutGuidesContainer?.withAttributeElement(.key, CodingKeys.frameLayoutGuide.stringValue),
        )
    }
}
