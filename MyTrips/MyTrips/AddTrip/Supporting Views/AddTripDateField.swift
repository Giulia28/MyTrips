//
//  AddTripDateField.swift
//  MyTrips
//
//  Created by Giulia on 17/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI

struct AddTripDateField: View {
    
    var fieldName: String
    @Binding var date: Date
    var minDate: Date?
    
    @State private var showDatePicker = false

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    private var dateRange: ClosedRange<Date> {
        let min = minDate ?? Calendar.current.date(byAdding: .year, value: -4, to: Date())!
        let max = Calendar.current.date(byAdding: .year, value: 4, to: Date())!
        return min...max
    }
    
    private var dateString: String {
        self.dateFormatter.string(from: self.date)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(fieldName)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button(action: {
                    withAnimation {
                        self.showDatePicker.toggle()
                    }
                }) {
                    Text(dateString)
                }
            }
            .padding()
            if showDatePicker {
                Divider()
                DatePicker(selection: $date, in: dateRange, displayedComponents: .date) {
                    Text("")
                }
            }
        }
    }
}

struct AddTripDateField_Previews: PreviewProvider {
    static var previews: some View {
        AddTripDateField(fieldName: "Start date:", date: .constant(Date()),  minDate: Date())
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
