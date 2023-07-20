//
//  myGameIslandLiveActivity.swift
//  myGameIsland
//
//  Created by 1058889 on 19/07/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct myGameIslandAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct myGameIslandLiveActivity: Widget {
    // escuchara a ->>>>>>>>> myGameAttribute
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: myGameAttributes.self) { context in
//            widgetViewGame()
            widgetViewGameTwo(minutes: context.state.value)

            /*// Lock screen/banner UI goes here
            VStack {
//                Text("Hello")
                Text("Este texto se verá cuando se bloquee")
                Image(systemName: "pencil")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)*/

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        Image(systemName: "gamecontroller")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.green)
                    }
                    .padding(.horizontal, 4)
                    .padding(.vertical, 3)
                    .cornerRadius(4)
                    .backgroundStyle(.blue)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.yellow)
                        .backgroundStyle(.blue)
                }
                DynamicIslandExpandedRegion(.bottom) {
//                    Text("Bottom")
//                    Text("Faltan \(context.state.value) minutos para vidas gratis")
                    widgetViewGame(minutes: context.state.value)
                    // more content
                }
            } compactLeading: {
//                Text("L")
                Image(systemName: "iphone")
            } compactTrailing: {
                Text("T")
            } minimal: {
//                Text("Min")
                Image(systemName: "folder") // cuando es minimalista
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct myGameIslandLiveActivity_Previews: PreviewProvider {
    static let attributes = myGameIslandAttributes(name: "Me")
    static let contentState = myGameIslandAttributes.ContentState(value: 3)

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}


struct widgetViewGame: View {
    var minutes: Int = 0
    var body: some View {
        VStack {
            Text("\(minutes) minutos para monedas gratis")
            LinearGradient(colors: [.green, .blue], startPoint: .leading, endPoint: .trailing)
                .frame(height: 5)
        }
    }
}


struct widgetViewGameTwo: View {
    var minutes: Int = 0
    var body: some View {
        VStack {
            widgetViewGame(minutes: minutes)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .cornerRadius(2)
        }
    }
}
