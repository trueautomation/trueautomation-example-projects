# Remote Webdriver | TA Capybara Rspec example project

You must have installed TrueAutomation client, Ruby 2.6.3 or later and an updated browser system driver (chromedriver, geckodriver or safaridriver).

## Usage:
* Go to the root directory of the current example project:
```bash
/capybara_rspec/remote_webdriver
```

* Init the project, using `trueautomation init` command or just create the "trueautomation.json" file containing the project name:
```bash
{
  "projectName": "REGRESSION"
}
```

* Install required dependencies
```bash
bundle install
```

* Start a remote driver:
```bash
# Chrome
chromedriver --port=4444

#Firefox
geckodriver -p 4444

# Safari
safaridriver -p 4444
```

You can also download the desired driver and run it separately. Don't forget that the driver version must correspond the browser version.

* Run test
```bash
rspec spec/test_scenario/example_test.rb
```
