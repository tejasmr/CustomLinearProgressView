//
//  ContentView.swift
//  CustomLinearProgressView
//
//  Created by tezz on 23/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.1
    var body: some View {
        LinearProgressView(progress: $progress)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
