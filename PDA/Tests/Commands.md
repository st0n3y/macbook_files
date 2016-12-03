Two help you with the tests you might need to run some of these commands.  Work your way through them and don't just install everything at once.  There will be  a link to the revision papers for the exams in github.

npm install webdriver-manager -g
webdriver-manager update --standalone
npm install protractor -g
npm init
npm install jasmine-core -g 
npm install karma-jasmine -g
npm install jasmine -g
npm install karma-chrome-launcher --save-dev
npm install karma --save-dev
npm install karma-cli -g
npm install jasmine-core --save

To go in the karma.conf.js file:
 plugins: [
       'karma-chrome-launcher',
       'karma-jasmine'
       ],