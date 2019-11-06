//
//  CircleImage.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct Avatar: View {
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .frame(width: 75, height: 60, alignment: .center)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 2))
                .shadow(radius: 2)
            
            Text("Tronald")
        }
        
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar()
    }
}

