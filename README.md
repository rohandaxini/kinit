# Kinit

This is Kiprosh Project Initialization plugin to check various aspects of an application best practices. 

Kinit gem is used to enforce best practices in a project. Say for example, kinit can be used to check whether your project uses important gems like 'cane', 'rails_best_practices' etc. and strictly follows their guidelines.

Kinit gem, once included in the project and run using command "run_kinit" will enforce these practices in the project and will show errors / exceptions accordingly.


## Installation

Add this line to your application's Gemfile:

    gem 'kinit'

And then execute:

    $ bundle

## Usage

To use kinit you can run following command on your application root 

    run_kinit


## Configure Kinit checks
To configure Kinit checks for your project, define following file in your app config folder

    config/kinit_config.yml


## Sample kinit_config.yml

    bestPracticesGems:
		- cane
		- rails_best_practices
		- reek
		- simplecov

	testingGems:
		- rspec
		- shoulda

	suggestions:
		- CodeClimate


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Author
Rohan Daxini at Kiprosh (www.kiprosh.com)


## License

Ruby License, see the COPYING file included in the source distribution. The Ruby License includes the GNU General Public License (GPL), Version 2, so see the file GPL as well.

## Download

The latest version of this library can be downloaded at
rubygems.org/gems/kinit