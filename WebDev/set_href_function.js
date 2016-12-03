setLinkDate: function() {

}


setLinkLocation: function() {

}


setLinkHref: function(date, location) {
  console.log(e.target);
  var link = e.target;
  var location = link.parentElement.parentElement;
  
  
  link.setAttribute("href", "");
}