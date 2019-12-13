//
//  CustomTextField.swift
//  Podcast
//
//  Created by Sirak on 12/12/19.
//  Copyright © 2019 Sirak. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
