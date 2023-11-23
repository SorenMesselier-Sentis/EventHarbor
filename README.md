# Event Harbor

![logo](https://cdn.discordapp.com/attachments/759828346128433152/1176450473558024272/eventharbor.png?ex=656ee9e2&is=655c74e2&hm=682ffa9b6b0b3e1b57352b7f402ee24c5df2de269bc65fde6b3a77009b9e5a01&)

## Description

Event Harbor is a SwiftUI-based iOS app for managing your concerts and shows. Users can add, edit, and delete shows, including details such as the band name, concert date, and additional information fetched from the Last.fm API.

## Features

- **Add New Show:** Easily add a new show by entering the band name, image URL, and concert date. Additional information about the band is automatically fetched from Last.fm.

- **Edit Show:** Modify details of existing shows, such as the band name, image URL, concert date and select a new background color.

- **Delete Show:** Remove a show from the list.

- **View Show Details:** See detailed information about a specific show, including the band bio fetched from Last.fm.

## Technologies Used

- **Swift:** The primary programming language for iOS app development.

- **SwiftUI:** The UI framework used to build the app's user interface.

- **Last.fm API:** Used to fetch additional information about bands and artists.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/ProjectA4Swift.git

## Open it
1. **Open the project in Xcode.**
2. **Build and run the app on a simulator or physical device.**

## Usage
1. **Create a folder named "Config" and a file "Config.swift" and put your API_KEY from Last.fm website to get the informations in it.**
2. **Launch the app on your iOS device.**
3. **Navigate to the "New Show" section to add a new concert.**
4. **Enter the exact band name, image URLyou want , a concert date and select a color for the background. The app will automatically fetch additional information about the band from Last.fm.**
5. **View and manage your shows in the main list.**
6. **Tap on a show to view detailed information, including the band bio, modify it or delete it.**

## Acknowledgments
- The Last.fm API for providing band information.
- [AsyncImage](https://github.com/V8tr/AsyncImage) for asynchronous image loading in SwiftUI.
