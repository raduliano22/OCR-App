//
//  ScanData.swift
//  OCRApp
//
//  Created by Octav Radulian on 18.04.2022.
//

import Foundation

struct ScanData: Identifiable {
    
    var id = UUID()
    let content: String
    
    init(content: String){
        self.content = content
    }
    
}
