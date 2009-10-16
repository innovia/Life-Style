  GEvent.addDomListener( window, 'unload', GUnload );
  //
  // These variables are referenced globally
  //
  var map4;
  var streetviewclient4;
  var streetviewpanorama4;
  var center4 = new GLatLng( 40.733210, -73.991032 );
  //
  // Initialize Function
  //
  function map4_initialize( )
  {
    if ( GBrowserIsCompatible( ) )
    {
      //
      // 1) Setup google map and its interface
      //
      map4 = new GMap2( document.getElementById( 'map4div' ) );
      map4.addControl( new GSmallMapControl( ) );
      map4.addControl( new GMenuMapTypeControl( ) );
      map4.setCenter( center4, 14 );
      //
      // 2) Setup onclick event for google map
      //
      streetviewclient4 = new GStreetviewClient( );
      GEvent.addListener( map4, 'click', function( overlay, latlng )
        {
          streetviewclient4.getNearestPanorama( latlng, streetviewclient_callback );
        }
      );
      //
      // 3) Setup street view panorama
      //
      streetviewpanorama4 = new GStreetviewPanorama( document.getElementById( 'streetviewpanorama4div' ) );
      streetviewpanorama4.setLocationAndPOV( center4 );
      GEvent.addListener( streetviewpanorama4, 'error', streetviewpanorama_error );
      //
      // 4) Load a panorama
      //
      streetviewclient4.getNearestPanorama( center4, streetviewclient_callback );
    }
  }
  //
  // Callback function -- this function is called indirectly when:
  // * User clicks on the google map
  // * User clicks on one of the 'other panoramas'
  //
  function streetviewclient_callback( streetviewdata )
  {
    //
    // 1) Check errors
    //
    if ( streetviewdata.code != GStreetviewClient.ReturnValues.SUCCESS )
    {
      alert( 'GStreetviewClient.getNearestPanorama( ) failed: ' + streetviewdata.code );
      return;
    }
    //
    // 2) Display tooltip and 'other panoramas'
    //
    var info = '';
    info += '<strong>' + streetviewdata.location.description + '</strong><br/>\n';
    info += '<small>' + streetviewdata.copyright + '</small><br/>\n';
    info += '<strong>Other Panoramas:</strong><br/>\n';
    for ( var i = 0; i < streetviewdata.links.length; i++ )
    {
      info += '&rsaquo; <a href="#" onclick="oncustomclick( &quot;' + streetviewdata.links[ i ].panoId + '&quot; ); return false;">' + streetviewdata.links[ i ].description + '</a><br/>\n';
    }
    map4.openInfoWindowHtml( streetviewdata.location.latlng, '<div style="width: 200px; height: 100px; overflow: auto;">' + info + '</div>' );
    //
    // 3) Synchronize street view panorama
    //
    streetviewpanorama4.setLocationAndPOV( streetviewdata.location.latlng );
  }
  function oncustomclick( id )
  {
    streetviewclient4.getPanoramaById( id, streetviewclient_callback );
  }
  function streetviewpanorama_error( code )
  {
    if ( code == GStreetviewPanorama.ErrorValues.FLASH_UNAVAILABLE )
    {
      alert( 'You need Flash player to view the panorama.' );
      return;
    }
  }
  GEvent.addDomListener( window, 'load', map4_initialize );