//
//  TripList.swift
//  MyTrips
//
//  Created by Giulia on 15/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI
import CoreData

struct TripList: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(fetchRequest: Trip.allTripsFetchRequest()) var trips: FetchedResults<Trip>

    @State private var showAddDetail = false
    
    
    var body: some View {
        
        NavigationView {
            List(self.trips) { trip in
                NavigationLink(destination: TripDetail(trip: (trip as Trip))) {
                    TripRow(name: (trip as Trip).name, imageName: (trip as Trip).imageName, startDate: (trip as Trip).startDateString, endDate: (trip as Trip).endDateString)
                }
            }
            .navigationBarTitle("My Trips")
            TripDetail(trip: trips[0])
            .navigationBarItems(trailing:
                Button(action: { self.showAddDetail = true }, label: {
                  Text("+")
                  .font(.title)
                })
                .sheet(isPresented: $showAddDetail) {
                    AddTrip().environment(\.managedObjectContext, self.managedObjectContext)
                }
            )
        }
    }
}

struct TripList_Previews: PreviewProvider {
    static var previews: some View {
//        ForEach(["iPhone 8", "iPad (7th generation)"], id: \.self) { deviceName in
            TripList()
                .environment(\.managedObjectContext, (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        
//                        .previewDevice(PreviewDevice(rawValue: "iPad (7th generation)"))

//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
    }
}
