var contador = 0;
var elementArrastrableId = "";

function start(e) {
    ////Funciones de los objetos cuadraditos
    console.log("start");
    e.dataTransfer.effectAllowed = "move";
    e.dataTransfer.setData("Data", e.target.id);
    $("#" + e.target.id).css("opacity", "0.4");
    elementArrastrableId = e.target.id;
}

function end(e) {
    console.log("end");
    e.target.style.opacity = '';
    e.dataTransfer.clearData("Data");
    elementArrastrableId = "";
}

function enter(e) {
    console.log("enter");
    e.target.style.border = "12px dotted #555";
}

function leave(e) {
    console.log("leave");
    //e.target.style.border = "";
    $("#" + e.target.id).css("border", "");
}

function over(e) {
    console.log("over");
    var id = e.target.id;   
    if ((id == "cuadro1") || (id == "cuadro3") || (id == "papelera")) {
        return false;
    } else {
        return true;
    }
}

function drop(e) {
    console.log("drop");
    var elementoArrastrado = e.dataTransfer.getData("Data");
    e.target.appendChild(document.getElementById(elementoArrastrado));
    e.target.style.border = ""; 
}

function eliminar(e) {
    console.log("eliminar");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.parentNode.removeChild(elementoArrastrado);
    e.target.style.border = "";
}

function clonar(e) {
    console.log("clonar");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.style.opacity = "";
    var elementoClonado = elementoArrastrado.cloneNode(true);
    elementoClonado.id = "ElementoClonado" + contador;
    contador++;
    if (elementoClonado.id != "ElementoClonado2") {
        console.log("Hola");
    } else {
    }
    elementoClonado.style.position = "static";
    e.target.appendChild(elementoClonado);
    e.target.style.border = "";
   
}