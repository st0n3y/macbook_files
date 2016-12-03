function allowDrop(e) {
    e.preventDefault();
}

function drag(e) {
    e.dataTransfer.setData("text", e.target.id);
}

function drop(e) {
  e.preventDefault();
  let data = e.dataTransfer.getData("text");
  let dataId = data.slice(4);
  console.log(e.target.className);
  if(e.target.className === dataId) {
    e.target.appendChild(document.getElementById(data));
  } 
  else if(e.target.className) {
    
  }
}