# Ora-Chat

This project was done as a code challenge for Ora Interactive. All required features have been implemented, with additional extras. Those features are as follows:

## Features
- Login
- Register
- View list of chats
- Create new chat
- View list of messages in chat
- Create new message
- Read Profile
- Update Profile
- Search chats by name

### Additional Features
- Testable network layer that follows the single responsibility principle. Each type has one duty. For example, a request, which encompases all data needed for a HTTP request, is a seperate type from the parser, which parses the JSON that is returned from the server.
- Tests for endpoints that sends in mock dispatcher objects.
- Tests for some view controllers.
- Resizable chat bubbles that resize horizontally and vertically. All done in code to exemplify understanding of the view hierarchy.
- Search in the navigation bar.
