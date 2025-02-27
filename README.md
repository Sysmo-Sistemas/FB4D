# FB4D – The OpenSource Cross-Platform Library for _Firebase_

The _Google Firebase Cloud Database_ is used in many mobile and web applications worldwide and there are well-documented libraries for many languages and platforms. For Delphi, the cross-platform library **FB4D** supports the _Firebase Realtime Database_, the _Firestore Database_, the _Firebase Storage_ (for file storage), and _Firebase Functions_ (for calling server functions). For authentication, **FB4D** currently supports email/password authentication and anonymous login. 

The library builds on the _Firebase REST-API_ and provides all functionality with synchronous and asynchronous methods for the usage within GUI application, services and background threads. Both frameworks _VCL_ and _Firemonkey_ are supported. The library is a pure source code library and relies on class interfaces. For clean and short application code it supports fluent interface design.

### Wiki

This project offers a [wiki](https://github.com/SchneiderInfosystems/FB4D/wiki). Four example applications and a [Getting-Started](https://github.com/SchneiderInfosystems/FB4D/wiki/Getting-Started-with-FB4D) on the wiki will help you to start working with the library. For more detailed questions, the [interface reference](https://github.com/SchneiderInfosystems/FB4D/wiki/FB4D-Interface-Reference) will provide the answers you need.

You can find more learning videos on the following [YouTube channel](https://www.youtube.com/channel/UC3qSIUzdGqoZA8hcA31X0Og).

### Major Change log

This log informs about interface changes and important library enhancements that need the attention of users of this library.

- October 2021: Prepared for Delphi Alexandria
- April 7, 2021: Revised RT DB Listener
- March 2021: New optional cache to accelerate the repeated access to storage objects. Additional _IFirebaseStorage.GetAndDownload_ method in order to simplify the download from the storage. [See more details](https://github.com/SchneiderInfosystems/FB4D/wiki/FB4D-Reference-IFirebaseStorage#optional-cache-for-storage-objects)  
New option in _FB4D.SelfRegistrationFra_ framework to support enter display name and upload profile image when registering a new user. [see more details](https://github.com/SchneiderInfosystems/FB4D/wiki/Self-Registration-Workflow#optional-user-profile-image)  
Real Time Database creation has changed within the Firebase Console. The Firebase ID is no longer sufficient to access newly created RT DBs. A Firebase URL is now required, which can also include the server location. [See more details](https://github.com/SchneiderInfosystems/FB4D/wiki/FB4D-Reference-IRealTimeDB#create-an-instance-for-the-interface-irealtimedb).  
A new listener detects changes within the Firestore Database without pooling. [See more details](https://github.com/SchneiderInfosystems/FB4D/wiki/FB4D-Reference-IFirestoreDatabase#firestore-listener).

### Prerequisites

🔺 This library requires at least **Delphi 10.3 Rio Update 2** 🔺. 

The sample projects are developed and prepared for **Delphi 11.0 Alexandria**.

#### Hint: Support from Delphi 10 Seattle to Delphi 10.2 Tokyo has been discontinued since the introduction of the Firestore Listener in March 2021. Delphi 10.3 Update 1 and earlier version are no longer supported because of an issue in the RTL. 

Delphi is a registered trademark of [Embarcadero Technologies, Inc](https://www.embarcadero.com/de/products/delphi).

### Supported Platforms

**FB4D** is developed in pure object pascal and can be used with _Firemonkey_ on all supported platforms. The library and its sample projects are currently tested with Win64/Win32, Mac64/32, Linux64 by using FMXLinux, iOS64 and Android. (Hint to mobile platforms: The TokenJWT to perform the token verification requires the installation of the OpenSSL libraries). For more information about using OpenSSL see the [installation of OpenSSL](https://github.com/SchneiderInfosystems/FB4D/wiki/Getting-Started-with-FB4D#install-openssl)

#### Limitation on Linux64

There are no restrictions when using Delphi 11 Alexandria.

For older versions up to 10.4.2, you must note the following RSP: Due to a bug in the Linux RTL, all HTTP requests that transfer data to the server by using the _Patch_ method are currently not working. _Put_ and _Post_ methods work. This affects the Realtime DB method _Patch_ and the Firestore method _InsertOrUpdateDocument_ for both synchronous and asynchronous accesses. [For more information see RSP-33177](https://quality.embarcadero.com/browse/RSP-33177).

### Submodules

For authorization token verification and token content extraction this library uses the Delphi JOSE JWT library. Thank you, Paolo Rossi for your great library!

https://github.com/paolo-rossi/delphi-jose-jwt

![Logo FB4D](https://github.com/SchneiderInfosystems/FB4D/wiki/logoFB4D.png)
