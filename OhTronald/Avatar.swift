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
        Image("avatar")
        .resizable()
        .frame(width: 50, height: 40, alignment: .center)
        .scaledToFit()
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.blue, lineWidth: 2))
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar()
    }
}

