# Hotline
## SMS-based Delivery Service Platform
![](logo-hg.png)

### Introduction

Hotline is an innovative platform for order processing, specifically designed for delivery-centric businesses. This platform capitalizes on the prevalent trend of anonymous text messaging to facilitate an efficient delivery service for a wide range of products - from bento boxes and flowers to cookies and candy. Hotline provides an accessible means for entrepreneurs to establish the requisite infrastructure for a beta or a Minimum Viable Product (MVP) using solely text messaging. 

Additionally, Hotline supports a closed-beta model, facilitating referral-based order placements. It obviates the need for creating a separate website or managing a payment processing system. 

### Privacy First

The core functionality of Hotline resides in its ability to allow interaction between users and admins through the Twilio number, thereby eliminating the need for direct exposure of personal mobile numbers. Admins are provided with the power to erase all records with a single command, offering them the flexibility to close their market validation and erase all associated data when required. This feature emphasizes privacy as it prevents delivery personnel from accessing sensitive user data including addresses and phone numbers.

### How It Works

The workings of Hotline can be best understood through a practical example, let's consider three actors: an admin, a potential user, and an existing user.

#### Existing User Commands

- `get referral`: Returns a referral code that can be shared with others.
- `5 cookies to 1 Wacker Dr`: Sends your order and the delivery address to an admin. The admin would receive a message similar to `Order #19  5 cookies to 1 Wacker Dr`.
- `remove me` (Under development): Removes the user and their records from the system.

#### New User Commands

- `referral <referral code>`: Consumes a referral code. If the code is valid, you will be notified of your admittance status.

#### Admin Commands

- `nuke all` (Under development): Erases all data from the system.
- `get referral`: Generates a referral code that will admit the user who uses it.
- `close`: Ceases the admin's business operations.
- `open`: Resumes the admin's business operations.
- `reply #9 I'm here`: Responds to the user who submitted order #9 with the message "I'm here".

### Configuration

Currently, all configuration is handled in `app/models/user/settings.rb`. Here, you can set:
- The number of referrals required for admittance (including 0 for public beta).
- A cap on the number of referrals a user can create within a specified number of days.
- The specific number of days.

### Project Status

Please note that as of now, the project lacks tests and views. Additionally, the configuration options are minimal. However, we consider this a solid start and a foundation for future development.

### Getting Started Locally

1. Clone this repository.
2. Run `bundle install`.
3. Migrate and seed the database.
4. Add necessary configuration details into a `.env` file (more details will follow).
5. Run `foreman start`.

### Production Deployment

1. Sign up for a Twilio account (and get a free number) and create a Heroku account.
2. Set the webhook for your SMS number in Twilio to your Heroku URL, e.g., my.hotline.nyc/communication/receive.
3. Add the necessary Twilio configuration to a `.env` file. Refer to `.env.example` for the list of necessary data.
4. From the command line, create a Heroku app with `heroku create`.
5. Install the configuration pusher using `heroku plugins:install git://github.com/ddollar/heroku-config.git`.
6. Push the configuration to Heroku using `heroku config:push`.
7. Push the project to Heroku using `git push heroku master`.
8. Migrate the database using `heroku run rake db:migrate`.
9. Send "get referral" from your phone to the Twilio number to become an admin.
