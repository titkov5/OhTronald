//
//  ContentView.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var tag: String
    var body: some View {
        VStack {
            MapView()
                .edgesIgnoringSafeArea(.top)
                .frame(height:300)
             
            Avatar()
                .offset(y:-130)
                .padding(.bottom, -130)
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Turtle Rock")
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text(tag)
                        .font(.subheadline)
                }
            }
            .padding()
          Spacer()
        }.navigationBarTitle(Text(tag), displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(["iPhone SE", "iPhone X"], id: \.self) { deviceName in
            ContentView(tag: "California_dream")
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        
    }
}

