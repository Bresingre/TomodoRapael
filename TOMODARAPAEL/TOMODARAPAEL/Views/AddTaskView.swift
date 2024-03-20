//
//  AddTodoView.swift
//  TodoList
//
//  Created by vieux-melchior victor on 07/02/2024.
//
import SwiftUI

struct AddTaskView: View {
    
    @State var title: String = ""
    @State var selectedImage: UIImage?
    @State var category: Category = .lambda
    @State var description: String = ""
    @State  var date: Date = Date()
    @State private var difficulty: Int = 0
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    @Environment(\.presentationMode) var presentationMode
    
    let categories: [Category] = Category.allCases
    
    init() {}
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    saveTask()
                }) {
                    Text("Save")
                        .padding()
                }
            }
            TextField("Task name", text: $title)
                .padding()
            HStack{
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
                    }) {
                        Text("Import picture")
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
        }
        .navigationTitle("Add a task")
    }
    
    private func saveTask() {
        let image = selectedImage ?? UIImage(systemName: "photo")!
        let imageData = image.jpegData(compressionQuality: 0.5)
        let imageBase64 = imageData?.base64EncodedString() ?? ""
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
