//
//  TableView.swift
//  IBLinterCore
//
//  Created by SaitoYuta on 3/11/18.
//

import SWXMLHash

// MARK: - TableView

protocol TableViewProtocol: ScrollViewProtocol {
    var dataMode: TableView.DataMode? { get }
    var estimatedRowHeight: Float? { get }
    var rowHeight: Float? { get }
    var sectionFooterHeight: Float? { get }
    var sectionHeaderHeight: Float? { get }
    var separatorStyle: String? { get }
    var style: String? { get }
    var subviews: [AnyView]? { get }
    var sections: [TableViewSection]? { get }
    var prototypeCells: [TableViewCell]? { get }
    var headersFooters: [AnyView]? { get }
    var allowsSelection: Bool? { get }
    var allowsMultipleSelection: Bool? { get }
    // UITableView Attributes Inspector
    var separatorColor: Color? { get }
    var separatorInset: Inset? { get }
    var separatorInsetReference: String? { get }
    var allowsSelectionDuringEditing: Bool? { get }
    var allowsMultipleSelectionDuringEditing: Bool? { get }
    var springLoaded: Bool? { get }
    var sectionIndexMinimumDisplayRowCount: Int? { get }
    var sectionIndexColor: Color? { get }
    var sectionIndexBackgroundColor: Color? { get }
    var sectionIndexTrackingBackgroundColor: Color? { get }
    // UITableView Size Inspector
    var estimatedSectionHeaderHeight: Int? { get }
    var estimatedSectionFooterHeight: Int? { get }
    var contentViewInsetsToSafeArea: Bool? { get }
}

public struct TableView: IBDecodable, TableViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let key: String?
    public let id: String
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
    public let horizontalHuggingPriority: Int?
    public let verticalHuggingPriority: Int?
    public let horizontalCompressionResistancePriority: Int?
    public let verticalCompressionResistancePriority: Int?
    public let constraints: [Constraint]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    //public let subviews: [AnyView]?
    public let verifyAmbiguity: VerifyAmbiguity?
    public let isMisplaced: Bool?
    public let isAmbiguous: Bool?
    // MARK: UIScrollView
    public let isPagingEnabled: Bool?
    public let bouncesZoom: Bool?
    public let bounces: Bool?
    public let alwaysBounceVertical: Bool?
    public let keyboardDismissMode: String?
    public let showsVerticalScrollIndicator: Bool? // default true
    public let showsHorizontalScrollIndicator: Bool? // default true
    public let maximumZoomScale: Float?
    public let minimumZoomScale: Float?
    public let isDirectionalLockEnabled: Bool?
    public let contentLayoutGuide: LayoutGuide?
    public let frameLayoutGuide: LayoutGuide?
    public let indicatorStyle: IndicatorStyle?
    public let scrollEnabled: Bool?
    public let alwaysBounceHorizontal: Bool?
    public let delaysContentTouches: Bool?
    public let canCancelContentTouches: Bool?
    public let keyboard: LayoutGuide?
    public let safeArea: LayoutGuide?
    // UIScrollView Properties in Attributes Inspector
    public let pagingEnabled: Bool?
    public let directionalLockEnabled: Bool?
    // UIScrollView Properties in Size Inspector
    public let scrollIndicatorInsets: Inset?
    public let contentInsetAdjustmentBehavior: String?
    // move here the contentLayoutGuide and frameLayoutGuide properties
    // MARK: UITableView
    public let dataMode: DataMode?
    public let estimatedRowHeight: Float?
    public let rowHeight: Float?
    public let sectionFooterHeight: Float?
    public let sectionHeaderHeight: Float?
    public let separatorStyle: String?
    public let style: String?
    private let _subviews: [AnyView]?
    public var subviews: [AnyView]? { (_subviews ?? []) + (headersFooters ?? []) }
    public let sections: [TableViewSection]?
    public let prototypeCells: [TableViewCell]?
    public let headersFooters: [AnyView]?
    public let allowsSelection: Bool?
    public let allowsMultipleSelection: Bool?
    // UITableView Attributes Inspector
    public let separatorColor: Color?
    public let separatorInset: Inset?
    public let separatorInsetReference: String?
    public let allowsSelectionDuringEditing: Bool?
    public let allowsMultipleSelectionDuringEditing: Bool?
    public let springLoaded: Bool?
    public let sectionIndexMinimumDisplayRowCount: Int?
    public let sectionIndexColor: Color?
    public let sectionIndexBackgroundColor: Color?
    public let sectionIndexTrackingBackgroundColor: Color?
    // UITableView Size Inspector
    public let estimatedSectionHeaderHeight: Int?
    public let estimatedSectionFooterHeight: Int?
    public let contentViewInsetsToSafeArea: Bool?

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
        let scrollView = try ScrollView.decode(xml)
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .prototypeCells: return "prototypes"
                case .isPagingEnabled: return "pagingEnabled"
                case .isDirectionalLockEnabled: return "directionalLockEnabled"
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
        let viewLayoutGuideContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .viewLayoutGuide, keys: KeyCodingKeys.self)
        let keyboardLayoutGuideContainer = xml.container(keys: ViewLayoutGuideKeys.self)
            .nestedContainerIfPresent(of: .keyboardLayoutGuide, keys: ViewLayoutGuideKeys.self)
        return TableView(
            key: scrollView.key,
            id: scrollView.id,
            customClass: scrollView.customClass,
            customModule: scrollView.customModule,
            customModuleProvider: scrollView.customModuleProvider,
            restorationIdentifier: scrollView.restorationIdentifier,
            userDefinedRuntimeAttributes: scrollView.userDefinedRuntimeAttributes,
            userLabel: scrollView.userLabel,
            colorLabel: scrollView.colorLabel,
            accessibility: scrollView.accessibility,
            contentMode: scrollView.contentMode,
            semanticContentAttribute: scrollView.semanticContentAttribute,
            tag: scrollView.tag,
            userInteractionEnabled: scrollView.userInteractionEnabled,
            multipleTouchEnabled: scrollView.multipleTouchEnabled,
            alpha: scrollView.alpha,
            backgroundColor: scrollView.backgroundColor,
            tintColor: scrollView.tintColor,
            opaque: scrollView.opaque,
            hidden: scrollView.hidden,
            clearsContextBeforeDrawing: scrollView.clearsContextBeforeDrawing,
            clipsSubviews: scrollView.clipsSubviews,
            autoresizesSubviews: scrollView.autoresizesSubviews,
            rect: scrollView.rect,
            translatesAutoresizingMaskIntoConstraints: scrollView.translatesAutoresizingMaskIntoConstraints,
            autoresizingMask: scrollView.autoresizingMask,
            directionalLayoutMargins: scrollView.directionalLayoutMargins,
            layoutMargins: scrollView.layoutMargins,
            preservesSuperviewLayoutMargins: scrollView.preservesSuperviewLayoutMargins,
            layoutMarginsFollowReadableWidth: scrollView.layoutMarginsFollowReadableWidth,
            insetsLayoutMarginsFromSafeArea: scrollView.insetsLayoutMarginsFromSafeArea,
            horizontalHuggingPriority: scrollView.horizontalHuggingPriority,
            verticalHuggingPriority: scrollView.verticalHuggingPriority,
            horizontalCompressionResistancePriority: scrollView.horizontalCompressionResistancePriority,
            verticalCompressionResistancePriority: scrollView.verticalCompressionResistancePriority,
            constraints: scrollView.constraints,
            connections: scrollView.connections,
            variations: scrollView.variations,
            //subviews: scrollView.subviews,
            verifyAmbiguity: scrollView.verifyAmbiguity,
            isMisplaced: scrollView.isMisplaced,
            isAmbiguous: scrollView.isAmbiguous,
            // UIScrollView
            isPagingEnabled: scrollView.isPagingEnabled,
            bouncesZoom: scrollView.bouncesZoom,
            bounces: scrollView.bounces,
            alwaysBounceVertical: scrollView.alwaysBounceVertical,
            keyboardDismissMode: scrollView.keyboardDismissMode,
            showsVerticalScrollIndicator: scrollView.showsVerticalScrollIndicator,
            showsHorizontalScrollIndicator: scrollView.showsHorizontalScrollIndicator,
            maximumZoomScale: scrollView.maximumZoomScale,
            minimumZoomScale: scrollView.minimumZoomScale,
            isDirectionalLockEnabled: scrollView.isDirectionalLockEnabled,
            contentLayoutGuide:                        viewLayoutGuideContainer?.withAttributeElement(.key, CodingKeys.contentLayoutGuide.stringValue),
            frameLayoutGuide:                          viewLayoutGuideContainer?.withAttributeElement(.key, CodingKeys.frameLayoutGuide.stringValue),
            indicatorStyle:                            scrollView.indicatorStyle,
            scrollEnabled:                             scrollView.scrollEnabled,
            alwaysBounceHorizontal:                    scrollView.alwaysBounceHorizontal,
            delaysContentTouches:                      scrollView.delaysContentTouches,
            canCancelContentTouches:                   scrollView.canCancelContentTouches,
            keyboard:                                  keyboardLayoutGuideContainer?.withAttributeElement(.keyboardLayoutGuide, CodingKeys.keyboard.stringValue),
            safeArea:                                  viewLayoutGuideContainer?.withAttributeElement(.key, CodingKeys.safeArea.stringValue),
            pagingEnabled:                             scrollView.pagingEnabled,
            directionalLockEnabled:                    scrollView.directionalLockEnabled,
            scrollIndicatorInsets:                     insetsContainer?.withAttributeElement(.key, CodingKeys.scrollIndicatorInsets.stringValue),
            contentInsetAdjustmentBehavior:            scrollView.contentInsetAdjustmentBehavior,
            // MARK: UITableView
            dataMode: container.attributeIfPresent(of: .dataMode),
            estimatedRowHeight: container.attributeIfPresent(of: .estimatedRowHeight),
            rowHeight: container.attributeIfPresent(of: .rowHeight),
            sectionFooterHeight: container.attributeIfPresent(of: .sectionFooterHeight),
            sectionHeaderHeight: container.attributeIfPresent(of: .sectionHeaderHeight),
            separatorStyle: container.attributeIfPresent(of: .separatorStyle),
            style: container.attributeIfPresent(of: .style),
            _subviews: container.childrenIfPresent(of: ._subviews),
            sections: container.childrenIfPresent(of: .sections),
            prototypeCells: container.childrenIfPresent(of: .prototypeCells),
            headersFooters: container.elementsIfPresent(of: .headersFooters),
            allowsSelection: container.attributeIfPresent(of: .allowsSelection),
            allowsMultipleSelection: container.attributeIfPresent(of: .allowsMultipleSelection),
            separatorColor:                            colorsContainer?.withAttributeElement(.key, CodingKeys.separatorColor.stringValue),
            separatorInset:                            insetsContainer?.withAttributeElement(.key, CodingKeys.separatorInset.stringValue),
            separatorInsetReference:                   container.attributeIfPresent(of: .separatorInsetReference),
            allowsSelectionDuringEditing:              container.attributeIfPresent(of: .allowsSelectionDuringEditing),
            allowsMultipleSelectionDuringEditing:      container.attributeIfPresent(of: .allowsMultipleSelectionDuringEditing),
            springLoaded:                              container.attributeIfPresent(of: .springLoaded),
            sectionIndexMinimumDisplayRowCount:        container.attributeIfPresent(of: .sectionIndexMinimumDisplayRowCount),
            sectionIndexColor:                         colorsContainer?.withAttributeElement(.key, CodingKeys.sectionIndexColor.stringValue),
            sectionIndexBackgroundColor:               colorsContainer?.withAttributeElement(.key, CodingKeys.sectionIndexBackgroundColor.stringValue),
            sectionIndexTrackingBackgroundColor:       colorsContainer?.withAttributeElement(.key, CodingKeys.sectionIndexTrackingBackgroundColor.stringValue),
            estimatedSectionHeaderHeight: container.attributeIfPresent(of: .estimatedSectionHeaderHeight),
            estimatedSectionFooterHeight: container.attributeIfPresent(of: .estimatedSectionFooterHeight),
            contentViewInsetsToSafeArea: container.attributeIfPresent(of: .contentViewInsetsToSafeArea),
        )
    }
}

// MARK: - TableViewSection

public struct TableViewSection: IBDecodable {

    public let id: String
    public let headerTitle: String?
    public let footerTitle: String?
    public let colorLabel: String?
    public let cells: [TableViewCell]?
    public let userComments: AttributedString?

    enum ExternalCodingKeys: CodingKey { case attributedString }
    enum AttributedStringCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> TableViewSection {
        assert(xml.elementName == "tableViewSection")
        let container = xml.container(keys: CodingKeys.self)
        let attributedStringContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .attributedString, keys: AttributedStringCodingKeys.self)
        return TableViewSection(
            id:           try container.attribute(of: .id),
            headerTitle:  container.attributeIfPresent(of: .headerTitle),
            footerTitle:  container.attributeIfPresent(of: .footerTitle),
            colorLabel:   container.attributeIfPresent(of: .colorLabel),
            cells:        container.childrenIfPresent(of: .cells),
            userComments: attributedStringContainer?.withAttributeElement(.key, "userComments")
        )
    }
}
// MARK: - TableViewCell

public struct TableViewCell: IBDecodable, ViewProtocol, IBIdentifiable, IBReusable {

    public let id: String
    public let elementClass: String = "UITableViewCell"

    public let key: String?
    public let autoresizingMask: AutoresizingMask?
    public let clipsSubviews: Bool?
    public let constraints: [Constraint]?
    public let contentView: TableViewContentView
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
    private let _subviews: [AnyView]?
    public var subviews: [AnyView]? {
        return (_subviews ?? []) + [AnyView(contentView)]
    }
    public let translatesAutoresizingMaskIntoConstraints: Bool?
    public let userInteractionEnabled: Bool?
    public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
    public let connections: [AnyConnection]?
    public let variations: [Variation]?
    public let reuseIdentifier: String?
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

    public var children: [IBElement] {
        // do not let default implementation which lead to duplicate element contentView
        var children: [IBElement] = [contentView] + (rect.map { [$0] } ?? [])
        if let elements = constraints {
            children += elements as [IBElement]
        }
        if let elements = _subviews {
            children += elements as [IBElement]
        }
        if let elements = userDefinedRuntimeAttributes {
            children += elements as [IBElement]
        }
        if let elements = connections {
            children += elements as [IBElement]
        }
        return children
    }

    public struct TableViewContentView: IBDecodable, ViewProtocol, IBIdentifiable {
        public let id: String
        public let elementClass: String = "UITableViewContentView"

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
        public let userDefinedRuntimeAttributes: [UserDefinedRuntimeAttribute]?
        public let connections: [AnyConnection]?
        public let variations: [Variation]?
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

        static func decode(_ xml: XMLIndexerType) throws -> TableViewCell.TableViewContentView {
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
            let constraintsContainer = container.nestedContainerIfPresent(of: .constraints, keys: ConstraintsCodingKeys.self)
            let variationContainer = xml.container(keys: VariationCodingKey.self)
            let colorsContainer = xml.container(keys: ExternalCodingKeys.self)
                .nestedContainerIfPresent(of: .color, keys: ColorsCodingKeys.self)

            return TableViewContentView(
                id:                                        try container.attribute(of: .id),
                key:                                       container.attributeIfPresent(of: .key),
                autoresizingMask:                          container.elementIfPresent(of: .autoresizingMask),
                clipsSubviews:                             container.attributeIfPresent(of: .clipsSubviews),
                constraints:                               constraintsContainer?.elementsIfPresent(of: .constraint),
                contentMode:                               container.attributeIfPresent(of: .contentMode),
                customClass:                               container.attributeIfPresent(of: .customClass),
                customModule:                              container.attributeIfPresent(of: .customModule),
                customModuleProvider:                      container.attributeIfPresent(of: .customModuleProvider),
                restorationIdentifier:                     container.attributeIfPresent(of: .restorationIdentifier),
                userLabel:                                 container.attributeIfPresent(of: .userLabel),
                colorLabel:                                container.attributeIfPresent(of: .colorLabel),
                isMisplaced:                               container.attributeIfPresent(of: .isMisplaced),
                isAmbiguous:                               container.attributeIfPresent(of: .isAmbiguous),
                verifyAmbiguity:                           container.attributeIfPresent(of: .verifyAmbiguity),
                opaque:                                    container.attributeIfPresent(of: .opaque),
                rect:                                      container.elementIfPresent(of: .rect),
                subviews:                                  container.childrenIfPresent(of: .subviews),
                translatesAutoresizingMaskIntoConstraints: container.attributeIfPresent(of: .translatesAutoresizingMaskIntoConstraints),
                userInteractionEnabled:                    container.attributeIfPresent(of: .userInteractionEnabled),
                userDefinedRuntimeAttributes:              container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
                connections:                               container.childrenIfPresent(of: .connections),
                variations:                                variationContainer.elementsIfPresent(of: .variation),
                backgroundColor:                           colorsContainer?.withAttributeElement(.key, CodingKeys.backgroundColor.stringValue),
                tintColor:                                 colorsContainer?.withAttributeElement(.key, CodingKeys.tintColor.stringValue),
                hidden:                                  container.attributeIfPresent(of: .hidden),
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
                directionalLayoutMargins:                     container.elementIfPresent(of: .insetsLayoutMarginsFromSafeArea),
                layoutMargins:                                 container.elementIfPresent(of: .layoutMargins),
            )
        }
    }

    enum ConstraintsCodingKeys: CodingKey { case constraint }
    enum VariationCodingKey: CodingKey { case variation }
    enum ExternalCodingKeys: CodingKey { case color }
    enum ColorsCodingKeys: CodingKey { case key }

    static func decode(_ xml: XMLIndexerType) throws -> TableViewCell {
        let container = xml.container(keys: MappedCodingKey.self).map { (key: CodingKeys) in
            let stringValue: String = {
                switch key {
                case .isMisplaced: return "misplaced"
                case .isAmbiguous: return "ambiguous"

                case ._subviews: return "subview"
                case .contentView: return "tableViewCellContentView"
                default: return key.stringValue
                }
            }()
            return MappedCodingKey(stringValue: stringValue)
        }
        let constraintsContainer = container.nestedContainerIfPresent(of: .constraints, keys: ConstraintsCodingKeys.self)
        let variationContainer = xml.container(keys: VariationCodingKey.self)
        let colorsContainer = xml.container(keys: ExternalCodingKeys.self)
            .nestedContainerIfPresent(of: .color, keys: ColorsCodingKeys.self)

        return TableViewCell(
            id:                                        try container.attribute(of: .id),
            key:                                       container.attributeIfPresent(of: .key),
            autoresizingMask:                          container.elementIfPresent(of: .autoresizingMask),
            clipsSubviews:                             container.attributeIfPresent(of: .clipsSubviews),
            constraints:                               constraintsContainer?.elementsIfPresent(of: .constraint),
            contentView:                               try container.element(of: .contentView),
            contentMode:                               container.attributeIfPresent(of: .contentMode),
            customClass:                               container.attributeIfPresent(of: .customClass),
            customModule:                              container.attributeIfPresent(of: .customModule),
            customModuleProvider:                      container.attributeIfPresent(of: .customModuleProvider),
            restorationIdentifier:                     container.attributeIfPresent(of: .restorationIdentifier),
            userLabel:                                 container.attributeIfPresent(of: .userLabel),
            colorLabel:                                container.attributeIfPresent(of: .colorLabel),
            isMisplaced:                               container.attributeIfPresent(of: .isMisplaced),
            isAmbiguous:                               container.attributeIfPresent(of: .isAmbiguous),
            verifyAmbiguity:                           container.attributeIfPresent(of: .verifyAmbiguity),
            opaque:                                    container.attributeIfPresent(of: .opaque),
            rect:                                      container.elementIfPresent(of: .rect),
            _subviews:                                 container.childrenIfPresent(of: ._subviews),
            translatesAutoresizingMaskIntoConstraints: container.attributeIfPresent(of: .translatesAutoresizingMaskIntoConstraints),
            userInteractionEnabled:                    container.attributeIfPresent(of: .userInteractionEnabled),
            userDefinedRuntimeAttributes:              container.childrenIfPresent(of: .userDefinedRuntimeAttributes),
            connections:                               container.childrenIfPresent(of: .connections),
            variations:                                variationContainer.elementsIfPresent(of: .variation),
            reuseIdentifier:                           container.attributeIfPresent(of: .reuseIdentifier),
            backgroundColor:                           colorsContainer?.withAttributeElement(.key, CodingKeys.backgroundColor.stringValue),
            tintColor:                                 colorsContainer?.withAttributeElement(.key, CodingKeys.tintColor.stringValue),
            hidden:                                  container.attributeIfPresent(of: .hidden),
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
            directionalLayoutMargins:                     container.elementIfPresent(of: .insetsLayoutMarginsFromSafeArea),
            layoutMargins:                                 container.elementIfPresent(of: .layoutMargins),
        )
    }
}
