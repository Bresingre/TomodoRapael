//
//  AddTodoView.swift
//  TodoList
//
//  Created by vieux-melchior victor on 07/02/2024.
//
import SwiftUI

struct AddTaskView: View {
    
    @State private var title: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var category: Category = .lambda
    @State private var description: String = ""
    @State private var date: Date = Date()
    @State private var difficulty: Int = 0
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let categories: [Category] = Category.allCases
    
    var body: some View {
        VStack {
            TextField("Task name", text: $title)
                .padding()
            HStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding()
                } else {
                    Button(action: {
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = makeCoordinator()
                        imagePicker.sourceType = .photoLibrary
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Import picture (WIP)")
                            .padding()
                    }
                }
                DatePicker("", selection: $date, in: Date()..., displayedComponents: [.date])
                    .padding(.vertical)
            }
            Picker("Category", selection: $category) {
                ForEach(categories, id: \.self) { category in
                    Text(category.rawValue.capitalized).tag(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            TextField("Enter description", text: $description)
                .padding()
            HStack {
                ForEach(0..<5) { index in
                    Button(action: {
                        difficulty = index + 1
                    }) {
                        Image(systemName: index < difficulty ? "star.fill" : "star")
                            .foregroundColor(index < difficulty ? .yellow : .gray)
                    }
                }
            }
            .padding()
            Spacer()
            Button(action: {
                saveTask()
            }) {
                Text("Save")
                    .padding()
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            Spacer()
        }
        .navigationTitle("Add a task")
        .onAppear {
            NotificationManager.requestNotificationPermissions()
            NotificationManager.scheduleNotificationsForPendingTasks()
        }
    }
    
    private func saveTask() {
        guard !title.isEmpty else {
            print("Task name is required.")
            return
        }
        guard Calendar.current.isDateInToday(date) || date > Date() else {
            print("Selected date should be today or a future date.")
            return
        }
        let image = selectedImage ?? UIImage(systemName: "photo")!
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Error converting image to data.")
            return
        }
        let imageBase64 = imageData.base64EncodedString()
        taskViewModel.addItem(title: title, image: imageBase64, category: category, description: description, date: date)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTaskView()
                .environmentObject(TaskViewModel())
        }
    }
}

extension AddTaskView {
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: AddTaskView

        init(_ parent: AddTaskView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
