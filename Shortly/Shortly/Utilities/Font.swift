//
//  Font.swift
//  Shortly
//
//  Created by Nedim Basic on 13. 9. 2021..
//

import SwiftUI

extension Font {
    
    static private let mediumFontName = "Poppins-Medium"
    static private let boldFontName = "Poppins-Bold"
    
    static let shortlyTitle = Font.custom(boldFontName, size: 24)
    static let shortlySubtitle = Font.custom(mediumFontName, size: 17)
    static let shortlyButtonTitle = Font.custom(boldFontName, size: 18)
    static let shortlyText = Font.custom(mediumFontName, size: 18)
    static let shortlyCellText = Font.custom(mediumFontName, size: 16)
    static let shortlyTextField = Font.custom(mediumFontName, size: 16)
}
