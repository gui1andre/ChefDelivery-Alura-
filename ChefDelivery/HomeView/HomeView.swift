//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 20/08/23.
//

import SwiftUI

struct HomeView: View {
    @State private var isAnimating = false
    @State private var imageOffSet: CGSize = .zero
    @State private var buttonOffSet: CGFloat = .zero
    @State private var showSecondStreen = false
    let buttonheight: CGFloat = 80
    var body: some View {
        GeometryReader {    geometry in
            ZStack {
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                Circle()
                    .foregroundColor(Color("ColorRedDark"))
                    .frame(width: isAnimating ? 200 : 0)
                    .position(
                        x: isAnimating ? geometry.size.width - 50 : geometry.size.width + 50,
                        y: isAnimating ? geometry.size.height - 50 : geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                VStack{
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundColor(Color("ColorRed"))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0: -40)
                    Text("Peça as suas comidas no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0: -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffSet.width,y: imageOffSet.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        imageOffSet = gesture.translation
                                    }
                                    
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        imageOffSet = .zero
                                    }
                                }))
                    ZStack{
                        Capsule()
                            .fill(Color("ColorRed")).opacity(0.2)
                        Capsule()
                            .fill(Color("ColorRed")).opacity(0.2)
                            .padding(8)
                        Text("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color("ColorRedDark"))
                            .offset(x: 20)
                        HStack{
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffSet + buttonheight)
                            Spacer()
                        }
                        HStack{
                            ZStack{
                                
                                Circle()
                                    .fill(Color("ColorRed"))
                                Circle()
                                    .fill(Color("ColorRedDark"))
                                    .padding(8)
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                                
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffSet)
                        .gesture(DragGesture()
                            .onChanged({ gesture in
                                if gesture.translation.width > 0 && buttonOffSet <= (geometry.size.width - 60) - buttonheight{
                                    withAnimation(.easeOut(duration: 0.25)){
                                        buttonOffSet = gesture.translation.width
                                    }
                                }
                            })
                                .onEnded({ _ in
                                    if buttonOffSet > (geometry.size.width - 60) / 2{
                                        showSecondStreen = true
                                    }else{
                                        withAnimation(.easeOut(duration: 0.25)){
                                            buttonOffSet = 0
                                        }
                                    }
                                }))
                    }
                    .frame(width: geometry.size.width - 60, height: buttonheight)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y:isAnimating ? 0 : 100)
                    
                }
                .onAppear{
                    withAnimation(.easeInOut(duration: 1.5)){
                        isAnimating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSecondStreen) {
                ContentView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(.sizeThatFits)
    }
}
