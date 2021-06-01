![](https://img.shields.io/badge/-Microverse%20projects-blueviolet)

# Ruby on Rails Backend API for <b>Favorite Quotes </b>

>The <b>Favorite Quotes</b> is an application where you can visit to get inspired by reading popular quotes from past Genius this world has encountered. You can also share your favorite inspiration either from you personally or from others.
> <br>
> The API is created with the latest industry standards using Ruby and Rails API template and `devise_token_auth` gem
> <br>
> React Frontend used for API requests: [Favorite Quotes](https://favorite-quotes.vercel.app/) <br>
> The API is tested using RSPEC.
> <br>

## App functionality

#### Current working endpoints for items

- `GET /quotes` - all items from the database.
- `GET /quotes/:id` - get items details by id.
- `POST /quotes/` - create a new item
- `POST /quotes/:id/favorite` - to favorite/unfavorite and item
- `DELETE /quotes/:id` - find the item by id and delete it from the database

#### Current working endpoints for sessions and registrations

- `POST /api/v1/auth` - Create a new user
- `POST /api/v1/auth/sign_in` - Login the user

## This web app is live, you can check it here: [Live demo](https://your-favorite-quotes-api.herokuapp.com/)

## React Frontend [live demo](https://favorite-quotes.vercel.app/)

## React Frontend [github link](https://github.com/tahiry-dev/favorite_quotes)

## Built With

- Ruby on Rails for the Backend API
- devise_token_auth for the login functionality
- Using AWS S3 with Active Storage for storing item images

## Testing

- Rspec
- Shoulda Matchers gem

## Getting Started

**To get this project set up on your local machine, follow these simple steps:**

**Step 1**<br>
Navigate through the local folder where you want to clone the repository and run
`git clone https://github.com/tahiry-dev/favorite_quotes_api.git`.<br>
**Step 2**<br>
 get inside the local folder where you cloned the repository <br>
**Step 3**<br>
Run `bundle install` to install the gems from the `Gemfile`.<br>
**Step 4**<br>
Run `yarn install` to install the npm packages from the `package.json` file.<br>
**Step 5**<br>
Run `bundle exec figaro install`, this will create a file called `application.yml` in the `config` folder.<br>
**Step 6**<br>
Open `config/application.yml` and add your credenatials for your postgres/[AWS S3](https://aws.amazon.com/console/) accounts like this (click on the above links to find out how to get a key):<br>
`PG_DATABASE_USER: example` <br>
`PG_DATABASE_PASSWORD: password`<br>
`BUCKETEER_AWS_ACCESS_KEY_ID: key`<br>
`BUCKETEER_AWS_SECRET_ACCESS_KEY: key`<br>
`BUCKETEER_AWS_REGION: key-zone`<br>
`BUCKETEER_BUCKET_NAME: key-bucket`<br>
**Step 7**<br>
Run `rails db:create` and `rails db:migrate` to create and migrate the database tabels and associations.<br>
**Step 8**<br>
Run `rails s` to start the rails server.<br>
**Step 9**<br>
You can visit the app at `http://localhost:3000`. Enjoy!<br>

## Tests

1. Open Terminal

2. Migrate the test database:

   `rails db:migrate RAILS_ENV=test`

3. Run the tests with the command:

   `rspec`

## Authors

👤 **RANDRIAMIARINTSOA Tahiry**

- Github: [tahiry_dev](https://github.com/tahiry-dev)
- Twitter: [@tahiry](https://twitter.com/Tahiry94825074)
- Linkedin: [Randriamiarintsoa](https://www.linkedin.com/in/tahiry-randriamiarintsoa/)

## 🤝 Contributing

Our favourite contributions are those that help us improve the project, whether with a contribution, an issue, or a feature request!

## Show your support

If you've read this far....give us a ⭐️!

## 📝 License

This project is licensed by Microverse and the Odin Project