const {By, Builder, Capabilities } = require('selenium-webdriver');
// const { By, Builder } = require('trueautomation-selenium-webdriver');
const { ta } = require('trueautomation-helper');

(async function example() {
    const driver = new Builder().forBrowser('chrome').build();

    try {
        await driver.manage().setTimeouts( { implicit: 5000 } );
        await driver.get('https://trueautomation.io');

        await driver.findElement(By.xpath(ta('homePage:loginBtn', "//a[.//span[text()='Login']]"))).click();
        await driver.findElement(By.css(ta('signinPage:signupBtn', 'div.sign-up-container > a'))).click();
        await driver.findElement(By.name(ta('signupPage:emailField', 'email'))).sendKeys('your@gmail.com');
    } finally {
        await driver.quit();
    }
})();
