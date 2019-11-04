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
            Spacer()
            
            if viewModel.imageData != nil {
                Image(uiImage: UIImage(data: viewModel.imageData!)!)
               .resizable()
                .frame(width: 320, height: 240, alignment: .center)
                .scaledToFit()
            }
            

            Spacer()
            Button(action: {
                self.viewModel.loadRandomMem()
            }) {
                Text("Refresh mem")
            }
            Spacer()
            
            Button(action: {
                self.viewModel.loadRandomQuote()
            }) {
                Text("Refresh quote")
            }
            
            if viewModel.quote != nil {
                QuoteRow(viewModel: viewModel.quote!)
            }
            
        }
    }
}

struct RandomMemeView_Previews: PreviewProvider {
    static var previews: some View {
        RandomMemeView().environmentObject(RandomMemeQuoteViewModel())
    }
}
