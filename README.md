# Ruby on Rails: simple blog

This is blog. You can use it there 
[https://my-rails-blog.herokuapp.com/](https://my-rails-blog.herokuapp.com/)
or you can use it on your local machine. For running app on your local machine you need
to have [PostgeSQL installed](https://help.ubuntu.com/community/PostgreSQL). 
Then

	$ cd ~/workspace
    $ git clone https://github.com/data-plum/blog_on_rails
    $ cd blog_on_rails
    $ cp config/database.yml.example config/database.yml
    $ bundle install
    $ bundle exec rake db:setup
    $ rspec
    $ rails server

You can sign in as admin user:
email - example@railstutorial.org,
password - foobar.

Admin can delete other users. 
