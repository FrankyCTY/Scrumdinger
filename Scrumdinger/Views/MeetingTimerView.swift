//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Chan Tak Yu on 27/04/23.
//

import SwiftUI

struct MeetingTimerView: View {
    var speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
    var theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: {!$0.isCompleted})?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static let speakers: [ScrumTimer.Speaker] = [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    
    
    static var previews: some View {
        NavigationStack {
            MeetingTimerView(speakers: Self.speakers, isRecording: true, theme: .yellow)
        }
    }
}
