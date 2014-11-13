---
tags: rails, form_for, generators, sessions, full application
language: ruby
unit: rails
module: rails forms and generators
level: intermediate
resources: 7
---

# Rails Amusement Park

## Objectives

Get comfortable with using form helpers, having models interact with each other, and building out a simple sessions system.

You're going to be building an amusement park. There will be users, attractions, and users can take rides on attractions.

## Instructions

**This lab does not cover validations so please do not use them. If you do, you're tests will break.**

* Check out [The Demo](http://amusement-park.herokuapp.com/) to see where this lab is headed.
* <em>Before anything</em>, note that when you generate models, controllers, etc, be sure to include this option, so that it skips tests (which are already included in the lab): `--no-test-framework`
* This is a test driven lab, check out the model tests and get those to pass before moving onto the feature specs.
* Remember, if you use scaffolds or generators to <em>not</em> overwrite the model specs that are included in this lab. Always enter `n` or `no` when prompted to overwrite the model specs for this lab.

## Resources

* [Rails Generators](http://guides.rubyonrails.org/generators.html)
* [Form Helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)
* [Form Helpers Guide](http://guides.rubyonrails.org/form_helpers.html)
* [Collection Select](http://stackoverflow.com/questions/8907867/can-someone-explain-collection-select-to-me-in-clear-simple-terms)
* Rails 4 Way
  * [Chapter 11: Sections on Form Helpers and Form Tags](http://beta-library.herokuapp.com/books/the-rails-4-way#page=356)
  * [Chapter 13: Session Management](http://beta-library.herokuapp.com/books/the-rails-4-way#page=445)
* [Sessions in Rails](http://guides.rubyonrails.org/security.html#sessions)
>>>>>>> master
