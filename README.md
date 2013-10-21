Epatomic is a portfolio site for programmers. Users can share the coding projects of which they are proud. Code can be loaded manuall or from GitHub.

Developers: Douglas Mill (@dmill), Srinivas Rao (@raorao), Dave Markowitz (@artfoundry)

Minimum Viable Product:
-> User can login with GitHub account
-> User can display projects on public page
-> User can choose which projects to display
-> User can load projects from GitHub
-> User can add basic profile information (email, name, link to GitHub account)
-> User page is persistent
-> Site up on Heroku

Site available at: epatomic.herokuapp.com

Current SMURF:
-> User can save code for a particular project
-> User can display code for a particular project in markup language
-> Project page has a clean and modular layout

### Developer Setup:
* Bundle gems

```bash
$ bundle
```

* Initialize the database

```bash
$ rake db:create
$ rake db:migrate
```

* Create .env file to store API information

```bash
$ touch .env.development
```
    APP_ID=your_id
    APP_SECRET=your_secret

Your app ID and secret can be generated [on Github](https://github.com/settings/applications/)
*Set callback to http://localhost:3000/
* Seed database

```bash
$ rake db:seed
```
* Start Rails

```bash
$ rails server
```

### Tests:
* Setup the test environment:

```bash
$ rake db:test:prepare
```

* Run the tests:

```bash
$ rspec
```
