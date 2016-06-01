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

Let's use [HTTPIE](https://github.com/jkbrzt/httpie) to populate a local server using the command line. The output to all the commands below should be formatted in JSON, since we're using the `--j` flag:

* create a competency called "Juggling": `http --j POST :3000/competencies name=Juggling`
* did it work? let's get all the competencies created so far: `http --j GET :3000/competencies`
  * you should see one JSON object with id = 1
* oops, meant to call it "Can Juggle" instead: `http --j PUT :3000/competencies/1 name="Can Juggle`
* If you want to add subtopics to a competency, try `http --j PUT :3000/competencies/1 competency:='{"subtopic_ids":["2", "9", "4"]}'`

See our competency controller specs for more complex examples.
