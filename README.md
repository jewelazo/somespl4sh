# Somesplash
Somesplash is a platform to share amazing photos by category with the world.
<p align="center">
  <img src="https://www.notion.so/image/https%3A%2F%2Fp-vvf5mjm.t4.n0.cdn.getcloudapp.com%2Fitems%2F7KuE2YBy%2F67f77363-9c11-4da3-bb3c-b120b78db4ef.png%3Fv%3Da9b94c013a59b9c7c47f15d165ef817d?table=block&id=5af1cc32-499b-4aae-98ff-89baaf21b75c&cache=v2">
</p>
## Demo-online
**[DEMO](https://somesplash.herokuapp.com/)**

## Getting started
1. First clone this repo with
docker container run --rm -v $(pwd):/app -v ssh:/root/.ssh codeableorg/git clone {the ssh goes here}

2. Go to the directory and create a file with the .env extension and add this format
```
GIT_USER_NAME=NameHERE
GIT_USER_EMAIL=your_github_mail@goes.here
DB_HOST=xxxx_db_1
```
The DB_HOST will be setted later when you run the #3

3. Run docker first
```
docker-compose up
```
4. On a different window run:
 ```
 docker compose exec client bash
 ```
5. Inside the bash terminal run the command:
 ```
bootstrap 
 ```
6. Go to your .env file and fill the DB_HOST variable with your db_host from step 3
7. Install all the gems with bundle install
8. Initialize your DB: rails db:create db:migrate db:seed
9. Finally you can run this command to open rails server
```
rails s -b 0.0.0.0
```
10. Go to your browser and to this site. And enjoy it
```
http://localhost:3000
```

11. If you got any problems booting the server or creating the db you can repeat from number 3 or verify the environment variables. That's it. Thanks for enjoying this app.
## Maintainers
 **[Giancarlo](https://github.com/jewelazo)**
