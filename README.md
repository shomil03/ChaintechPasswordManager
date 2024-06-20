# Password Manager

This is a Swift-based iOS application designed to securely manage user credentials using RSA encryption and Keychain services.

## Features

- Securely store and manage user credentials.
- RSA encryption for passwords.
- Utilizes Keychain for secure storage of encryption keys.
- Edit and delete credentials.
- User-friendly interface.

## Installation

### Prerequisites

- Xcode
- Swift 5.0+
- CocoaPods or Swift Package Manager (SPM)

### Steps

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/ChaintechPasswordManager.git
    cd ChaintechPasswordManager
    ```

2. Install dependencies using CocoaPods or SPM.

#### Using Swift Package Manager (SPM)

- Open your project in Xcode.
- Go to `File` > `Add Packages...`.
- Enter the URLs for the dependencies:
  - SwiftyRSA: `https://github.com/TakeScoop/SwiftyRSA`
  - KeychainAccess: `https://github.com/kishikawakatsumi/KeychainAccess`
- Select the latest version and add the packages.

### Using CocoaPods

- Create a `Podfile` in the root directory of your project and add the following lines:

    ```ruby
    platform :ios, '17.0'
    use_frameworks!

    target 'ChaintechPasswordManager' do
      pod 'SwiftyRSA', '~> 1.6'
      pod 'KeychainAccess', '~> 4.2'
    end
    ```

- Install the dependencies:

    ```sh
    pod install
    ```

- Open the generated `.xcworkspace` file in Xcode.

## Usage

1. Open the project in Xcode.
2. Run the project on the iOS simulator or a physical device.
3. Use the application to add, edit, and delete credentials.

