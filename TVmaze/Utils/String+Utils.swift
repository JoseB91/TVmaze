//
//  String+Utils.swift
//  TVmaze
//
//  Created by José Briones Romero on 23/8/22.
//

import Foundation

extension String {
    
    func removeHTMLTags() -> String {
        
        return self.replacingOccurrences(of: "<p>", with: "")
            .replacingOccurrences(of: "<b>", with: "")
            .replacingOccurrences(of: "<i>", with: "")
            .replacingOccurrences(of: "</p>", with: "")
            .replacingOccurrences(of: "</b>", with: "")
            .replacingOccurrences(of: "</i>", with: "")
    }
    
}


