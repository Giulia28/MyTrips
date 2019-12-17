//
//  AddTripSliderField.swift
//  MyTrips
//
//  Created by Giulia on 17/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI

struct AddTripSliderField: View {
    
    var fieldName: String

    @Binding var sliderValue: Double
    
    var minValue: Double = -90
    var maxValue: Double = +90

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(fieldName)
                .font(.headline)
                Spacer()
                Text("\(sliderValue) ")
            }
            Slider(value: $sliderValue, in: minValue...maxValue, step: 0.1)
        }
        .padding()
    }
}

struct AddTripSliderField_Previews: PreviewProvider {
    static var previews: some View {
        AddTripSliderField(fieldName: "Latitude:",sliderValue: .constant(20))
        .previewLayout(.fixed(width: 350, height: 100))
    }
}
