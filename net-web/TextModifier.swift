//
//  TextModifier.swift
//  net-web
//
//  Created by Sravanti on 23/12/25.
//

import SwiftUI

struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
    }
}

