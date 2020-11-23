<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:import url="http://open.ev.or.kr:8080/openapi/services/rest/EvChargerService?serviceKey=Br9ZD1jNUSVEWk2pzmFs4d6YxbkJ87tZQ%2BotT9cHiPf6xGKNwrR94bOypjcYra1PsaMIqaur86JPZkw3uI29Rw%3D%3D&" /> --%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2um8xr8ytg&callback=initMap"></script>
<script type="text/javascript" src="/testForKmove/s/greenCompanies.json"></script>
<script type="text/javascript">
	var map = null;

    $(document).ready(function(){
    	map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.5666805, 126.9784147),
            zoom: 10
        });
    	
/*     	$.ajax({
            type : "GET", //전송방식을 지정한다 (POST,GET)
            url : "http://open.ev.or.kr:8080/openapi/services/rest/EvChargerService?serviceKey=Br9ZD1jNUSVEWk2pzmFs4d6YxbkJ87tZQ%2BotT9cHiPf6xGKNwrR94bOypjcYra1PsaMIqaur86JPZkw3uI29Rw%3D%3D&",
            dataType : "xml",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
            error : function(){
                console.log("connection down!!!!");
            },
            success : function(data){
            	console.log(data)
            }
    	}); */
    	
    	$('#navTab .nav-item').click(function(){
    		$('#navTab a.active').attr('class', 'nav-link');
    		$(this).children().attr('class', 'nav-link active');
    		if($(this).children().attr('id') == 'GreenCompaniesTab'){
    	    	map.destroy();
    	    	initMapForGreenCompanies();
    		}
		});
    }); 	
	
    function initMapForGreenCompanies() {
        map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.5666805, 126.9784147),
            zoom: 9
        });
        
        var bounds = map.getBounds(),
        southWest = bounds.getSW(),
        northEast = bounds.getNE(),
        lngSpan = northEast.lng() - southWest.lng(),
        latSpan = northEast.lat() - southWest.lat();

    	var markers = [],
    	infoWindows = [];
    	
    	for (i=0; i< jsonData.length; i++) {
    	
    	    var position = new naver.maps.LatLng(parseFloat(jsonData[i].REFINE_WGS84_LAT), parseFloat(jsonData[i].REFINE_WGS84_LOGT));
    	
     	    var marker = new naver.maps.Marker({
    	        map: map,
    	        position: position,
    	        zIndex: 100
    	    });
    	
    	    var infoWindow = new naver.maps.InfoWindow({
    	        content: '<div style="width:150px;text-align:center;padding:10px;">'+ jsonData[i].ENTRPS_NM +'"</b></div>'
    	    });
    	
    	    markers.push(marker);
    	    infoWindows.push(infoWindow);    	    
    	}
    	
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
    	
    	// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
    	function getClickHandler(seq) {
    	    return function(e) {
    	        var marker = markers[seq],
    	        infoWindow = infoWindows[seq];
    	
    	        if (infoWindow.getMap()) {
    	            infoWindow.close();
    	        } else {
    	            infoWindow.open(map, marker);
    	            $("#ENTRPS_NM").text(jsonData[seq].ENTRPS_NM);
    	            $("#CONTCT_NO").text(jsonData[seq].CONTCT_NO);
    	            $("#REPRSNTV_NM").text('대표자 : '+jsonData[seq].REPRSNTV_NM);
    	            $("#INDUTYPE_NM").text('분야 : '+jsonData[seq].INDUTYPE_NM);
    	            $("#REFINE_ROADNM_ADDR").text(jsonData[seq].REFINE_ROADNM_ADDR);
    	            $("#GreenCompanyModal").modal();
    	        }
    	    }
    	}
    	
    	for (var i=0, ii=markers.length; i<ii; i++) {
    	    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
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

<!-- stefan end -->