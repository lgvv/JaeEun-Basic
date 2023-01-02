//
//  TempSetting.swift
//  UJeongApp
//
//  Created by Hamlit Jason on 2023/01/01.
//

//import SwiftUI
//import ComposableArchitecture
//
//struct LocationSettingView: View {
//    
//    var body: some View {
//        List {
//            Section {
//                VerticalSmileys()
//            } header: {
//                Text("First Section Header")
//            } footer: {
//                Text("Eos est eos consequatur nemo autem in qui rerum cumque consequatur natus corrupti quaerat et libero tempora.")
//            }
//        }
//        .navigationTitle("List Style")
//        .listStyle(.sidebar)
//    }
//}
//
//
//struct VerticalSmileys: View {
//    let columns = [GridItem(.flexible()),
//                   GridItem(.flexible()),
//                   GridItem(.flexible())]
//    
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach(0x1f600...0x1f679, id: \.self) { value in
//                    Text(String(format: "%x", value))
//                    Text(emoji(value))
//                        .font(.largeTitle)
//                }
//            }
//        }
//    }
//    
//    private func emoji(_ value: Int) -> String {
//        guard let scalar = UnicodeScalar(value) else { return "?" }
//        return String(Character(scalar))
//    }
//}
//
//struct TempSetting_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationSettingView()
//    }
//}
