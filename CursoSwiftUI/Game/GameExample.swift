//
//  GameExample.swift
//  CursoSwiftUI
//
//  Created by 1058889 on 17/07/23.
//


//// Supports Live Activities

import SwiftUI
import ActivityKit

enum ErrorGame: Error {
    case failedToGetId
}

final class viewModelGame: ObservableObject {

    @Published var data: [GameEntity] = []
    private var spintCount: Int = 0

    func spin() {
        spintCount += 1
        data.append(GameEntity(num1: getNumber(),
                               num2: getNumber(),
                               num3: getNumber(),
                               spin: spintCount,
                               image: Image(systemName: "heart.slash")))
    }

    func getNumber() -> Int {
        Int.random(in: 1...100)
    }

    func startActivity(timeMinutes: Int) throws -> String {
        var activity: Activity<myGameAttributes>?
        let initActivity = ActivityContent(state: myGameAttributes.ContentState(value: timeMinutes), staleDate: .now + 36000)

        do {
            activity = try Activity.request(attributes: myGameAttributes(), content: initActivity, pushType: nil)
            guard let id = activity?.id else { throw
                ErrorGame.failedToGetId
            }

            return id
        } catch {
            throw error
        }
    }

    func stop(idActivity: String) async {
        let value = Activity<myGameAttributes>.activities.first(where: {
            $0.id == idActivity
        })

        await value?.end(nil)
    }
}

struct GameExample: View {

    @State var coins: Int = 2
    @StateObject var viewModel: viewModelGame = viewModelGame()
    @State var error: Bool = false
    @State var activity: String = ""

    var body: some View {
        VStack {
            TitleView(coins: $coins)
            Spacer()
            GameNumber(viewModel: viewModel)
            CoinsView(coins: $coins)
            ButtonSpin(viewModel: viewModel, coins: $coins, error: $error)
            Divider()
            TitleTableGame()
            TableGame(viewModel: viewModel)
            Button("No quiero monedas gratis", action: {
                stop()
            })
        }.task {
            do {
                activity = try viewModel.startActivity(timeMinutes: 8)
            } catch {
                print("Error")
            }
        }
    }

    private func stop() {
        Task {
            await viewModel.stop(idActivity: activity)
        }
    }
}

struct TitleView: View {
    @Binding var coins: Int

    var body: some View {
        VStack {
            HStack {
                Text("My game")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .padding(10)

                Button(action: {
                    coins += 1
                }, label: {
                    Text("Agregar")
                })
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: -90))
            }
        }
    }
}

struct GameExample_Previews: PreviewProvider {
    static var previews: some View {
        GameExample()
    }
}

struct GameNumber: View {
    @ObservedObject var viewModel: viewModelGame
    var body: some View {
        HStack {

            if !viewModel.data.isEmpty {
                HStack {
                    Text("\(viewModel.data[viewModel.data.count - 1].num1)")
                        .padding()
                    Spacer()
                    Divider()
                    Text("\(viewModel.data[viewModel.data.count - 1].num2)")
                        .padding()
                    Spacer()
                    Divider()
                    Text("\(viewModel.data[viewModel.data.count - 1].num3)")
                        .padding()
                    Spacer()
                    Divider()
                    viewModel.data[viewModel.data.count - 1].image
                }
                Spacer()
            } else {
                Text("Número 1")
                    .padding()
                Spacer()
                Divider()
                Text("Número 2")
                    .padding()
                Spacer()
                Divider()
                Text("Número 3")
                    .padding()
                Spacer()
            }

        }
    }
}

struct CoinsView: View {

    @Binding var coins: Int

    var body: some View {
        HStack {
            Spacer()
            Text("Coins \(coins)")
                .padding(20)
                .font(.system(size: 20))
        }
    }
}


struct ButtonSpin: View {

    @ObservedObject var viewModel: viewModelGame
    @Binding var coins: Int
    @Binding var error: Bool

    var body: some View {
        Button(action: {
            if coins > 0 {
                viewModel.spin()
                coins -= 1
            } else {
                error = true
            }
        }, label: {
            Text("Girar")
                .modifier(myTextButton())
        })
        .modifier(myButton())
        .alert("Inserte más monedas", isPresented: $error, actions: { })
    }
}

struct TitleTableGame: View {

    var body: some View {
        Text("Últimos resultados")
            .font(.system(size: 15, weight: .bold))
    }
}

struct TableGame: View {

    @ObservedObject var viewModel: viewModelGame

    var body: some View {
        List {
                ForEach(viewModel.data, id: \.spin) { element in
                    HStack {
                        Text("\(element.num1)")
                            .padding()
                        Spacer()
                        Divider()
                        Text("\(element.num2)")
                            .padding()
                        Spacer()
                        Divider()
                        Text("\(element.num3)")
                            .padding()
                        Spacer()
                        Divider()
                        element.image
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    }
            }
        }
    }
}


// mover coins al viewModel
// agregar un boton a la alerta de agregar coin


//ATRIBUTOS
struct myGameAttributes: ActivityAttributes {

    public struct ContentState : Codable, Hashable {
        var value: Int
    }
    
}
