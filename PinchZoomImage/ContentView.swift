//
//  ContentView.swift
//  PinchZoomImage
//
//  Created by Priya Talreja on 31/07/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @State private var imageSize: CGSize = .zero
    var body: some View {
        GeometryReader { proxy in
            WebImage(url: URL(string: "https://images.unsplash.com/photo-1605496036006-fa36378ca4ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"))
                .resizable()
                .onSuccess(perform: { image, _, _ in
                    DispatchQueue.main.async {
                        self.imageSize = CGSize(width: proxy.size.width, height: proxy.size.height)
                    }
                })
                .indicator(.activity)
                .scaledToFit()
                .clipShape(Rectangle())
                .modifier(ImageModifier(contentSize: imageSize))
                .frame(width: imageSize.width, height: imageSize.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
