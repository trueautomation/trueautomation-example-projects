exports.config = {
  runner: 'local',
  specs: [
    './test/specs/**/*.js'
  ],
  maxInstances: 1,
  capabilities: [{
    maxInstances: 1,
    browserName: 'chrome',
    'goog:chromeOptions': {
      args: ['--incognito']
    }
  }],
  logLevel: 'error',
  deprecationWarnings: true,
  bail: 0,
  baseUrl: 'http://localhost',
  // waitforTimeout: 10000,
  connectionRetryTimeout: 90000,
  connectionRetryCount: 3,
  // services: ['selenium-standalone'],
  services: ['trueautomation'],
  path: '/',
  framework: 'mocha',
  mochaOpts: {
    ui: 'bdd',
    timeout: 60000
  }
};
