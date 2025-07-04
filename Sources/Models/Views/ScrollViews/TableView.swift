//
//  TableView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

// MARK: - TableView

protocol TableViewProtocol: ScrollViewProtocol {
    // MARK: Attributes Inspector
    var dataMode: TableView.DataMode? { get }
    var style: String? { get }
    var separatorStyle: String? { get }
    var separatorColor: Color? { get }
    var separatorInset: Inset? { get }
    var separatorInsetReference: String? { get }
    var allowsSelection: Bool? { get }
    var allowsMultipleSelection: Bool? { get }
    var allowsSelectionDuringEditing: Bool? { get }
    var allowsMultipleSelectionDuringEditing: Bool? { get }
    var springLoaded: Bool? { get }
    var sectionIndexMinimumDisplayRowCount: Int? { get }
    var sectionIndexColor: Color? { get }
    var sectionIndexBackgroundColor: Color? { get }
    var sectionIndexTrackingBackgroundColor: Color? { get }
    // MARK: Size Inspector
    var rowHeight: Float? { get }
    var estimatedRowHeight: Float? { get }
    var sectionHeaderHeight: Float? { get }
    var estimatedSectionHeaderHeight: Int? { get }
    var sectionFooterHeight: Float? { get }
    var estimatedSectionFooterHeight: Int? { get }
    var contentViewInsetsToSafeArea: Bool? { get }
    // MARK: Subviews
    var sections: [TableViewSection]? { get }
    var prototypeCells: [TableViewCell]? { get }
    var headersFooters: [AnyView]? { get }
    var _subviews: [AnyView]? { get }
    var subviews: [AnyView]? { get }
}

public struct TableView: IBDecodable, TableViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "UITableView"
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
    //public let subviews: [AnyView]?
    // MARK: UIScrollView
    public let indicatorStyle: IndicatorStyle?
    public let showsHorizontalScrollIndicator: Bool?
    public let showsVerticalScrollIndicator: Bool?
    public let scrollEnabled: Bool?
    public let pagingEnabled: Bool?
    public let directionalLockEnabled: Bool?
    public let bounces: Bool?
    public let bouncesZoom: Bool?
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
    // MARK: UITableView
    public let dataMode: TableView.DataMode?
    public let style: String?
    public let separatorStyle: String?
    public let separatorColor: Color?
    public let separatorInset: Inset?
    public let separatorInsetReference: String?
    public let allowsSelection: Bool?
    public let allowsMultipleSelection: Bool?
    public let allowsSelectionDuringEditing: Bool?
    public let allowsMultipleSelectionDuringEditing: Bool?
    public let springLoaded: Bool?
    public let sectionIndexMinimumDisplayRowCount: Int?
    public let sectionIndexColor: Color?
    public let sectionIndexBackgroundColor: Color?
    public let sectionIndexTrackingBackgroundColor: Color?
    public let rowHeight: Float?
    public let estimatedRowHeight: Float?
    public let sectionHeaderHeight: Float?
    public let estimatedSectionHeaderHeight: Int?
    public let sectionFooterHeight: Float?
    public let estimatedSectionFooterHeight: Int?
    public let contentViewInsetsToSafeArea: Bool?
    public let sections: [TableViewSection]?
    public let prototypeCells: [TableViewCell]?
    public let headersFooters: [AnyView]?
    public let _subviews: [AnyView]?
    public var subviews: [AnyView]? { (_subviews ?? []) + (headersFooters ?? []) }

    enum ConstraintsCodingKeys: CodingKey { case constraint }
    enum VariationCodingKey: CodingKey { case variation }
    enum ExternalCodingKeys: CodingKey {
        case color
        case inset
        case viewLayoutGuide
        case directionalEdgeInsets
        case edgeInsets
    }
    enum KeyCodingKeys: CodingKey { case key }
    enum InsetCodingKeys: CodingKey { case separatorInset, scrollIndicatorInsets }
    enum ViewLayoutGuideKeys: CodingKey { case contentLayoutGuide, frameLayoutGuide, keyboardLayoutGuide }
    enum DirectionalEdgeInsetsKeys: CodingKey { case directionalLayoutMargins }
    enum EdgeInsetsKeys: CodingKey { case layoutMargins }

    static func decode(_ xml: XMLIndexerType) throws -> TableView {
        let view = try View.decode(xml)
        let scrollView = try ScrollView.decode(xml)
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .prototypeCells: return "prototypes"
                case ._subviews: return "subviews"
                case .headersFooters: return "view"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        let colorsContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .color, keys: KeyCodingKeys.self)
        let insetsContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .inset, keys: KeyCodingKeys.self)
        return TableView(
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
            isMisplaced: view.isMisplaced,
            isAmbiguous: view.isAmbiguous,
            variations: view.variations,
            // subviews: view.subviews,
            indicatorStyle: scrollView.indicatorStyle,
            showsHorizontalScrollIndicator: scrollView.showsHorizontalScrollIndicator,
            showsVerticalScrollIndicator: scrollView.showsVerticalScrollIndicator,
            scrollEnabled: scrollView.scrollEnabled,
            pagingEnabled: scrollView.pagingEnabled,
            directionalLockEnabled: scrollView.directionalLockEnabled,
            bounces: scrollView.bounces,
            bouncesZoom: scrollView.bouncesZoom,
            alwaysBounceHorizontal: scrollView.alwaysBounceHorizontal,
            alwaysBounceVertical: scrollView.alwaysBounceVertical,
            minimumZoomScale: scrollView.minimumZoomScale,
            maximumZoomScale: scrollView.maximumZoomScale,
            delaysContentTouches: scrollView.delaysContentTouches,
            canCancelContentTouches: scrollView.canCancelContentTouches,
            keyboardDismissMode: scrollView.keyboardDismissMode,
            scrollIndicatorInsets: scrollView.scrollIndicatorInsets,
            contentInsetAdjustmentBehavior: scrollView.contentInsetAdjustmentBehavior,
            contentLayoutGuide: scrollView.contentLayoutGuide,
            frameLayoutGuide: scrollView.frameLayoutGuide,
            dataMode: container.attributeIfPresent(of: .dataMode),
            style: container.attributeIfPresent(of: .style),
            separatorStyle: container.attributeIfPresent(of: .separatorStyle),
            separatorColor: colorsContainer?.withAttributeElement(.key, CodingKeys.separatorColor.stringValue),
            separatorInset: insetsContainer?.withAttributeElement(.key, CodingKeys.separatorInset.stringValue),
            separatorInsetReference: container.attributeIfPresent(of: .separatorInsetReference),
            allowsSelection: container.attributeIfPresent(of: .allowsSelection),
            allowsMultipleSelection: container.attributeIfPresent(of: .allowsMultipleSelection),
            allowsSelectionDuringEditing: container.attributeIfPresent(of: .allowsSelectionDuringEditing),
            allowsMultipleSelectionDuringEditing: container.attributeIfPresent(of: .allowsMultipleSelectionDuringEditing),
            springLoaded: container.attributeIfPresent(of: .springLoaded),
            sectionIndexMinimumDisplayRowCount: container.attributeIfPresent(of: .sectionIndexMinimumDisplayRowCount),
            sectionIndexColor: colorsContainer?.withAttributeElement(.key, CodingKeys.sectionIndexColor.stringValue),
            sectionIndexBackgroundColor: colorsContainer?.withAttributeElement(.key, CodingKeys.sectionIndexBackgroundColor.stringValue),
            sectionIndexTrackingBackgroundColor: colorsContainer?.withAttributeElement(.key, CodingKeys.sectionIndexTrackingBackgroundColor.stringValue),
            rowHeight: container.attributeIfPresent(of: .rowHeight),
            estimatedRowHeight: container.attributeIfPresent(of: .estimatedRowHeight),
            sectionHeaderHeight: container.attributeIfPresent(of: .sectionHeaderHeight),
            estimatedSectionHeaderHeight: container.attributeIfPresent(of: .estimatedSectionHeaderHeight),
            sectionFooterHeight: container.attributeIfPresent(of: .sectionFooterHeight),
            estimatedSectionFooterHeight: container.attributeIfPresent(of: .estimatedSectionFooterHeight),
            contentViewInsetsToSafeArea: container.attributeIfPresent(of: .contentViewInsetsToSafeArea),
            sections: container.childrenIfPresent(of: .sections),
            prototypeCells: container.childrenIfPresent(of: .prototypeCells),
            headersFooters: container.elementsIfPresent(of: .headersFooters),
            _subviews: container.childrenIfPresent(of: ._subviews),
        )
    }
}

extension TableView {

    public enum DataMode: XMLAttributeDecodable, KeyDecodable, Equatable {
        case `static`, prototypes

        public func encode(to encoder: Encoder) throws { fatalError() }

        static func decode(_ attribute: XMLAttribute) throws -> TableView.DataMode {
            switch attribute.text {
            case "static":     return .static
            case "prototypes": return .prototypes
            default:
                throw IBError.unsupportedTableViewDataMode(attribute.text)
            }
        }

        public static func == (left: DataMode, right: DataMode) -> Bool {
            switch (left, right) {
            case (.`static`, .`static`):
                return true
            case (.prototypes, .prototypes):
                return true
            default:
                return false
            }
        }
    }
}
