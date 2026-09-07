//
//  ContentView.swift
//  BetterRest
//
//  Created by Rahul Raoniar on 13/08/2026.
//
import CoreML
import SwiftUI

struct ContentView: View {

    @State private var wakeUp: Date = defaultWakeTime

    @State private var sleepAmount: Double = 8.0

    @State private var coffeeAmount: Int = 1

    static var defaultWakeTime : Date {

        var components = DateComponents()

        components.hour = 7

        components.minute = 0

        return Calendar.current.date(from: components) ?? .now

    }
    

    var body: some View {

        NavigationStack {

            Form {

                Section {

                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)

                        .labelsHidden()

                } header: {
                    Text("When do you want to wake up?")
                }
                

                Section {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)

                } header: {
                    Text("Desired amount of sleep")
                }

                Section {
                    
                    Picker("Number of cups", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { number in
                            Text(
                                number == 1 ? "1 cup": "\(number) cups"
                            )
                        }
                    }

                } header: {
                    Text("Daily coffee intake")
                }
                
                Section {
                    Text(calculateBedTime())
                        .font(.title.bold())
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundStyle(Color.blue)
                } header: {
                    Text("Your recommended sleep time is")
                        
                }
                

            }
            .navigationTitle("BetterRest")
            

        }

    }

        func calculateBedTime() -> String {

            do {

                let config = MLModelConfiguration()

                let model = try SleepCalculator(configuration: config)

                let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)

                let hour = (components.hour ?? 0) * 60 * 60

                let minute = (components.minute ?? 0) * 60

                let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

                let sleepTime = wakeUp - prediction.actualSleep

                return sleepTime.formatted(date: .omitted, time: .shortened)

            } catch {

                return "Unable to calculate your bedtime"

            }

        }

}

#Preview {

    ContentView()

}
