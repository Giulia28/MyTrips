//
//  AddTripTextField.swift
//  MyTrips
//
//  Created by Giulia on 17/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI

struct AddTripTextField: View {
    
    var fieldName: String
    @Binding var fieldValue: String

    var body: some View {
        HStack(alignment: .top) {
            Text(fieldName)
                .font(.headline)
            TextField("Insert text", text: $fieldValue)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

struct AddTripTextField_Previews: PreviewProvider {
    static var previews: some View {
        AddTripTextField(fieldName: "Name:", fieldValue: .constant("Value"))
        .previewLayout(.fixed(width: 350, height: 70))
    }
}
