//
//  AddTodoView.swift
//  TodoList
//
//  Created by vieux-melchior victor on 07/02/2024.
//
import SwiftUI

struct AddTaskView: View {
    
    @State var title: String
    @State var image: String
    @State var category: Category
    @State var description: String
    @State var date: Date
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter a task", text: $title)
                .padding(.horizontal)
                .frame(height: 55)
                .background(Color(.systemGray5))
                .cornerRadius(10)
            
            //ImagePickerView(image: $image)
            
            //CategoryPickerView(category: $category)
            
            // Description Text Field
            TextEditor(text: $description)
                .frame(height: 100)
                .padding(.horizontal)
                .background(Color(.systemGray5))
                .cornerRadius(10)
            
            // Date Picker
            DatePicker("Select date", selection: $date, in: Date()..., displayedComponents: [.date])
                .padding(.horizontal)
                .background(Color(.systemGray5))
                .cornerRadius(10)
            
            Button {
                taskViewModel.addItem(title: title, image: image, category: category, description: description, date: date)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding(16)
        .navigationTitle("Add a task")
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddTaskView(title: "faire un café", image: "", category: .relax, description: "je vais me faire un très bon café", date: Date())
        }
    }
}



/*
 at the top left there is a close button
 at the top right, there is a save button
 below there is a HStack
    in this h stack there is a picture on the left
    on the right there is a vstack
        at the top of the vstack there is an input for the date
        below there is a textfield for the name
        below there is a selector for the category
 below the hstack there is a textfield for the description
 below
 
 
 */
