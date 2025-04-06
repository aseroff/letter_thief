# TODO

* Add support for separate database
* Add basic tasks for cleaning up
* Run tests on different ruby/rails/database combinations

# Unreleased

* Breaking change: dropped raw_message in favour of a separate attachment. Remove the column if you are migrating from a
  previous version with `remove_column :letter_thief_email_messages, :raw_message`.
* Show space used by each logged email and total space used.
* Relax CSP rules for the LetterThief pages to allow inline CSS styles.

# 0.1.1

* Added a root_path for the engine

# 0.1.0

* Added an interceptor and database table
* Added views to visualize emails and search them
* Added delivery method to open with Launchy

