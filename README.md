<img src="https://github.com/websitescenes/cms_admin/blob/master/app/assets/images/cms_admin.png" />

-----------------------------------------------------------------------------------

Rails 4 / Twitter Bootstrap 3 CMS. Pages, posts, images, users and public users.


### Default Credentials

CMS path is /admin


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
    
### Pages

Pages are the main content areas/views. Each page has pre-defined module positions and attributes. Pages can be set as public or private and there are options to publish and show in menu.


### Posts

Posts belong to pages. Posts can be published, sorted and have many images.


### Images

Each Page and Post has one main image and unlimited secondary images. The main image will show up at the top of the page/post and the secondary images will show up below the page/post in a thumbnail grid. Each image can be opened in a lightbox.

### Public Users

Users can sign up and log into the front end of a cms_admin website by default.
There are Devise routes available at:

    /public_users/sign_up

    /public_users/sign_in

    /public_users/password/new


These views are editable at in the public users view folder.

Front end registration can be locked down by updating the Devise abilities in the PublicUser model.


## Admin Users

The default login route for admin users is /admin. 


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




### Admin Generator

    rails generate module things


this will create a backend CRUD interface for model Thing.


### Custom Post Form for page

For a custom post form create the partial '_form_for_page_name.html.erb' in the view/admin/posts folder.

    _form_for_page_name.html.erb



### Some Things To Watch Out For


Admin/front-end interaction is tied to the page title. I typically lock down page create/destroy and title edit and only allow admin users to edit the body content for pages. If you do not have special layouts tied to your pages, then this is not a concern.


Turbolinks is enabled for the both the front and back end. jQueryTurbolinks is also included to help maintain compatibility with a wider range of scripts. There may be some cases where disabling turbolinks is required for your application structure.


### Main Dependencies


Twitter Bootstrap, Devise, RedCloth, Simple Form, Acts as List, Paperclip, Friendly Id, Cocoon, Turbolinks and jQueryTurbolinks.


### Support

cms_admin is actively utilized for all my side projects outside of work. I will continue to make it better and squash bugs at a steady rate. If you require assistance or have found a bug, open a Github issue.

### Contribute

I am open to feedback, suggestions and contributions are gladly welcomed. Pull requests will be reviewed and incorporated promptly.


### License

cms_admin is released under the [MIT License](http://www.opensource.org/licenses/MIT).


