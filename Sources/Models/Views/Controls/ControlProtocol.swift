//
//  ControlProtocol.swift
//  
//
//  Created by phimage on 19/09/2020.
//

import Foundation

public protocol ControlProtocol: ViewProtocol {
    // MARK: Attributes Inspector
    var contentHorizontalAlignment: String? { get }
    var contentVerticalAlignment: String? { get }
    var showsMenuAsPrimaryAction: Bool? { get }
    var isSelected: Bool? { get }
    var isEnabled: Bool? { get }
    var isHighlighted: Bool? { get }
    var toolTip: String? { get }
}
