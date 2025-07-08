//
//  AnyConnection.swift
//  IBDecodable
//
//  Created by phimage on 05/04/2018.
//

import SWXMLHash

// MARK: - ConnectionProtocol

public protocol ConnectionProtocol: IBIdentifiable {
    var id: String { get }
    var destination: String { get }
}

// MARK: - AnyConnection

public struct AnyConnection: IBDecodable {

    public let connection: ConnectionProtocol

    init(_ connection: ConnectionProtocol) {
        self.connection = connection
    }

    public func encode(to encoder: Encoder) throws { fatalError() }

    static func decode(_ xml: XMLIndexerType) throws -> AnyConnection {
        guard let elementName = xml.elementName else {
            throw IBError.elementNotFound
        }
        return switch elementName {
        case "outlet": try AnyConnection(Outlet.decode(xml))
        case "segue": try AnyConnection(Segue.decode(xml))
        case "action": try AnyConnection(Action.decode(xml))
        case "outletCollection": try AnyConnection(OutletCollection.decode(xml))
        default: throw IBError.unsupportedViewClass(elementName)
        }
    }

}

extension AnyConnection: IBAny {
    public typealias NestedElement = ConnectionProtocol
    public var nested: ConnectionProtocol {
        return connection
    }
}
