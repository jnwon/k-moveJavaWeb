<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2um8xr8ytg&callback=initMap"></script>
<script type="text/javascript">
    var map = null;

    function initMap() {
        map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.3595704, 127.105399),
            zoom: 10
        });
    }

    $(document).ready(function(){
    	$('#navTab .nav-item').click(function(){
    		$('#navTab a.active').attr('class', 'nav-link');
    		$(this).children().attr('class', 'nav-link active');
		});
    });
</script>
<!-- stefan start -->

<h2>MAP DATA</h2>
<ul class="nav nav-tabs" id="navTab">
	<li class="nav-item">
		<a class="nav-link active" href="javascript:void(0)">Air Pollution</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="javascript:void(0)">E-vehicle charge centers</a>
	<li>
	<li class="nav-item">
		<a class="nav-link" href="javascript:void(0)">Green companies</a>
	</li>
</ul>
<div id="map" style="height: 500px;"></div>
<br>

<!-- stefan end -->