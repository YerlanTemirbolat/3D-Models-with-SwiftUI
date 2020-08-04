//
//  ContentView.swift
//  3D Model Project
//
//  Created by Admin on 8/4/20.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Model: Identifiable {
    var id: Int
    var name: String
    var modelName: String
    var details: String
}

struct Home: View {
    
    @State var models = [
        
        Model(id: 0, name: "Alien", modelName: "Alien.usdz", details: "Alien is a 1979 science-fiction horror film directed by Ridley Scott and written by Dan O'Bannon. Based on a story by O'Bannon and Ronald Shusett"),
        
        Model(id: 0, name: "Arachnoid", modelName: "Arachnoid.usdz", details: "Arachnoids are holy warriors of a primitive sentient race evolved from arthropods. They are an extremely hostile species due to their violent culture and religious convictions. Appearance-wise, they are large scorpion-like creatures."),
        
        Model(id: 0, name: "Batman", modelName: "Batman.usdz", details: "Batman is the superhero protector of Gotham City, a man dressed like a bat who fights against evil and strikes terror into the hearts of criminals everywhere."),
        
        Model(id: 0, name: "Crocodilo", modelName: "Crocodilo.usdz", details: "Killer Croc (Waylon Jones) is a fictional supervillain appearing in comic books published by DC Comics, commonly as an adversary of the superhero Batman"),
        
        Model(id: 0, name: "Joker", modelName: "Joker.usdz", details: "The Joker, initially portrayed as a small-time crook, was disfigured and driven insane by an accident with toxic chemicals. He was depicted with chalk-white skin, ruby-red lips permanently fixed in a demonic grin, and bright green hair."),
        
        Model(id: 0, name: "Predator", modelName: "Predator.usdz", details: "The Predator is an extraterrestrial species featured in the Predator science-fiction franchise, ... The Darkness, Aliens, and Predator franchises against each other, depicts a female Predator in a manner closer to the Perry description.")
    ]
    
    @State var index = 0
    
    var body: some View {
        VStack {
            SceneView(scene: SCNScene(named: models[index].modelName), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            
            ZStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            if index > 0 {
                                index -= 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == 0 ? 0.3 : 1)
                    })
                    .disabled(index == 0 ? true : false)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            if index < models.count {
                                index += 1
                            }
                        }
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 35, weight: .bold))
                            .opacity(index == models.count - 1 ? 0.3 : 1)
                    })
                    .disabled(index == models.count - 1 ? true : false)
                }
                
                Text(models[index].name)
                    .font(.system(size: 45, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical, 30)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("About")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(models[index].details)
            }
            .padding(.horizontal)
            
            Spacer()
            
        }
    }
}

