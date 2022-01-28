const {By, Builder, Capabilities, until } = require('selenium-webdriver');
// const { By, Builder } = require('trueautomation-selenium-webdriver');
const { ta } = require('trueautomation-helper');
const assert = require('assert');


// (async function example() {
//     const driver = new Builder().forBrowser('chrome').build();
//
//     try {
//         await driver.manage().setTimeouts( { implicit: 5000 } );
//         await driver.get('https://www.sencha.com');
//
//         const iframe = await driver.findElement(By.css('iframe.kitchen'));
//         await driver.switchTo().frame(iframe);
//
//         // await driver.findElement(By.css("button[id='ext-element-241']")).click();
//
//         async function componentIsDisplayed(component) {
//             await driver.wait(async function () {
//                 return driver.findElement(By.xpath('//div[text()=' + component + ']')).then(
//                     async result => { await result.isDisplayed().then(status => {
//                         result = status;
//                         });
//                     return result === true;
//                     },
//                     async error => {
//                         if (error.state === undefined) {
//                             await console.log('COMPONENT ' + component + ' WAS NOT FOUND');
//                             return error
//                         }
//                     });
//             }, 5000);
//         }
//
//         await componentIsDisplayed("'Components'");
//         await componentIsDisplayed("'Grids'");
//         await componentIsDisplayed("'Trees'");
//         await componentIsDisplayed("'Charts'");
//         await componentIsDisplayed("'Calendar'");
//         await componentIsDisplayed("'Pivot Grids'");
//         await componentIsDisplayed("'D3'");
//
//         await driver.switchTo().defaultContent();
//         await driver.sleep(3000);
//
//
//     } finally {
//         await driver.quit();
//     }
// })();

(async function example() {
    const driver = new Builder().forBrowser('chrome').build();

    try {
        await driver.manage().setTimeouts( { implicit: 5000 } );
        await driver.get('https://getbootstrap.com/docs/4.4/components/forms/#range-inputs');

        async function getShadowRoot() {
            await driver.findElement(By.css("input[id='formControlRange']")).click();
            await driver.findElement(By.css("input[id='formControlRange']")).sendKeys('10');
            // return driver.executeScript("return arguments[0].value = arguments[1]", shadowHost, '30');
        }

        await getShadowRoot();


        // await driver.findElement(By.css("input[id='formControlRange']")).sendKeys('15');


        await driver.sleep(300000);


    } finally {
        await driver.quit();
    }
})();
