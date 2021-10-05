//
//  SplashScreenView.swift
//  SplashScreenDemo
//
//  Created by Thongchai Subsaidee on 5/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SplashScreenView: View {
    
    @State var animationFinished: Bool = false
    @State var animationStarted: Bool = false
    @State var removeGif: Bool = false
    
    var body: some View {
        
  
        ZStack {
            
            HomeView()
                
             
            ZStack {
                

                if !removeGif {
                
                Color("BG")
                    .ignoresSafeArea()
                

                    ZStack{

                        if animationStarted {
                            if animationFinished {
                                Image("logoNetflix")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)

                            }else {
                                AnimatedImage(url: getLogoURL())
                                //                .customLoopCount(1)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }else {
                            Image("logoStarting")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    .animation(.none, value: animationFinished)

                }
                
            }
            .opacity(animationFinished ? 0 : 1)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                animationStarted = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    withAnimation(.easeInOut(duration: 0.7)) {
                        animationFinished = false
                    }
                     
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        removeGif = true
                    }
                }
            }
        }
        
    }
    
    func getLogoURL() -> URL {
        let bundle = Bundle.main.path(forResource: "logo", ofType: "gif")
        let url = URL(fileURLWithPath: bundle ?? "")
        return url
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
