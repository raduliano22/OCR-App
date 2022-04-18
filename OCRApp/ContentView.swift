//
//  ContentView.swift
//  OCRApp
//
//  Created by Octav Radulian on 18.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if texts.count > 0 {
                    List {
                        ForEach(texts) { text in
                            NavigationLink {
                                ScrollView{
                                    Text(text.content)
                                }
                            } label: {
                                Text(text.content).lineLimit(1)
                            }
                            
                        }
                    }
                    
                }
                else {
                    Text("No scan yet.")
                        .font(.title)
                }
                
            }.navigationTitle("Scan OCR")
                .navigationBarItems( trailing: Button(action: {
                    //scan
                    self.showScannerSheet.toggle()
                }, label: {
                    Image(systemName: "doc.text.viewfinder")
                        .font(.title)
                }).sheet(isPresented: $showScannerSheet, content: {
                    makeScannerView()
                }))
            
        }
        
    }
    
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outPutText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outPutText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
