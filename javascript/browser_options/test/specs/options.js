const { By, Builder, until, chrome } = require('trueautomation-selenium-webdriver');
// const { Key, Capabilities, until, logging, Builder, By } = require('selenium-webdriver');
const { Capabilities } = require('selenium-webdriver');
const { ta } = require('trueautomation-helper');
// const chrome = require('selenium-webdriver/chrome');


(async function example() {
    // const driver = new Builder().forBrowser('chrome').build();

    // const caps = Capabilities.chrome();
    // caps.set('browserName', 'chrome');
    // caps.set('goog:chromeOptions', { 'args': ['--incognito'] } );
    // const driver = new Builder().forBrowser('chrome').withCapabilities(caps).build();

    // const options = new chrome.Options();
    // options.addArguments('--incognito');
    // const driver = new Builder().forBrowser('chrome').setChromeOptions(options).build();

    const driver = new Builder()
        .forBrowser('chrome')
        .setChromeOptions(new chrome.Options().headless())
        .build();

    try {
        await driver.manage().setTimeouts( { implicit: 5000 } );
        await driver.get('https://trueautomation.io');

        await driver.findElement(By.css(ta('loginBtn', 'header div.jet-button__container > a'))).click();
        await driver.findElement(By.css(ta('signUpBtn', 'div.sign-up-container > a'))).click();
        await driver.findElement(By.name(ta('emailFld', 'email'))).sendKeys('your@gmail.com');
    } finally {
        await driver.quit();
    }
})();