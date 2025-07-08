//
//  Slider.swift
//  IBDecodable
//
//  Created by phimage on 01/04/2018.
//

import SWXMLHash

protocol SliderProtocol {
    var minimumTrackTintColor: Color? { get }
    var maximumTrackTintColor: Color? { get }
    var thumbTintColor: Color? { get }
    var value: String? { get }
    var minValue: String? { get }
    var maxValue: String? { get }
    var minimumValueImage: String? { get }
    var maximumValueImage: String? { get }
    var continuous: Bool? { get }
}

public struct Slider: IBDecodable, ViewProtocol, ControlProtocol, SliderProtocol, IBIdentifiable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UISlider"
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
    public let misplaced: Bool?
    public let ambiguous: Bool?
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
    // MARK: UISlider
    public let minimumTrackTintColor: Color?
    public let maximumTrackTintColor: Color?
    public let thumbTintColor: Color?
    public let value: String?
    public let minValue: String?
    public let maxValue: String?
    public let minimumValueImage: String?
    public let maximumValueImage: String?
    public let continuous: Bool?

    enum ElementCodingKeys: CodingKey { case color }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> Slider {
        let view = try View.decode(xml)
        let control = try Control.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        let colorsContainer = xml.container(keys: ElementCodingKeys.self).nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        return Slider(
            id: view.id,
            key: view.key,
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
            safeArea: view.safeArea,
            keyboard: view.keyboard,
            constraints: view.constraints,
            horizontalHuggingPriority: view.horizontalHuggingPriority,
            verticalHuggingPriority: view.verticalHuggingPriority,
            horizontalCompressionResistancePriority: view.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority: view.verticalCompressionResistancePriority,
            connections: view.connections,
            verifyAmbiguity: view.verifyAmbiguity,
            misplaced: view.misplaced,
            ambiguous: view.ambiguous,
            variations: view.variations,
            subviews: view.subviews,
            contentHorizontalAlignment: control.contentHorizontalAlignment,
            contentVerticalAlignment: control.contentVerticalAlignment,
            showsMenuAsPrimaryAction: control.showsMenuAsPrimaryAction,
            isSelected: control.isSelected,
            isEnabled: control.isEnabled,
            isHighlighted: control.isHighlighted,
            toolTip: control.toolTip,
            minimumTrackTintColor: colorsContainer?.withAttributeElement(.key, CodingKeys.minimumTrackTintColor.stringValue),
            maximumTrackTintColor: colorsContainer?.withAttributeElement(.key, CodingKeys.maximumTrackTintColor.stringValue),
            thumbTintColor: colorsContainer?.withAttributeElement(.key, CodingKeys.thumbTintColor.stringValue),
            value: container.attributeIfPresent(of: .value),
            minValue: container.attributeIfPresent(of: .minValue),
            maxValue: container.attributeIfPresent(of: .maxValue),
            minimumValueImage: container.attributeIfPresent(of: .minimumValueImage),
            maximumValueImage: container.attributeIfPresent(of: .maximumValueImage),
            continuous: container.attributeIfPresent(of: .continuous),
        )
    }
}
