# Purpose [![Build Status](https://travis-ci.org/DerekStride/competency-tracker.svg?branch=master)](https://travis-ci.org/DerekStride/competency-tracker)

A RESTful service to make it easy for employees to track their *competencies* as well as others’. Useful for tracking learning (technical, managerial, etc.) as well as finding experts (e.g., for code review). *Mastery levels* can be specified for each competency and employee, and could follow a simplified version of [Bloom’s taxonomy](https://en.wikipedia.org/wiki/Bloom%27s_taxonomy) (or any other custom one); they get acquired via *learning sources* and assessed by *assessors* (team lead, peer, in-house instructor, etc.).

Competencies can be organized in hierarchies (think: area, subarea, etc.). At the leaf level, they can be used to express *learning outcomes*.

One can also express *prerequisites* between competencies.

Ideally would connect to existing tools (HR/employee list) or even be simply an extension thereof.

# Current status and roadmap

- [x] provide a Model for competencies (as per the short description above);
- [x] a REST API for CRUD
- [x] Google OAUTH for user authentication
- [ ] generate custom competency map of prerequisites, with links to the relevant employees, teams, learning material, etc.;
- [x] scripts to upload competencies from various sources, mostly spreadsheets in various forms;
- [ ] a front-end to visualize and track progress, to assess, to navigate, etc.

# Howto

This is your typical rails app. Clone it, then run rails server. Alternately, deploy on Heroku.

Using [HTTPIE](https://github.com/jkbrzt/httpie), with a local server you can create a basic competency like so:

`http PUT :3000/competencies/1.json name=Juggling`

See our competency controller specs for more complex examples.
