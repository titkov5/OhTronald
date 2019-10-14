//
//  SwiftUIView.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        MKMapView.init(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(
                  latitude: 34.011286, longitude: -116.166868)
              let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
              let region = MKCoordinateRegion(center: coordinate, span: span)
              uiView.setRegion(region, animated: true)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
