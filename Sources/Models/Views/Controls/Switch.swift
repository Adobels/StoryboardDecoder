//
//  Switch.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol SwitchProtocol: ViewProtocol, ControlProtocol {
    var title: String? { get }
    var preferredStyle: PreferredStyle? { get }
    var on: Bool { get }
    var onTintColor: Color? { get }
    var thumbTintColor: Color? { get }
}

public struct Switch: IBDecodable, SwitchProtocol, IBIdentifiable {

    // MARK: UIView
    public let key: String?
    public let id: String
    public let elementClass: String = "UISwitch"
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
    // MARK: UIControl
    public let contentHorizontalAlignment: String?
    public let contentVerticalAlignment: String?
    public let showsMenuAsPrimaryAction: Bool?
    public let isSelected: Bool?
    public let isEnabled: Bool?
    public let isHighlighted: Bool?
    public let toolTip: String?
    // MARK: UISwitch
    public let on: Bool
    public let onTintColor: Color?
    public let thumbTintColor: Color?
    public let title: String?
    public let preferredStyle: PreferredStyle?

    enum SwitchCodingKeys: CodingKey { case color }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Switch {
        let view = try View.decode(xml)
        let control = try Control.decode(xml)
        let switchView = xml.container(keys: CodingKeys.self)
        let switchViewColorsContainer = xml.container(keys: SwitchCodingKeys.self).nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        return Switch(
            key: view.key,
            id: view.id,
            customClass: view.customClass,
            customModule: view.customModule,
            customModuleProvider: view.customModuleProvider,
            restorationIdentifier: view.restorationIdentifier,
            userDefinedRuntimeAttributes: view.userDefinedRuntimeAttributes,
            userLabel: view.userLabel,
            colorLabel: view.colorLabel,
            accessibility: view.accessibility,
            contentMode: view.contentMode,
            semanticContentAttribute: view.semanticContentAttribute,
            tag: view.tag,
            userInteractionEnabled: view.userInteractionEnabled,
            multipleTouchEnabled: view.multipleTouchEnabled,
            alpha: view.alpha,
            backgroundColor: view.backgroundColor,
            tintColor: view.tintColor,
            opaque: view.opaque,
            hidden: view.hidden,
            clearsContextBeforeDrawing: view.clearsContextBeforeDrawing,
            clipsSubviews: view.clipsSubviews,
            autoresizesSubviews: view.autoresizesSubviews,
            rect: view.rect,
            translatesAutoresizingMaskIntoConstraints: view.translatesAutoresizingMaskIntoConstraints,
            autoresizingMask: view.autoresizingMask,
            directionalLayoutMargins: view.directionalLayoutMargins,
            layoutMargins: view.layoutMargins,
            preservesSuperviewLayoutMargins: view.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth: view.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea: view.insetsLayoutMarginsFromSafeArea,
            horizontalHuggingPriority: view.horizontalHuggingPriority,
            verticalHuggingPriority: view.verticalHuggingPriority,
            horizontalCompressionResistancePriority: view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority: view.verticalCompressionResistancePriority,
            constraints: view.constraints,
            connections: view.connections,
            variations: view.variations,
            subviews: view.subviews,
            verifyAmbiguity: view.verifyAmbiguity,
            isMisplaced: view.isMisplaced,
            isAmbiguous: view.isAmbiguous,
            contentHorizontalAlignment: control.contentHorizontalAlignment,
            contentVerticalAlignment: control.contentVerticalAlignment,
            showsMenuAsPrimaryAction: control.showsMenuAsPrimaryAction,
            isSelected: control.isSelected,
            isEnabled: control.isEnabled,
            isHighlighted: control.isHighlighted,
            toolTip: control.toolTip,
            // UISwitch
            on: switchView.attributeIfPresent(of: .on) ?? false,
            onTintColor: switchViewColorsContainer?.withAttributeElement(.key, CodingKeys.onTintColor.stringValue),
            thumbTintColor: switchViewColorsContainer?.withAttributeElement(.key, CodingKeys.thumbTintColor.stringValue),
            title: switchView.attributeIfPresent(of: .title),
            preferredStyle: switchView.attributeIfPresent(of: .preferredStyle),
        )
    }
}

public enum PreferredStyle: XMLAttributeDecodable, KeyDecodable {
    case automatic
    case checkbox
    case sliding

    static func decode(_ attribute: XMLAttribute) throws -> Self {
        switch attribute.text {
        case "checkbox": return .checkbox
        case "sliding": return .sliding
        default: return .automatic
        }
    }
}
