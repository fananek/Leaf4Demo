# Leaf 4 - demo website

Purpose of this website is to provide examples of Leaf templating engine as a complement to [official documentation](https://docs.vapor.codes/4.0/leaf/getting-started).

It's powered by [Vapor framework](https://vapor.codes) and obviously [Leaf](https://github.com/vapor/leaf). Native dark mode support is provided by tailwind.css.

![Leaf4Demo screenshot](Leaf4Demo_screenshot.png)

## [Live demo](https://leaf4demo.fly.dev)  

## Prerequisites

Leaf4Demo requires Swift 5.5 or greater. It can be run in docker container as well so you don't have to install swift on your local machine.

## How to use it?

```bash
git clone https://github.com/fananek/Leaf4Demo
cd Leaf4Demo

# OPTION 1: run directly on your machine
swift run

# OPTION 2: run in a docker container
docker-compose build
docker-compose up app
```

Open [http://localhost:8080](http://localhost:8080)

## View rendering
If you compare Leaf 4 documentation and our controller, you might notice the controller doesn't call `req.view.render("tempalte", context)` directly. It uses `req.render("template", context)` instead.

This is a workaround which provides a global context independent on a specific page context. Idea is pretty simple. [Request extension](https://github.com/fananek/Leaf4Demo/blob/master/Sources/App/Extensions/Request%2BRender.swift) wraps provided context and pass it to real renderer.

## Contribution
Any good idea, issue or pull request is welcome. :-)
