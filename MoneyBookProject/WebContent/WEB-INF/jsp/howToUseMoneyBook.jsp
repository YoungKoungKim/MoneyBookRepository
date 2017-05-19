<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">

/* Makes images fully responsive */

.img-responsive,
.thumbnail > img,
.thumbnail a > img,
.carousel-inner > .item > img,
.carousel-inner > .item > a > img {
  display: block;
  width: 100%;
  height: 100%;
}


/* ------------------- Carousel Styling ------------------- */

.carousel-inner {
  border-radius: 15px;
}

.carousel-caption {
 /*  background-color: rgba(0,0,0,.5); */
  position: absolute;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 10;
  padding: 0 0 10px 25px;
  color: #C0C0C0;
  text-align: left;
}

.carousel-indicators {
	color: #C0C0C0;
  position: absolute;
  bottom: 0;
  right: 0;
  left: 0;
  width: 100%;
  z-index: 15;
  margin: 0;
  padding: 0 25px 25px 0;
  text-align: right;
}

.carousel-control.left,
.carousel-control.right {

  background-image: none;
}

.carousel-indicators .active {
    width: 12px;
    height: 12px;
    margin: 0;
    background-color: #C0C0C0;
}

.carousel-indicators li {
    display: inline-block;
    width: 10px;
    height: 10px;
    margin: 1px;
    text-indent: -999px;
    cursor: pointer;
    background-color: #000\9;
    background-color: rgba(0,0,0,0);
    border: 1px solid #C0C0C0;
    border-radius: 10px;
}


/* ------------------- Section Styling - Not needed for carousel styling ------------------- */

.section-white {
	margin : 30px;
   padding: 10px 0;
}

.section-white {
  background-color: #fff;
  color: #555;
}

@media screen and (min-width: 768px) {

  .section-white {
     padding: 1.5em 0;
  }

}

@media screen and (min-width: 992px) {

  .container {
    max-width: 930px;
  }

}

    
</style>
<title>이용정보보기</title>
</head>
<body>
<section class="section-white">
  <div class="container">

    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
       <!--  <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active">
          <img src="jpg/feature1-1.PNG" alt="즐겨찾기 기능으로 편리한 가계부">
          <div class="carousel-caption">
            <!-- <h2>Heading</h2> -->
          </div>
        </div>
        <div class="item">
          <img src="jpg/feature2-1.PNG" alt="피드백이 가능한 가계부">
          <div class="carousel-caption">
            <!-- <h2>Heading</h2> -->
          </div>
        </div>
        <!-- <div class="item">
        <div class="carousel-caption">
            <h2>Heading</h2>
          </div>
          <img src="http://placehold.it/800x400" alt="...">
        </div>
      </div> -->

      <!-- Controls -->
      <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
      </a>
      <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
      </a>
    </div>

  </div>
</section>
</body>
</html>