[![Lines of Code - app directory](http://img.shields.io/badge/lines_of_code-203-brightgreen.svg?style=flat)](http://blog.codinghorror.com/the-best-code-is-no-code-at-all/)
[![Maintainability](https://api.codeclimate.com/v1/badges/29a9696b3c2a1fb6d4fb/maintainability)](https://codeclimate.com/github/hopsoft/stimulus_todomvc/maintainability)

# Stimulus TodoMVC

An implementation of [TodoMVC](http://todomvc.com) using
[Ruby on Rails](https://rubyonrails.org) and [StimulusJS](https://stimulusjs.org).

Expands on the original goals of [TodoMVC](http://todomvc.com) by providing a full application...
including a server and database.

## Demo

https://stimulus-todomvc.herokuapp.com

_You may notice some latency related to hosting on **free tier** services._

## Why

Many developers are unaware that it's possible to build responsive _"modern"_
[Single Page Applications (SPAs)](https://en.wikipedia.org/wiki/Single-page_application) with default Rails tooling.

The user experience may not strictly match what's promised by [pure JavaScript solutions](http://todomvc.com),
but it is __good enough__ for the vast majority of use cases.
_Especially when you consider the deveopment, deployment, operating, and maintenance costs._

## Local Setup

1. Install dependencies

    - [Ruby](https://www.ruby-lang.org/en/downloads/)
    - [Yarn](https://yarnpkg.com/lang/en/docs/install/#mac-stable)
    - [PostgreSQL](https://www.postgresql.org/download/)

1. Clone the repo

    ```sh
    git clone https://github.com/hopsoft/stimulus_odomvc.git
    ```

1. Switch into the project folder

    ```sh
    cd stimulus_todomvc
    ```

1.  Run the setup command

    ```sh
    bin/setup
    ```

1. Start the rails server

    ```sh
    bin/rails server
    ```

1. See the app in action

    To see the application in action, open a browser window and navigate to http://localhost:3000. That's it!

## Next Steps

If you find this approach lacking, consider giving [StimulusReflex](https://github.com/hopsoft/stimulus_reflex)
a try before reaching for a complex JavaScript framework.
