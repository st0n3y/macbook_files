var React = require('react');
var ReactDOM = require('react-dom');
var Counter = require('./components/Counter.jsx')

window.onload = function(){
  console.log("webpack app started");
  ReactDOM.render(
    <Counter title="Jill the counter" multiple={10}/>,
    document.getElementById("app")
  );
};