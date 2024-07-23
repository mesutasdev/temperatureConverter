//
//  ContentView.swift
//  sicaklikcevirici
//
//  Created by Mesut As Developer on 7.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var fahrenheitValue: String = ""
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
   
    
    
    func converToCelsius() -> String {
        if let value = Double(fahrenheitValue){
            
            let fahrenheit = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
            
            let celsiusValue = fahrenheit .converted(to: .celsius)
            return numberFormatter.string(from: NSNumber(value: celsiusValue.value)) ?? "Result"
            
        }else{
            return "Result"
        }
    }
    
    
    var body: some View {
        VStack {
            TextField("Enter Value", text: $fahrenheitValue)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .font(Font.system(size: 47))
                .multilineTextAlignment(.center)
                .padding()
            Text("Fahrenheit\nis actually")
                .padding()
                .foregroundColor(.blue)
            Text(converToCelsius())
                .font(Font.system(size: 47))
            Text("Degress Celcius!")
            Spacer()
            
            Text("Youtube Chanel @mesutasdev")
                .font(.footnote)
                .foregroundColor(.black)
            Spacer()
            
        }.foregroundColor(.orange)
        .font(.title)
        .padding()
    }
}

#Preview {
    ContentView()
}
