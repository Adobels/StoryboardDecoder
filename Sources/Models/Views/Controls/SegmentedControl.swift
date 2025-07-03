//
//  SegmentedControl.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

protocol SegmentedControlProtocol: ViewProtocol, ControlProtocol {
    var segmentControlStyle: String? { get }
    var segments: [SegmentedControl.Segment] { get }
    var selectedSegmentIndex: Int? { get }
    var selectedSegmentTintColor: Color? { get }
    var momentary: Bool? { get }
}

public struct SegmentedControl: IBDecodable, SegmentedControlProtocol, IBIdentifiable {
    // MARK: UIView
    public let key: String?
    public let id: String
    public let elementClass: String = "UISegmentedControl"
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
    // MARK: UISegmentedControl
    public let segmentControlStyle: String?
    public let segments: [Segment]
    public let selectedSegmentIndex: Int?
    public let selectedSegmentTintColor: Color?
    public let momentary: Bool?

    enum ViewCodingKeys: CodingKey { case color, segment }
    enum KeyCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> SegmentedControl {
        let view = try View.decode(xml)
        let control = try Control.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        let containerColors = xml.container(keys: ViewCodingKeys.self).nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let containerSegments = container.nestedContainerIfPresent(of: .segments, keys: ViewCodingKeys.self)
        return SegmentedControl(
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
            // UISegmentedControl
            segmentControlStyle:                       container.attributeIfPresent(of: .segmentControlStyle),
            segments:                                  try containerSegments?.elements(of: .segment) ?? [],
            selectedSegmentIndex:                      container.attributeIfPresent(of: .selectedSegmentIndex),
            selectedSegmentTintColor:                  containerColors?.withAttributeElement(.key, CodingKeys.selectedSegmentTintColor.stringValue),
            momentary:                                 container.attributeIfPresent(of: .momentary),
        )
    }

    public struct Segment: IBDecodable {
        public let title: String

        static func decode(_ xml: XMLIndexerType) throws -> SegmentedControl.Segment {
            let container = xml.container(keys: CodingKeys.self)
            return try Segment(title: container.attribute(of: .title))
        }
    }

}
