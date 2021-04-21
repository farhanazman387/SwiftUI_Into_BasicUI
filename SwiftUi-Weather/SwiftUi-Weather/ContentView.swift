//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Farhana Azman on 20/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack (spacing: 10){
                
                CityTextView(cityName: "Malaysia, MY")
                
                HourlyWeatherView(imageName: "cloud.sun.fill", temperature: 30)
                
                HStack{
                    WeatherDayView(dayOfWeek: "Wed", imageName: "cloud.sun.rain.fill", temperature: 27)
                    
                    WeatherDayView(dayOfWeek: "Thu", imageName: "sun.max.fill", temperature: 38)
                    
                    WeatherDayView(dayOfWeek: "Fri", imageName: "cloud.drizzle.fill", temperature: 27)
                    
                    WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.bolt.rain.fill", temperature: 23)
                    
                    WeatherDayView(dayOfWeek: "Sun", imageName: "cloud.sun.bolt.fill", temperature: 24)
                    
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label : {
                    ChangeButton(titleBtn: "Switch Mode",
                                 textColor: .blue,
                                 backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//do this to refactor to make it more organize
//refactor out on its own file if the usage is repeatable and global
//refactor in its own ui file for unic and specific to the significant UI/screen

struct WeatherDayView: View {
    
    //declaring some parameters variable
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°c")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct BackgroundView: View {
    
//    var topColor: Color
//    var bottomColor: Color
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct HourlyWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack{
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°c")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
                .padding()
        }
        .padding(.bottom, 45)
    }
}
