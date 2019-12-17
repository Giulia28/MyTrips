//
//  TripRow.swift
//  MyTrips
//
//  Created by Giulia on 15/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI
import CoreData

struct TripRow: View {
    var name: String?
    var imageName: String?
    var startDate: String?
    var endDate: String?
    
    var body: some View {
        HStack() {
            Image(imageName ?? "")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .shadow(radius: 4)
            Text(name ?? "").bold()
            Spacer()
            Text("\(startDate ?? "") - \(endDate ?? "")")
                .font(.caption)
                .foregroundColor(Color.gray)
        }
        .padding()
    }
}

struct TripRow_Previews: PreviewProvider {
    static var previews: some View {
        TripRow(name: "Seychelles", imageName: Trip.DestinationType.sea.rawValue, startDate: "13/09/2019", endDate: "20/09/2019")
            .previewLayout(.fixed(width: 350, height: 70))
    }
}
