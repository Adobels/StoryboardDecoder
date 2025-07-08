//
//  ModalPresentationStyle.swift
//  IBDecodable
//
//  Created by eidd5180 on 11/10/2019.
//

import SWXMLHash

public enum ModalPresentationStyle: XMLAttributeDecodable, KeyDecodable, Equatable {
       case automatic, fullScreen, pageSheet, formSheet, currentContext
       case custom, overFullScreen, overCurrentContext, blurOverFullScreen, popover, none

       public func encode(to encoder: Encoder) throws { fatalError() }

       static func decode(_ attribute: XMLAttribute) throws -> ModalPresentationStyle {
           switch attribute.text {
           case "automatic": .automatic
           case "fullScreen": .fullScreen
           case "pageSheet": .pageSheet
           case "formSheet": .formSheet
           case "currentContext": .currentContext
           case "custom": .custom
           case "overFullScreen": .overFullScreen
           case "overCurrentContext": .overCurrentContext
           case "blurOverFullScreen": .blurOverFullScreen
           case "popover": .popover
           case "none": .none
           default: .none
           }
       }
   }
