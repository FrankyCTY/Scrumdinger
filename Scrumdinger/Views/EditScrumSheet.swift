//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Chan Tak Yu on 26/04/23.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var editingScrum: DailyScrum
    @Binding var isEditingScrum: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(editingScrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isEditingScrum = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isEditingScrum = false
                        }
                    }
                }
        }
    }
}

struct EditScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            EditScrumSheet(editingScrum: .constant(DailyScrum.emptyScrum), isEditingScrum: .constant(true))
        }
    }
}
