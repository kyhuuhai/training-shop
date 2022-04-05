- ruby 2.7.5 (install by rvm)
- Rails 6.0.1
- Postgres

---

Install

- rvm install 2.7.5
- rvm use 2.7.5 --default
- git clone git@github.com:kyhuuhai/training-shop.git
- git remote add rikai git@github.com:kyhuuhai/training-shop.git
- git checkout your_name
- bundle install
- rake db:create
- rake db:migrate
- Access: localhost:3000

---

## Spec

https://docs.google.com/spreadsheets/d/1iWfwf7XSZQzgHwn_H1lRFpJf1Zc-yxpb1dxVcMuXsuk/edit#gid=0

## Convention (https://github.com/kyhuuhai/training_shop/blob/master/CONVENTION.md)

## Pull Request Description

- Attchment link ticket redmine vào pull
- Attchment hình ảnh chụp layout các chức năng làm của pull đó
- Gửi và theo dõi pull trên hệ thống [PRTS](https://docs.google.com/spreadsheets/d/1dO7RAbWRbSY9AGlVInrZomV7fQa2vwfIX7SHTQHE9Po/edit#gid=0) đã làm ở tutorial
- Đối với pull init model cần attachment hình ảnh thiết kế DB
- Giải thích cách làm và bằng chứng dựa theo template

```

## Review project

- Chỉ được review project khi team hoàn thành >= 85% chức năng yêu cầu của dự án
- Yêu cầu deploy dự án trên heroku
- Sử dụng link heroku để trình bày project
- Các dữ liệu đăng nhập cần fake sẵn sàng để trình bày
- Chức năng thành viên nào làm thành viên đó trình bày
- Trường hợp team hoàn thành dưới 85% yêu cầu thì cần liên hệ với Trainer trước deadline 2 ngày để xin dời lịch và xin thêm thời gian

#### Các kỹ thuật áp dụng trong rails project 1

1. [Nested Attribute (fields_for, reject_if, allow_destroy, ...)](http://api.rubyonrails.org/classes/ActiveRecord/NestedAttributes/ClassMethods.html)
2. [Batch Update](https://apidock.com/rails/ActiveRecord/Relation/update_all)
3. [form_for](http://api.rubyonrails.org/v5.1/classes/ActionView/Helpers/FormHelper.html)
4. [Call back function](http://api.rubyonrails.org/classes/ActiveRecord/Callbacks.html)
5. Macro (generate, rake, spring, ...)
6. Ajax (Rails ajax, jQuery ajax)
7. [Seed](https://codedecoder.wordpress.com/2013/04/25/rake-db-seed-in-rails/)
8. [RESTful](http://www.infoq.com/articles/rest-introduction)
9. [Association (has_many/has_one/belongs_to)](http://guides.rubyonrails.org/association_basics.html)
10. [Transaction](http://api.rubyonrails.org/classes/ActiveRecord/Transactions/ClassMethods.html)
11. [Resources, Nested Resources](http://guides.rubyonrails.org/routing.html)
12. [Resource](http://guides.rubyonrails.org/routing.html)
13. [Export CSV, Excel](http://railscasts.com/episodes/362-exporting-csv-and-excel)
14. [Rake task](https://viblo.asia/p/rake-task-rails-DzVkpLQLknW)
15. [CSRF Protection](http://guides.rubyonrails.org/security.html)
16. [Coffee](https://www.sitepoint.com/using-coffeescript-in-rails/)
17. [Concerns](http://api.rubyonrails.org/v5.1/classes/ActiveSupport/Concern.html)
18. [Scope](http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html)
19. [I18n(mutilple language, dictionary, time format, number format, ...)](http://guides.rubyonrails.org/i18n.html)
20. Search form, filter form
21. [Gem Config](https://github.com/railsconfig/config)
22. [Eager Loading Associations](http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations)
23. [Validation](http://guides.rubyonrails.org/active_record_validations.html)
24. [Environment Variable](http://railsapps.github.io/rails-environment-variables.html)
25. [MVC](https://www.sitepoint.com/model-view-controller-mvc-architecture-rails/)
26. [Module mixin](https://www.tutorialspoint.com/ruby/ruby_modules.htm)
27. Proc / Lambda
28. Debug Javascript code
29. [Jquery selector](https://api.jquery.com/category/selectors/)
30. [CSS selector](https://www.w3schools.com/cssref/css_selectors.asp)
31. [Ruby Nil Object](https://ruby-doc.org/core-2.4.0/NilClass.html)

#### Happy coding!!!
```
