// const { By, Builder, until, chrome } = require('trueautomation-selenium-webdriver');
const { Key, Capabilities, until, logging, Builder, By } = require('selenium-webdriver');
// const { ta } = require('trueautomation-helper');
// const chrome = require('selenium-webdriver/chrome');
const { assert } = require('chai');


(async function example() {
    const driver = new Builder().forBrowser('chrome').build();

    try {
        await driver.manage().setTimeouts( { implicit: 5000 } );
        await driver.get('https://trueautomation.io');
        // const el1j = { a : { n: 0 } };
        const el1 = await driver.findElement(By.css('header div.jet-button__container > a'));
        const el1j = JSON.parse(JSON.stringify(el1));
        console.log(el1j);

        // const el2j = { a : { n: 1 } };
        // await driver.get('https://trueautomation.io');
        // const el2 = await driver.findElement(By.css('header div.jet-button__container > a'));
        const el2 = await driver.findElement(By.xpath("//a[contains(.,'Get A Trial')]"));
        const el2j = JSON.parse(JSON.stringify(el2));
        console.log(el2j);

        assert.equal(el1j, el2j, 'ERROR');
        // await driver.findElement(By.css(ta('signUpBtn', 'div.sign-up-container > a'))).click();
        // await driver.findElement(By.name(ta('emailFld', 'email'))).sendKeys('your@gmail.com');
    } finally {
        await driver.quit();
    }
})();