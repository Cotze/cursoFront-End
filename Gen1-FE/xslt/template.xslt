<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>
	<xsl:param name="TipoMenu" select="TipoMenu"></xsl:param>

	<xsl:template match="Menu">
		<html lang="en">
			<head>
				<meta charset="utf-8"/>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<title>Cafe House Template</title>
				<!-- Cafe House Template http://www.templatemo.com/tm-466-cafe-house -->
				<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'/>
				<link href='http://fonts.googleapis.com/css?family=Damion' rel='stylesheet' type='text/css'/>
				<link href="css/bootstrap.min.css" rel="stylesheet"/>
				<link href="css/font-awesome.min.css" rel="stylesheet"/>
				<link href="css/templatemo-style.css" rel="stylesheet"/>
				<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />

				<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
				<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
				<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
				<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
				<!-- jQuery -->
				<script type="text/javascript" src="js/geolocalizacion.js"></script>

			</head>
			<body>
				<div id="loader-wrapper">
					<div id="loader"></div>
					<div class="loader-section section-left"></div>
					<div class="loader-section section-right"></div>
				</div>
				<div class="tm-top-header">
					<div class="container">
						<div class="row">
							<div class="tm-top-header-inner">
								<div class="tm-logo-container">
									<img src="img/logo.png" alt="Logo" class="tm-site-logo"/>
									<h1 class="tm-site-name tm-handwriting-font">Cafe House</h1>
								</div>
								<div class="mobile-menu-icon">
									<i class="fa fa-bars"></i>
								</div>
								<nav class="tm-nav">
									<ul>
										<xsl:for-each select="Opciones/Opcion">
											<xsl:choose>
												<xsl:when test="$TipoMenu=@Id">
													<li>
														<a href="{@Url}" class="active">
															<xsl:value-of select="@Texto"/>
														</a>
													</li>
												</xsl:when>
												<xsl:otherwise>
													<li>
														<a href="{@Url}">
															<xsl:value-of select="@Texto"/>
														</a>
													</li>
												</xsl:otherwise>
											</xsl:choose>

										</xsl:for-each>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>

				<xsl:choose>
					<xsl:when test="$TipoMenu= 1">
						<xsl:call-template name="Carta"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu= 2">
						<xsl:call-template name="Contacto"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu= 3">
						<xsl:call-template name="playRoom"></xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>

				<footer>
					<div class="tm-black-bg">
						<div class="container">
							<div class="row margin-bottom-60">
								<nav class="col-lg-3 col-md-3 tm-footer-nav tm-footer-div">
									<h3 class="tm-footer-div-title">Main Menu</h3>
									<ul>
										<li>
											<a href="#">Home</a>
										</li>
										<li>
											<a href="#">About Us</a>
										</li>
										<li>
											<a href="#">Directory</a>
										</li>
										<li>
											<a href="#">Blog</a>
										</li>
										<li>
											<a href="#">Our Services</a>
										</li>
									</ul>
								</nav>
								<div class="col-lg-5 col-md-5 tm-footer-div">
									<h3 class="tm-footer-div-title">About Us</h3>
									<p class="margin-top-15">Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.</p>
									<p class="margin-top-15">Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus.</p>
								</div>
								<div class="col-lg-4 col-md-4 tm-footer-div">
									<h3 class="tm-footer-div-title">Get Social</h3>
									<p>Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante.</p>
									<div class="tm-social-icons-container">
										<a href="#" class="tm-social-icon">
											<i class="fa fa-facebook"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-twitter"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-linkedin"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-youtube"></i>
										</a>
										<a href="#" class="tm-social-icon">
											<i class="fa fa-behance"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div>
						<div class="container">
							<div class="row tm-copyright">
								<p class="col-lg-12 small copyright-text text-center">Copyright 2084 Your Cafe House</p>
							</div>
						</div>
					</div>
				</footer>

				<script type="text/javascript" src="js/templatemo-script.js"></script>
				<!-- Templatemo Script -->

			</body>
		</html>
	</xsl:template>

	<xsl:template name="Home">
		<section class="tm-welcome-section">
			<div class="container tm-position-relative">
				<div class="tm-lights-container">
					<img src="img/light.png" alt="Light" class="light light-1"/>
					<img src="img/light.png" alt="Light" class="light light-2"/>
					<img src="img/light.png" alt="Light" class="light light-3"/>
				</div>
				<div class="row tm-welcome-content">
					<h2 class="white-text tm-handwriting-font tm-welcome-header">
						<img src="img/header-line.png" alt="Line" class="tm-header-line"/>
						Bienvenido a <img src="img/header-line.png" alt="Line" class="tm-header-line"/>


					</h2>
					<h2 class="gold-text tm-welcome-header-2">
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</h2>
					<p class="gray-text tm-welcome-description">
						<xsl:value-of select="Datos/Descripcion"/>
					</p>
					<a href="#main" class="tm-more-button tm-more-button-welcome">Ir a la carta</a>
				</div>
				<img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive"/>
			</div>
		</section>
		<div class="tm-main-section light-gray-bg">
			<div class="container" id="main">
				<section class="tm-section row">
					<div class="col-lg-9 col-md-9 col-sm-8">
						<h2 class="tm-section-header gold-text tm-handwriting-font">Visitanos en:</h2>
						<h2>
							<xsl:value-of select="Datos/NombreRestaurant"/>
						</h2>
						<p class="tm-welcome-description">
							<xsl:value-of select="concat(Datos/Direccion, 'Tel: ', Datos/Telefono)"/>
						</p>
						<a href="#" class="tm-more-button margin-top-30">Read More</a>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-4 tm-welcome-img-container">
						<div class="inline-block shadow-img">
							<img src="{Datos/Imagen}" alt="Image" class="img-circle img-thumbnail"/>
						</div>
					</div>
				</section>
				<section class="tm-section tm-section-margin-bottom-0 row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							<img src="img/logo.png" alt="Logo" class="tm-site-logo"/> Especialidades
						</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr"/>
						</div>
					</div>
					<div class="col-lg-12 tm-popular-items-container">
						<xsl:for-each select="Platillos/Tipo[@Nombre != 'Bebidas']/Platillo[@Orden= 1]">
							<div class="tm-popular-item">
								<img src="{Imagen}" alt="Popular" class="tm-popular-item-img"/>
								<div class="tm-popular-item-description">
									<h3 class="tm-handwriting-font tm-popular-item-title">
										<span class="tm-handwriting-font bigger-first-letter">
											<xsl:value-of select="substring(@Nombre,1,1)"/>
										</span>
										<xsl:value-of select="substring(@Nombre,2,string-length(@Nombre))"/>
									</h3>
									<hr class="tm-popular-item-hr"/>
									<p>
										<xsl:value-of select="Descripcion"/>
									</p>
									<div class="order-now-container">
										<a href="#" class="order-now-link tm-handwriting-font">
											<xsl:value-of select="Precio"/>
										</a>
									</div>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</section>
				<section class="tm-section row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							<img src="img/logo.png" alt="Logo" class="tm-site-logo"/> Comida Especial
						</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr"/>
						</div>
					</div>
					<div class="col-lg-12 tm-special-container margin-top-60">
						<div class="tm-special-container-left">
							<!-- left -->
							<xsl:for-each select="Platillos/Tipo[@Nombre = 'Comidas']/Platillo[@Especialidad = 'SI']">
								<div class="tm-special-item">
									<div class="tm-special-img-container">
										<img src="{Imagen[position()= 1]}" alt="Special" class="tm-special-img img-responsive"/>
										<a href="#">
											<div class="tm-special-description">
												<h3 class="tm-special-title">
													<xsl:value-of select="@Nombre"/>
												</h3>
												<p>
													<xsl:value-of select="TextoEspecial"/>
												</p>
											</div>
										</a>
									</div>
								</div>
							</xsl:for-each>
						</div>
						<div class="tm-special-container-right">
							<!-- right -->
							<div>
								<xsl:for-each select="Platillos/Tipo[@Nombre = 'Comidas']/Platillo[@Especialidad = 'SI']">
									<div class="tm-special-item">
										<div class="tm-special-img-container">
											<img src="{Imagen[position()= 2]}" alt="Special" class="img-responsive"/>
											<a href="#">
												<div class="tm-special-description">
													<h3 class="tm-special-title">
														<xsl:value-of select="Ingredientes/Ingrediente/@Nombre"/>
													</h3>
													<p>
														<xsl:value-of select="Ingredientes/Ingrediente[@Nombre]"/>
													</p>
												</div>
											</a>
										</div>
									</div>
								</xsl:for-each>
							</div>
							<!--left-->
							<div class="col-lg-12 tm-special-container margin-top-28">
								<xsl:for-each select="Platillos/Tipo[@Nombre='Comidas']/Platillo[@Especialidad='SI']/Ingredientes/Ingrediente[position()>1]">
									<div class="tm-special-container-lower">
										<div class="tm-special-item">
											<div class="tm-special-img-container">
												<img src="{@Imagen}" alt="Special" class="img-responsive"/>
												<a href="#">
													<div class="tm-special-description">
														<p>
															<xsl:value-of select="@Nombre"/>
														</p>
													</div>
												</a>
											</div>
										</div>
									</div>
								</xsl:for-each>
							</div>

						</div>
					</div>
				</section>
				<section class="tm-section">
					<div class="row">
						<div class="col-lg-12 tm-section-header-container">
							<h2 class="tm-section-header gold-text tm-handwriting-font">
								<img src="img/logo.png" alt="Logo" class="tm-site-logo"/> Daily Menu
							</h2>
							<div class="tm-hr-container">
								<hr class="tm-hr"/>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="tm-daily-menu-container margin-top-60">
							<div class="col-lg-4 col-md-4">
								<img src="img/menu-board.png" alt="Menu board" class="tm-daily-menu-img"/>
							</div>
							<div class="col-lg-8 col-md-8">
								<p>Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus.</p>
								<ol class="margin-top-30">
									<li>Tellus eget condimentum rhoncus.</li>
									<li>Sem quam semper libero.</li>
									<li>Sit amet adipiscing sem neque sed ipsum.</li>
									<li>Nam quam nunc, blandit vel, luctus pulvinar.</li>
									<li>Maecenas nec odio et ante tincidunt tempus.</li>
									<li>Donec vitae sapien ut libero ventenatis faucibus.</li>
								</ol>
								<a href="#" class="tm-more-button margin-top-30">Read More</a>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="Carta">
		<section class="tm-welcome-section">
			<div class="container tm-position-relative">
				<div class="tm-lights-container">
					<img src="img/light.png" alt="Light" class="light light-1"/>
					<img src="img/light.png" alt="Light" class="light light-2"/>
					<img src="img/light.png" alt="Light" class="light light-3"/>
				</div>
				<div class="row tm-welcome-content">
					<h2 class="white-text tm-handwriting-font tm-welcome-header">
						<img src="img/header-line.png" alt="Line" class="tm-header-line"/>
						Nuestros Menu <img src="img/header-line.png" alt="Line" class="tm-header-line"/>
					</h2>
					<h2 class="gold-text tm-welcome-header-2">
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</h2>
					<p class="gray-text tm-welcome-description">
						<xsl:value-of select="Datos/Descripcion"/>
					</p>
					<a href="#main" class="tm-more-button tm-more-button-welcome">Ir a la carta</a>
				</div>
				<img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive"/>
			</div>
		</section>
		<div class="tm-main-section light-gray-bg">
			<div class="container" id="main">
				<section class="tm-section row">
					<div class="col-lg-12 tm-section-header-container margin-bottom-30">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							<img src="img/logo.png" alt="Logo" class="tm-site-logo"/> Nuestro Menu
						</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr"/>
						</div>
					</div>
					<div>
						<div class="col-lg-3 col-md-3">
							<div class="tm-position-relative margin-bottom-30">
								<nav class="tm-side-menu">
									<ul>
										<xsl:for-each select="Platillos/Tipo">
											<li>
												<a class="tipomenu active" id="li{@Nombre}" data-identificador="{@Nombre}" style="cursor: pointer;">
													<xsl:value-of select="@Nombre"/>
												</a>
											</li>
										</xsl:for-each>


									</ul>
								</nav>
								<img src="img/vertical-menu-bg.png" alt="Menu bg" class="tm-side-menu-bg"/>
							</div>
						</div>

						<!--Inicio del for-each de las tarjetas-->
						<xsl:for-each select="Platillos/Tipo">
							<div class="tm-menu-product-content col-lg-9 col-md-9 contenedores" id="{@Nombre}">
								<!-- menu content -->
								<!--for-each anidado para las tarjetas-->
								<xsl:for-each select="Platillo">
									<div class="tm-product">
										<img src="{Imagen}" alt="Product" class="imagenPlatillo"/>
										<div class="tm-product-text">
											<h3 class="tm-product-title">
												<xsl:value-of select="@Nombre"/>
											</h3>
											<p class="tm-product-description">
												<xsl:value-of select="Descripcion"/>
											</p>
										</div>
										<div class="tm-product-price">
											<a href="#" class="tm-product-price-link tm-handwriting-font">
												<xsl:value-of select="Precio"/>
											</a>
										</div>
									</div>

								</xsl:for-each>

							</div>
						</xsl:for-each>


					</div>
				</section>
			</div>
		</div>
		<script>
			$(document).ready(function(){
			$("#liDesayuno").addClass("active");
			$(".contenedores").hide();
			$("#Desayunos").show();
			$(".tipomenu").click(function(){
			$(".contenedores").hide();
			var nombre = $(this).data("identificador");
			$(".tipomenu").removeClass("active");
			$(this).addClass("active");
			$("#" + nombre).show();
			});
			});
		</script>
	</xsl:template>

	<xsl:template name="Contacto">
		<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>
		<section class="tm-welcome-section">
			<div class="container tm-position-relative">
				<div class="tm-lights-container">
					<img src="img/light.png" alt="Light" class="light light-1"/>
					<img src="img/light.png" alt="Light" class="light light-2"/>
					<img src="img/light.png" alt="Light" class="light light-3"/>
				</div>
				<div class="row tm-welcome-content">
					<h2 class="white-text tm-handwriting-font tm-welcome-header">
						<img src="img/header-line.png" alt="Line" class="tm-header-line"/>
						Contactanos <img src="img/header-line.png" alt="Line" class="tm-header-line"/>
					</h2>
					<h2 class="gold-text tm-welcome-header-2">
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</h2>
					<p class="gray-text tm-welcome-description">
						<text id="direccion" class="gold-text"></text>

						<div id="street"></div>
					</p>
					<a href="#main" class="tm-more-button tm-more-button-welcome">Envianos un mensaje</a>
				</div>
				<img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive"/>
			</div>
		</section>
		<div class="tm-main-section light-gray-bg">
			<div class="container" id="main">
				<section class="tm-section row">
					<h2 class="col-lg-12 margin-bottom-30">Formulario de reservacion</h2>
					<form action="Contacto.aspx" method="post" class="tm-contact-form" oninput="total.value=contact_personas.valueAsNumber+contact_adicionales.valueAsNumber">
						<div class="col-lg-6 col-md-6">

							<div class="form-group">
								<labbel class="form-label">Nombre</labbel>
								<input type="text" id="contact_name" name="contact_name" class="form-control" placeholder="Nombre" required="true" />
							</div>

							<div class="form-group">
								<labbel class="form-label">Correo</labbel>
								<input type="email" id="contact_email" name="contact_email" class="form-control" placeholder="Correo electronico" required="true"/>
							</div>

							<div class="form-group">
								<labbel class="form-label">Número de personas</labbel>
								<input type="number" id="contact_personas" name="contact_personas" class="form-control" required="true" max="8" min="1" value="1"/>
							</div>

							<div class="form-group">
								<labbel class="form-label">Personas adicionales</labbel>
								<input type="number" id="contact_adicionales" name="contact_adicionales" class="form-control" max="4" min="0" value="0"/>
							</div>

							<div class="form-group">
								<labbel class="form-label">Fecha</labbel>
								<input type="date" id="contact_fecha" name="contact_fecha" class="form-control" required="true" />
							</div>

							<div class="form-group">
								<labbel class="form-label">Hora</labbel>
								<input type="time" id="contact_hora" name="contact_hora" class="form-control" required="true" max="19:00:00" min="08:00:00"/>
							</div>

							<div class="form-group">
								<labbel class="form-label">Total de personaes</labbel>
								<output id="total" class="form-control">1</output>
							</div>

							<div class="form-group">
								<button class="tm-more-button" type="submit" name="submit">Hacer reservacion</button>
							</div>

						</div>
						<div class="col-lg-6 col-md-6">
							<div id="google-map">
								<div id="mapa"></div>
							</div>
						</div>
					</form>
				</section>
			</div>
		</div>
		<script>
			<![CDATA[$(document).ready(function(){
    var timeControl = document.getElementById("contact_hora");
    var now = new Date(Date.now());
    var horas = now.getHours();
    var minutos = now.getMinutes();
    if( horas < 10){
        horas = "0" + horas;
    }
    if( minutos < 10){
        minutos = "0" + minutos;
    }
    var formatted = horas + ":" + minutos; //09:03
    // timeControl.value = formatted;
    // $("#contact_hora").val(formatted);
    $("#contact_hora").attr("value",formatted);	
    $("#contact_hora").attr("min",formatted);	
    var dd = now.getDate();
    var mm = now.getMonth()+1;
    var yyyy = now.getFullYear();
    if(dd<10){dd='0'+dd;}
    if(mm<10){mm='0'+mm;}
    var today = yyyy + '-' + mm + '-' + dd; //2022-01-03
    $("#contact_fecha").attr("min",today);
    $("#contact_fecha").val(today);
    getGeo();
    dibujaMapa(19.071984, -98.218453);
});]]>
		</script>
	</xsl:template>

	<xsl:template name="playRoom">
		<script src="js/draganddrop.js"></script>
		<section class="tm-welcome-section">
			<div class="container tm-position-relative">
				<div class="tm-lights-container">
					<img src="img/light.png" alt="Light" class="light light-1"/>
					<img src="img/light.png" alt="Light" class="light light-2"/>
					<img src="img/light.png" alt="Light" class="light light-3"/>
				</div>
				<div class="row tm-welcome-content">
					<h2 class="white-text tm-handwriting-font tm-welcome-header">
						<img src="img/header-line.png" alt="Line" class="tm-header-line"/>
						Play Room <img src="img/header-line.png" alt="Line" class="tm-header-line"/>
					</h2>
					<h2 class="gold-text tm-welcome-header-2">
						<xsl:value-of select="Datos/NombreRestaurant"/>
					</h2>
					<p class="gray-text tm-welcome-description">
						<text id="direccion" class="gold-text">
							<![CDATA[Video, Audio, y Drag & Drop]]>
						</text>

						<div id="video">
							<video width="100%" controls="true" poster="/img/wrc.jpg">
								<source src="multimedia/wrc.mp4"></source>
							</video>
						</div>
					</p>
					<a href="#main" class="tm-more-button tm-more-button-welcome">Jugar</a>
				</div>
				<img src="img/table-set.png" alt="Table Set" class="tm-table-set img-responsive"/>
			</div>
		</section>
		<div class="tm-main-section light-gray-bg">
			<div class="container" id="main">
				<section class="tm-section row">
					<h2 class="col-lg-12 margin-bottom-30"><![CDATA[Drag & Drop]]></h2>
					<div id="cuadro1" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)">
						<div class="cuadradito" id="arrastrable1" draggable="true" ondragstart="start(event)" ondragend="end(event)"></div>
						<div class="cuadradito" id="arrastrable2" draggable="true" ondragstart="start(event)" ondragend="end(event)"></div>
						<div class="cuadradito" id="arrastrable3" draggable="true" ondragstart="start(event)" ondragend="end(event)"></div>
					</div>
					<div id="cuadro2" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)"></div>
					<div id="cuadro3" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return clonar(event)"></div>
					<div id="papelera" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return eliminar(event)"></div>
				</section>
				<section class="tm-section-row">
					<h2 class="col-lg-12 margin-bottom-30">
						Audio html5
					</h2>
					<div id="ContenedorAudio">
						<div id="fotoAudio" style="width: 100%">
							<img src="img/wrc2.jpg" width="100%">
								
							</img>
							<audio controls="true" style="width: 100%">
								<source src="/multimedia/audio.mp3"></source>
							</audio>
						</div>
					</div>
				</section>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
