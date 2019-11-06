//
//  RandomMemeView.swift
//  OhTronald
//
//  Created by Ivan Titkov on 04.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import SwiftUI

struct RandomMemeView: View {
    @EnvironmentObject var viewModel: RandomMemeQuoteViewModel
    
    var body: some View {
        VStack {
            Text("Random mem & quote")
            
            Spacer()
            .frame(height: 40)
            
            if viewModel.imageData != nil {
                Image(uiImage: UIImage(data: viewModel.imageData!)!)
                    .resizable()
                    .frame(width: 320, height: 240, alignment: .center)
                    .scaledToFit()
                    .padding()
            }
            
            Spacer()
                .frame(height: 20)
            
            Button(action: {
                self.viewModel.loadRandomMem()
            }) {
                Text("Refresh mem")
            }
            
            
            if viewModel.quote != nil {
                QuoteRow(viewModel: viewModel.quote!)
            }
            Spacer()
                .frame(height: 20)
            
            Button(action: {
                self.viewModel.loadRandomQuote()
            }) {
                Text("Refresh quote")
            }
            
            Spacer()
        }
    }
}

struct RandomMemeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomMemeView().environmentObject(RandomMemeQuoteViewModel())
    }
}
