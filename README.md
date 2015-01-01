cms_admin
==========

<img src="http://placehold.it/350x150" />

Rails 4 / Twitter Bootstrap 3 CMS. Pages, posts, images, users and public users.


### Default Credentials


  User: admin@example.com
  Pass: password


### Introduction


CMS_Admin is a simple approach to content management. The system revolves around Pages and Posts; each Page can have many Posts. You can either extend the Posts to fit your need or create custom admin modules. Both the front and back end are responsive and optimized for mobile devices.


### Setup

It's best to use cms_admin with new projects.

  git clone https://github.com/websitescenes/cms_admin.git project_name

There is no config/database.yml so you will have to add one. PG is loaded by default, but you may prefer another database type. Here is an example of a PG database.yml:

  development:
  adapter: postgresql
  encoding: utf8
  database: cms_admin
  pool: 5
  username: postgres
  password: 
  port: 5432 
  host: localhost


### Admin Generator

  rails generate module things


this will create a backend CRUD interface for model Thing.


### Custom Post Form for page

For a custom post form create the partial '_form_for_page_name.html.erb' in the view/admin/posts folder.

  _form_for_page_name.html.erb


### Custom Page Modules


There are five pre-defined module positions for custom content within each page.

  page_top

  page_bottom

  after_posts

  side_left

  side_right

To utilize these positions, create a partial file in the 'page_modules' view folder with the same name as the page. An example is included for the home page.


### Custom Controller Resources

If custom objects are needed for your page module, then create a method in the pages controller under private with the same name as the page. When the corresponding page is loaded, so will the custom objects within this method. The home page structure is laid out as an example.

  private
  
    def home
      set_page
      # Resources for page modules can be set here.
    end


### Custom Post List for Page

To customize the post list layout for a page, create a file in the "posts/list" folder with the format "_list_for_example.html.erb", where "example" would be the page name.

  _list_for_example.html.erb


### Custom Post Show Layout for Page

To show a custom layout for a post create a file in "posts/show" called "_show_example.html.erb", where "example" is the name of the parent page.
  
  _show_example.html.erb
  

### Public Users

Users can sign up and sing into the front end of a cms_admin website by default.
There are Devise routes available at:

  /public_users/sign_up

  /public_users/sign_in

  /public_users/password/new


These views are editable at in the public users view folder.

Front end registration can be locked down by updating the Devise abilities in the PublicUser model.


### Images

Each Page and Post has one main image and unlimited secondary images. The main image will show up at the top of the page/post and the secondary images will show up below the page/post in a thumbnail grid. Each image can be opened in a lightbox.


### Some Things To Watch Out For


Admin/front-end interaction is tied to the page title. I typically lock down page create/destroy and title edit and only allow admin users to edit the body content for pages. If you do not have special layouts tied to your pages, then this is not a concern.


Turbolinks is enabled for the both the front and back end. jQueryTurbolinks is also included to help maintain compatibility with a wider range of scripts. There may be some cases where disabling turbolinks is required for your application structure.


### Main Dependencies


Twitter Bootstrap, Devise, RedCloth, Simple Form, Acts as List, Paperclip, Friendly Id, Cocoon, Turbolinks and jQueryTurbolinks.


### License

The MIT License (MIT)

Copyright (c) 2015 CMSAdmin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
