# Face · U (QHacks 2020)

## Overview
**Name**: Face · U  
**Platform**: iOS

## Team Members
1. **Jiwoo Lee** - McMaster University · CS | App dev - Full stack
2. **Cynthia Liu** - McMaster University · CS | App dev - Front end, UI Design
3. **Alex Jung** - Queen's University · Engineering | Web dev
4. **Kevin Lei** - Queen's University · Business | Web dev

## Description 
Face · U is an iOS App that uses Vision Framework and a variety of CoreML models to implement machine learning analysis on people's faces. 

## Demo
![](FaceU.gif)

## How to Run Project
1. Clone the repo
2. Download and add the following CoreML models: CNNEmotions, GenderNet, AgeNet, Resnet50 and copy it to project directory


## Inspiration
Techonological developments powered by AI/Machine Learning techniques have resulted in increasing trend in face recognition systems worldwide to promote safe/reliable security systems, as well as growing social impacts. As our first iOS/Machine learning project, we wanted to tackle how we can implement a face recognition technology in a way that it will provide informations about individual's health and wellness through analyzing their emotions, stress-level, facial-age, etc... 

## Features and Implementations
1. We used **Swift** and **XCode** to develop Face · U that works on both iPhones and iPad 
2. Upon launching the app, the user is asked to **authenticate** oneself by either signing into a new account, or logging into an existing account. The authentication is done through **Firebase Cloud Firesotre** database.
3. After authenticated, the user is brought to a page where they can either select "Analyze" or "My Analytics"
4. If the user selects **Analyze** button, he/she is brought to a page where they could choose a photo in one of the following three ways: **camera**, **photo library**, and **saved albums**. 
5. If the user selects camera, the app opens the iPhone camera to take a picture of himself/herself or others. Then, once you press "Use Photo" button, the image is shown on the image view of the screen. Then, the app traces and extracts information of the person's face using the **Vision** framework. There are switches called **Rect** and **Face** above, which draws a rectangle around a person's face, and draws face landmark on top of the person's face on the image. 
6. When the user presses "Analyze" button, the system checks if that photo is indeed a person's face by using **Resnet50 CoreML model**, which is a Residual Neural Network that will classify the dominant object in a camera frame or image. Once the image is verified as a person's face, and the user presses "Analyze" button, the app navigates to another page where it provides information collected about that person's face using the following CoreML models:  
    1. **CNNEmotions**: An emotion recognition model using Convolutional Neural Networks and Mapped Binary Patterns
    2. **GenderNet**: Predicts one's gender from portrait with Convolutional Neural Networks (this implementation was rather done for fun, since we can't really analyze one's health/wellness by predicting gender)
    3. **AgeNet**: Predict one's age using face recognition again using Convolutional Neural Networks.
7. On the screen, the app displays its findings through these machine learning analysis, and this information gets posted to the Firestore cloud database for further analysis.
8. The user can either go back and press "My Analytics" button, or there's an option to go directly from the current page by another button
9. When the user reaches "My Analytics" screen, he/she can learn how his/her wellness has been, by taking into account the different emotions the ML model has discovered. For now, we implemented a piechart of the history of the user's emotions, using the **Charts** library downloaded via Cocoapods
10. These information, along with more on the database itself, can be applied in a wide variety of settings such as companies/school/organization to manage employee wellness and satisfaction, a personal wellness blog, or even as analyzing hacker satisfaction at QHacks 2020 this weekend.
11. All of our UI Design was handmade, using Photoshop and touchpads. Special creds to Cynthia for making our app look visually pleasing.

## Challenges We Ran Into
Two members of our team -- Jiwoo and Cynthia-- had already planned to work on an iOS app for this hackathon in the hope of learning new technology and using modern frameworks on it. The method of implementation our team chose -- Swift and Xcode -- could only be run on a macOS computer. Alex and Kevin unfortunately had Window computers, and tried methods like downloading a Virtual Machine to run Xcode on, but we ran into difficulties installing and running the VM properly on the computers. We ended up having to split roles, and one of the mentors here suggested that they could host a website that could connect to our Firebase Database and display information about the app and our analysis. Another problem we ran into was that it was technically our first time building an iOS app in Swift. Adding onto that, none of us had prior experience in Machine Learning so we had initial difficulties trying to grasp the ML mechanism and how we can integrate that with the Vision Framework.

## Accomplishments That We Are Proud Of
We are proud that we have successfully made an (almost) perfectly functioning first iOS application. On top of that we are proud that we took on the challenge to push ourselves to experiment with modern technologies/ machine learning techniques, and taking into account the fact that we had no prior experience, we're quite proud of the outcome, and how much we learned and developed as programmers in this hackathon.

## Known Bugs/Problems
The Resnet50 CoreML model cannot perfectly detect a human face so the app might pass the image even if it's not a human portrait. Also, sometimes there seems to be a lag between transitioning from SelectionViewController to MainViewController.

## What's next for Face · U ?
Unfortunately we spent too much time trying to figure out what's happening behind the scenes of the machine learning component of our application that we don't have a marketable application that could be used in wide variety of industires. However, using this project as a basis, we can now develop virtally any application that requires analysis on face recognition, and this can span from aiding the blind to notify them of other's emotions to a tracking system of individual wellness. We're looking forward to come back to this project after the hackathon to implement possibly more ML models, and create more functions based database analysis so that our project can become both useful and marketable product.
