<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>
<div class="container">

   <div class="center-block">
      <div class="text-center main-block">
        <div class="col-md-12">
          <div class="demo-frame">
            <div class="demo-container">
              <img id="img_tracking" src="<?php echo base_url('uploads/gallery/faces.jpg');?>" />
              <!-- <img id="img_tracking" src="<?php echo base_url('uploads/gallery/10275287_875775332540613_4181229518108083063_o_612.jpg');?>" /> -->
            </div>
          </div>          
          <div class="pull-left handler-text"><h1></h1></div>
        </div>
    </div>
  </div>

  <style>
  .rect {
    border: 2px solid #a64ceb;
    left: -1000px;
    position: absolute;
    top: -1000px;
  }
  #img_tracking {
    /*position: absolute;*/
    /*top: 50%;*/
    /*left: 50%;*/
    /*margin: -173px 0 0 -300px;*/
  }
  </style>

  <script>
    window.onload = function() {

      var img = document.getElementById('img_tracking');
      var tracker = new tracking.ObjectTracker(['face']);

      tracker.setStepSize(1.7);
      tracking.track('#img_tracking', tracker);

      tracker.on('track', function(event) {
        event.data.forEach(function(rect) {
          window.plot(rect.x, rect.y, rect.width, rect.height);
        });

          if (event.data.length === 0) {

            // No targets were detected in this frame.            
            // Text information that displayed the information of the image tracking
            $('.handler-text h1').html();


          } if (event.data.length === 3) {             

            // Text information that displayed the information of the image tracking            
            $('.handler-text h1').html('<small>Thanks you good to go!</small> <button class="btn btn-primary">Submit</button>');

          } else {

            // Text information that displayed the information of the image tracking
            $('.handler-text h1').html('You no good to go, please upload other image..');

            // console.log(event.data.length);
            event.data.forEach(function(data) {
              // Plots the detected targets here.
            });

          }
        
      });

      window.plot = function(x, y, w, h) {
        var rect = document.createElement('div');
        document.querySelector('.demo-container').appendChild(rect);
        rect.classList.add('rect');
        rect.style.width = w + 'px';
        rect.style.height = h + 'px';
        rect.style.left = (img.offsetLeft + x) + 'px';
        rect.style.top = (img.offsetTop + y) + 'px';
      };

    };
  </script>
  <!-- /.container -->
</div>    