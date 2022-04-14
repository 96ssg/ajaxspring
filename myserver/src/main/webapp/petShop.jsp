<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="icon" href="./images/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <title>Pete's Pet Shop</title>
	
    <!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-8 col-sm-push-2">
          <h1 class="text-center">Pete's Pet Shop</h1>
          <hr/>
          <br/>
        </div>
      </div>

      <div id="petsRow" class="row">
      
        <!-- PETS LOAD HERE -->
      <!-- <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="panel panel-default panel-pet">
          <div class="panel-heading">
            <h3 class="panel-title">Scrappy</h3>
          </div>
          <div class="panel-body">
            <img alt="140x140" data-src="holder.js/140x140" class="img-rounded img-center" style="width: 100%;" src="resources/images/scottish-terrier.jpeg" data-holder-rendered="true">
            <br/><br/>
            <strong>Breed</strong>: <span class="pet-breed">Golden Retriever</span><br/>
            <strong>Age</strong>: <span class="pet-age">3</span><br/>
            <strong>Location</strong>: <span class="pet-location">Warren, MI</span><br/><br/>
            <button class="btn btn-default btn-adopt" type="button" data-id="0">Adopt</button>
          </div>
        </div>
      </div> -->
      
     
              
     </div>      
   </div>


    <div id="petTemplate" style="display: none;">
      <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="panel panel-default panel-pet">
          <div class="panel-heading">
            <h3 class="panel-title"></h3>
          </div>
          <div class="panel-body">
            <img alt="140x140" data-src="holder.js/140x140" class="img-rounded img-center" style="width: 100%;" data-holder-rendered="true">
            <br/><br/>
            <strong>Breed</strong>: <span class="pet-breed"></span><br/>
            <strong>Age</strong>: <span class="pet-age"></span><br/>
            <strong>Location</strong>: <span class="pet-location"></span><br/><br/>
            <button class="btn btn-default btn-adopt" type="button" data-id="0"></button>
          </div>
        </div>
      </div>
    </div>

   
	
	<script type="text/javascript">
		var url = "http://localhost:8000/myserver/petSelect";
		$.ajax(url)
		.done(function(data){
			console.log(data);
			var $pRow = $('#petsRow');
		    var $pTemp = $('#petTemplate');
		    for (i = 0; i < data.length; i ++) {
		    	$pTemp.find('.panel-title').text(data[i].name);
		    	$pTemp.find('img').attr('src', data[i].picture);
		    	$pTemp.find('.pet-breed').text(data[i].breed);
		    	$pTemp.find('.pet-age').text(data[i].age);
		    	$pTemp.find('.pet-location').text(data[i].location);
		    	$pTemp.find('.btn-adopt').attr('data-id', data[i].id);

		    	$pRow.append($pTemp.html());
		      }
			
		})
	
	
	</script>
	
	
	
  </body>
</html>
