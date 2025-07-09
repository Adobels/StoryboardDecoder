//
//  MapView.swift
//  IBDecodable
//
//  Created by phimage on 01/04/2018.
//

import SWXMLHash

protocol MapViewProtocol: ViewProtocol {
    // TODO: Check with InterfaceBuilder if the attribues are not outdated
    var mapType: String? { get }
    var showsTraffic: Bool? { get }
    var scrollEnabled: Bool? { get }
    var appearanceType: String? { get }
    var showsCompass: Bool? { get }
    var showsPointsOfInterest: Bool? { get }
    var showsUserLocation: Bool? { get }
    var showsScale: Bool? { get }
    var showsBuildings: Bool? { get }
    var pitchEnabled: Bool? { get }
    var rotateEnabled: Bool? { get }
    var zoomEnabled: Bool? { get }
}

public struct MapView: IBDecodable, MapViewProtocol, IBIdentifiable {
    // MARK: UIView
    public let id: String
    public let key: String?
    public let elementClass: String = "MKMapView"
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
    public let fixedFrame: Bool?
    // MARK: MKMapView
    public let mapType: String?
    public let showsTraffic: Bool?
    public let scrollEnabled: Bool?
    public let appearanceType: String?
    public let showsCompass: Bool?
    public let showsPointsOfInterest: Bool?
    public let showsUserLocation: Bool?
    public let showsScale: Bool?
    public let showsBuildings: Bool?
    public let pitchEnabled: Bool?
    public let rotateEnabled: Bool?
    public let zoomEnabled: Bool?
    
    static func decode(_ xml: XMLIndexerType) throws -> MapView {
        let view = try View.decode(xml)
        let container = xml.container(keys: CodingKeys.self)
        return MapView(
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
            fixedFrame: view.fixedFrame,
            mapType: container.attributeIfPresent(of: .mapType),
            showsTraffic: container.attributeIfPresent(of: .showsTraffic),
            scrollEnabled: container.attributeIfPresent(of: .scrollEnabled),
            appearanceType: container.attributeIfPresent(of: .appearanceType),
            showsCompass: container.attributeIfPresent(of: .showsCompass),
            showsPointsOfInterest: container.attributeIfPresent(of: .showsPointsOfInterest),
            showsUserLocation: container.attributeIfPresent(of: .showsUserLocation),
            showsScale: container.attributeIfPresent(of: .showsScale),
            showsBuildings: container.attributeIfPresent(of: .showsBuildings),
            pitchEnabled: container.attributeIfPresent(of: .pitchEnabled),
            rotateEnabled: container.attributeIfPresent(of: .rotateEnabled),
            zoomEnabled: container.attributeIfPresent(of: .zoomEnabled),
        )
    }
}
