# ActiveRecord CSV Importer

### What is it?
Man am I ever sick of writing the same code over and over again to import CSV representations of data in my Rails applications.  You probably are too.  Install ActiveRecord CSV Importer and stop doing it!

### Requirements
Ruby: >= 1.9.3

Rails: >= 3.2

### Installation

Put it in your Gemfile, as usual, and run bundle install.  Easy!

    gem 'ar_csv_importer'

### Usage


**Setting up the class:**
Let's imagine you have a Merchant class.  The class has a title, an address, a URL, and a description.  First, add the importer to your class.

    class Merchant < ActiveRecord::Base
       has_csv_importer :title, :address, :url, :description
    end

Note that the order that you list your attributes should match the other of the fields in your CSV.

**Running the import:**

    Merchant.csv_import('/path/to/csv_file')

If you want to run the import and raise validation errors:

    Merchant.csv_import!('/path/to/csv_file')

That's it!