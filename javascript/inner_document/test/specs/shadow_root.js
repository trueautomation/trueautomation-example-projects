const {By, Builder, Capabilities } = require('selenium-webdriver');
// const { By, Builder } = require('trueautomation-selenium-webdriver');
const { ta } = require('trueautomation-helper');
const assert = require('assert');

(async function example() {
    const driver = new Builder().forBrowser('chrome').build();
    await driver.manage().setTimeouts( { implicit: 5000 } );

    async function getShadowRoot(shadowHostLocator, domTree) {
        const shadowHost = await domTree.findElement(By.css(shadowHostLocator));
        return driver.executeScript("return arguments[0].shadowRoot", shadowHost);
    }

    try {
        await driver.get('https://shop.polymer-project.org');

        // driver.executeScript("document.querySelector('shop-app').shadowRoot.querySelector('shop-home').shadowRoot.querySelector('shop-button > a').click();");

        const shadowRoot1 = await getShadowRoot('shop-app', driver);
        const shadowRoot2 = await getShadowRoot('shop-home', shadowRoot1);

        // await shadowRoot2.findElement(By.css(ta('homePage:shopButton', 'shop-button > a'))).click();
        await shadowRoot2.findElement(By.css('shop-button > a')).click();
        await shadowRoot1.findElement(By.css('shop-list')).getAttribute('visible').then(isVisible => {
            assert.equal('', isVisible, 'SHOP LIST IS NOT OPENED');
        });

        await driver.sleep(3000);

    } finally {}

    try {
        await driver.get('https://www.marca.com');

        const shadowRoot1 = await getShadowRoot('ue-sport-events-carousel', driver);

        await shadowRoot1.findElement(By.css("select > option[value='02 0202']")).click();
        // await shadowRoot1.findElement(By.css(ta('homePage:nbaOption', "select > option[value='02 0202']"))).click();
        await shadowRoot1.findElement(By.css("div[role='heading']")).getText().then(text => {
            assert.equal('NBA', text, 'NBA OPTION IS NOT CHOSEN');
        });

        await driver.sleep(3000);

    } finally {
        await driver.quit();
    }
})();
