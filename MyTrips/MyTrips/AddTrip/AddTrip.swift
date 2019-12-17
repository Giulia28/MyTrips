//
//  AddTrip.swift
//  MyTrips
//
//  Created by Giulia on 15/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI
import CoreData

struct AddTrip: View {
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode

    @State private var tripName: String = ""
    @State private var tripDesc: String = ""
    @State private var latitude: Double = 0
    @State private var longitude: Double = 0
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var destinationType: Trip.DestinationType = .sea
    
    var body: some View {
        
        VStack {
            VStack {
                AddTripTextField(fieldName: "Name:", fieldValue: $tripName)
                Divider()
                AddTripTextField(fieldName: "Description:", fieldValue: $tripDesc)
                Divider()
            }
            VStack {
                AddTripDateField(fieldName: "Start date:", date: $startDate)
                Divider()
                AddTripDateField(fieldName: "End date:", date: $endDate, minDate: startDate)
                Divider()
            }
            VStack {
                AddTripSliderField(fieldName: "Latitude:", sliderValue: $latitude, minValue: -90, maxValue: 90)
                Divider()
                AddTripSliderField(fieldName: "Longitude:", sliderValue: $longitude, minValue: -180, maxValue: 180)
                Divider()
            }
            AddTripSegmentedPicker(destinationType: $destinationType)
                        
            Button(action: ({
                self.saveDataFromUI()
                self.presentationMode.wrappedValue.dismiss()
            })) {
                Text("Save")
            }
            .padding()
        }
        .padding()
    }
    
    
    func saveDataFromUI() {
        let trip = Trip(context: self.managedObjectContext)
        trip.name = tripName
        trip.desc = tripDesc
        trip.startDate = startDate
        trip.endDate = endDate
        trip.imageName = destinationType.rawValue
        trip.latitude = NSDecimalNumber(value: latitude)
        trip.longitude = NSDecimalNumber(value: longitude)
        
        do {
            try self.managedObjectContext.save()
        } catch {
            print(error)
        }
    }
}

#if DEBUG
struct AddTrip_Previews: PreviewProvider {
    static var previews: some View {
        AddTrip()
            .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}
#endif
