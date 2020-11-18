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
</script>
<!-- stefan start -->
  
<h2>MAP DATA</h2><br>
      <div id="map"></div>
<br>

<!-- stefan end -->