//
//  DiamondKataView.swift
//  Diamond Kata
//
//  Created by Iliyan Mladenov on 13.10.22.
//

import SwiftUI

struct DiamondKataView: View {
    @ObservedObject private var viewModel = DiamondKataViewModel()

    var body: some View {
        VStack {
            Text(viewModel.labelMessage)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 50)
            TextField("Please input character", text: $viewModel.diamondKata)
                .textFieldStyle(.roundedBorder)
                .frame(width: 200, height: 30, alignment: .center)
                .multilineTextAlignment(.center)
                .keyboardType(.alphabet)
                .border(.black, width: 1)
                .padding(10)

            Button("Make diamond kata") {
                viewModel.labelMessage = ""
                let diamondKata = viewModel.makeDiamondKata()
                for element in diamondKata {
                    viewModel.labelMessage.append(element)
                    if diamondKata.count > 1 {
                        viewModel.labelMessage.append("\n")
                    }
                }
            }
            .frame(width: 160, height: 35)
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DiamondKataView()
    }
}
