<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2um8xr8ytg&callback=initMap"></script>
<script type="text/javascript" src="/testForKmove/s/greenCompanies.json"></script>
<script type="text/javascript">
	var map = null;
	var lat;
	var lng;

    $(document).ready(function(){
    	map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.5666805, 126.9784147),
            zoom: 10
        });
    	
     	$.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "/testForKmove/s/ChargeCenter.xml",
            dataType : "xml",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(data){
            	$('#navTab .nav-item').click(function(){
            		$('#navTab a.active').attr('class', 'nav-link');
            		$(this).children().attr('class', 'nav-link active');
            		
            		if($(this).children().attr('id') == 'GreenCompaniesTab'){
            	    	map.destroy();
            	    	initNaverMap(jsonData, 37.5666805, 126.9784147, 9, greenCompanieeMarkerSeter, greenCompanieesClickHandler);
            		}
            		else if($(this).children().attr('id') == 'ChargeCenterTab'){
            			navigator.geolocation.getCurrentPosition(function(pos) {
            			    lat = pos.coords.latitude;
            			    lng = pos.coords.longitude;
                	    	map.destroy();
                	    	initNaverMap(data, lat, lng, 12, chargeCenterMarkerSeter, chargeCenterClickHandler);            			    
            			});
            		}            		
            		
        		});            	
            }
    	});
    });
    
    function greenCompanieeMarkerSeter(data, markers, infoWindows, infoModals){    	
    	for (i=0; i< data.length; i++) {
        	
    	    var position = new naver.maps.LatLng(parseFloat(data[i].REFINE_WGS84_LAT), parseFloat(data[i].REFINE_WGS84_LOGT));
    	
     	    var marker = new naver.maps.Marker({
    	        map: map,
    	        position: position,
    	        zIndex: 100
    	    });
    	
    	    var infoWindow = new naver.maps.InfoWindow({
    	        content: '<div style="width:150px;text-align:center;padding:10px;font-size:80%;">'+ data[i].ENTRPS_NM +'"</b></div>'
    	    });
    	
    	    markers.push(marker);
    	    infoWindows.push(infoWindow);    	    
    	}
    }
    
    var i=0;
    
    function chargeCenterMarkerSeter(data, markers, infoWindows, infoModals, southWest, northEast){
    	    	
     	$(data).find('item').each(function(){
     		var lat = $(this).find('lat').text();
     		var lng = $(this).find('lng').text();
     		
     		if((northEast.lat() > lat && lat > southWest.lat()) && (northEast.lng() > lng && lng > southWest.lng())){
     						
	     		var position = new naver.maps.LatLng(parseFloat(lat), parseFloat(lng));
	        	
	     	    var marker = new naver.maps.Marker({
	    	        map: map,
	    	        position: position,
	    	        zIndex: 100
	    	    });
	    	
	    	    var infoWindow = new naver.maps.InfoWindow({
	    	        content: '<div style="width:150px;text-align:center;padding:10px;font-size:80%;">'+ $(this).find('statNm').text() +'"</b></div>'
	    	    });
	    	    
	    	    console.log(++i + ": " + $(this).find('statNm').text());
	    	
	    	    markers.push(marker);
	    	    infoWindows.push(infoWindow);
     		}
    	});
     	
    }    
	
    function initNaverMap(data, centerLat, centerLog, zoomLevel, markerSeter, clickHandler) {
        map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(centerLat, centerLog),
            zoom: zoomLevel
        });
        
        var bounds = map.getBounds(),
        southWest = bounds.getSW(),
        northEast = bounds.getNE(),
        lngSpan = northEast.lng() - southWest.lng(),
        latSpan = northEast.lat() - southWest.lat();

    	var markers = [],
    	infoWindows = [];
    	infoModals = [];
   
     	markerSeter(data, markers, infoWindows, infoModals, southWest, northEast);
    	
     	naver.maps.Event.addListener(map, 'idle', function() {
    	    updateMarkers(map, markers);
    	});
    	
    	function updateMarkers(map, markers) {
    	
    	    var mapBounds = map.getBounds();
    	    var marker, position;
    	
    	    for (var i = 0; i < markers.length; i++) {
    	
    	        marker = markers[i]
    	        position = marker.getPosition();
    	
    	        if (mapBounds.hasLatLng(position)) {
    	            showMarker(map, marker);
    	        } else {
    	            hideMarker(map, marker);
    	        }
    	    }
    	}
    	
    	function showMarker(map, marker) {
    	
    	    if (marker.setMap()) return;
    	    marker.setMap(map);
    	}
    	
    	function hideMarker(map, marker) {
    	
    	    if (!marker.setMap()) return;
    	    marker.setMap(null);
    	}
    	    	
    	for (var i=0, ii=markers.length; i<ii; i++) {
    	    naver.maps.Event.addListener(markers[i], 'click', clickHandler(data, markers, infoWindows, infoModals, i));
    	}
    	
    }
    
	function greenCompanieesClickHandler(data, markers, infoWindows, infoModals, seq) {
	    return function(e) {
	        var marker = markers[seq],
	        infoWindow = infoWindows[seq];
	
	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	            $("#ENTRPS_NM").text(data[seq].ENTRPS_NM);
	            $("#CONTCT_NO").text(data[seq].CONTCT_NO);
	            $("#REPRSNTV_NM").text('대표자 : '+data[seq].REPRSNTV_NM);
	            $("#INDUTYPE_NM").text('분야 : '+data[seq].INDUTYPE_NM);
	            $("#REFINE_ROADNM_ADDR").text(data[seq].REFINE_ROADNM_ADDR);
	            $("#GreenCompanyModal").modal();
	        }
	    }
	}
	
	function chargeCenterClickHandler(data, markers, infoWindows, infoModals, seq) {
	    return function(e) {
	        var marker = markers[seq],
	        infoWindow = infoWindows[seq];
	
	        if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, marker);
	            $("#statNm").text(data[seq].ENTRPS_NM);
	            $("#CONTCT_NO").text(data[seq].CONTCT_NO);
	            $("#REPRSNTV_NM").text('대표자 : '+data[seq].REPRSNTV_NM);
	            $("#INDUTYPE_NM").text('분야 : '+data[seq].INDUTYPE_NM);
	            $("#REFINE_ROADNM_ADDR").text(data[seq].REFINE_ROADNM_ADDR);
	            $("#GreenCompanyModal").modal();
	        }
	    }
	}

</script>
<!-- stefan start -->

<h2>MAP DATA</h2>
<ul class="nav nav-tabs" id="navTab">
	<li class="nav-item">
		<a class="nav-link active" href="javascript:void(0)" id="AirPollutionTab">Air Pollution</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="javascript:void(0)" id="ChargeCenterTab">E-vehicle charge centers</a>
	<li>
	<li class="nav-item">
		<a class="nav-link" href="javascript:void(0)" id="GreenCompaniesTab">Green companies</a>
	</li>
</ul>
<div id="map" style="height: 500px;"></div>
<br>

<!-- The Modal -->
<div class="modal fade" id="GreenCompanyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="ENTRPS_NM">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="REFINE_ROADNM_ADDR">sample</p>
        <p id="CONTCT_NO">data</p>
        <p id="REPRSNTV_NM"></p>
        <p id="INDUTYPE_NM"></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<div class="modal fade" id="ChargeCenterModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="statNm">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="REFINE_ROADNM_ADDR">sample</p>
        <p id="CONTCT_NO">data</p>
        <p id="REPRSNTV_NM"></p>
        <p id="INDUTYPE_NM"></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<!-- stefan end -->