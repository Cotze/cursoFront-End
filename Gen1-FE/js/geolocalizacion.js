function getGeo() {
    //si el browser esta habilitado para geolocalizacion
    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(geoOK, geoKO);
    }
}

//Se ejecuta cuando getCurrentPosition tiene éxito
function geoOK(position) {
    console.log(position);
    showLatLong(position.coords.latitude, position.coords.longitude);
}

function geoKO() {
    if (err.code == 1) {
        error('El usuario denegó el permiso');
    } else if (err.code == 2) {
        error('La ubicacion no se puede determinar');
    } else if (err.code == 3) {
        error('Timeout');
    } else {
        error('Error ' + err.code);
    }
}

function showLatLong(lat, longi) {
    $("#direccion").html("latitud: " + lat + " longitud: " + longi);

    //Despues calculamos la dirección física
    var geocoder = new google.maps.Geocoder();
    var milocalizacion = new google.maps.LatLng(lat, longi);
    geocoder.geocode({ 'latLng': milocalizacion }, processGeocoder);
}

function processGeocoder(result, status) {
    console.log(result);
    console.log(status);
    if (status == google.maps.GeocoderStatus.OK) {
        //si traigo información
        if (result[0]) {
            //despliego la información
            var direccion = result[0].formatted_address; //Blvd. San Felipe 226, Valle del Ángel, 72040 Puebla, Pue., Mexico
            $("direccion").html(direccion);
        } else {
            error("Google no retornó resultados");
        }
    } else {
        error("Google no retornó resultados");
    }
}

function dibujaMapa(lat, longi) {
    var coordenadas = { lat: 0, lng: 0 };

    function localizacion(position) {
        if (lat == 0) {
            //Sacamos mis coordenas de gelocalizacion
            coordenadas = {
                Lat: position.coords.latitude,
                Lng: position.coords.longitude
            };
        } else {
            //asignamos a mis coordenadas los parametros recibidos
            coordenadas = {
                Lat: lat, //19.071984
                Lng: longi //-98.218453
            };
        }
        //Definir las opciones para dibujar el mapa
        var myLatLng = new google.maps.LatLng(coordenadas.Lat, coordenadas.Lng);

        var mapOptions = {
            zoom: 16,
            center: myLatLng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        //Cargar el mapa en el div indicado
        var map = new google.maps.Map(document.getElementById('mapa'), mapOptions);
        //Definir el marcador (de google) en la posición indicada
        var marker = new google.maps.Marker({
            position: myLatLng,
            title: "Aqui estamos",
            icon: "http://trnetwork.com.mx/images/logos/trnetwork.jpg"
        });
        marker.setMap(map);
        $("#mapa").css("height", 350);
        var panorama = new google.maps.StreetViewPanorama(document.getElementById("street"), {
            position: myLatLng, pov: { heading: 90, pitch: 5 }
        });
        map.setStreetView(panorama);
        $("#street").css("height", 300);
    }
    if (navigator && navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(localizacion, error);
    }
}

function error(error) {
    alert(error);
}