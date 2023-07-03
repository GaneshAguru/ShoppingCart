//
//  FeedbackScreen.swift
//  Shopping Cart
//
//  Created by Aguru, Ganesh (Contractor) on 15/06/23.
//

import SwiftUI

struct FeedbackScreen: View {
    
    @State var rating : Int
    @State var feedback : String
    @State private var showAlert = false
    
    var label = ""
    var maxRating = 5
    var offImage:Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        
        NavigationView {
            
            
            ZStack{
                Color.cyan.ignoresSafeArea()
                VStack{
                    Text("Rate now")
                        .foregroundColor(.indigo)
                        .font(.title)
                    HStack{
//                        if label.isEmpty == false{
//                            Text(label)
//                        }
                        ForEach(1...maxRating, id:\.self){number in
                            image(for: number)
                                .foregroundColor(number>rating ? offColor:onColor)
                                .onTapGesture {
                                    rating = number
                                }
                            
                        }
                    }.padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
                    
                    TextField("please provide the feedback!", text: $feedback)
                    
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.white,lineWidth: 1))
                        .frame(minHeight: 100)
                        .lineLimit(nil)
                        .foregroundColor(.white)
                    Button {
                        print("Feedback Submitted")
                        print(feedback)
                        print(rating)
                        showAlert = true
                        feedback = ""
                       
                    } label: {
                        Text("Submit")
                            .font(.title)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }.alert("Feedback submitted successfully with \(rating) star rating", isPresented: $showAlert) {
                        Button("Thank You",role: .destructive){}
                    }

                }
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 400, trailing: 20))
            }
           
    
        }.navigationBarTitle("Rate Us")
            .navigationViewStyle(.stack)
            
        
    }
    
    func image(for number: Int)->Image{
        if number > rating{
            return offImage ?? onImage
        }else{
            return onImage
        }
    }
}

struct FeedbackScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackScreen(rating: 4, feedback: "")
    }
}
