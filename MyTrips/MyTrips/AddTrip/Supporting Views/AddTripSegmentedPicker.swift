//
//  AddTripSegmentedPicker.swift
//  MyTrips
//
//  Created by Giulia on 17/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI

struct AddTripSegmentedPicker: View {
    
    @Binding var destinationType: Trip.DestinationType

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Destination Type:").bold()
            
            Picker("Destination Type:", selection: $destinationType) {
                ForEach(Trip.DestinationType.allCases, id: \.self) { destination in
                    VStack {
                        Text(destination.rawValue).tag(destination)
                    }
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }
}

struct AddTripSegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        AddTripSegmentedPicker(destinationType: .constant(Trip.DestinationType.sea))
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
