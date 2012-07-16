(function($){

    $.fn.extend({

        //pass the options variable to the function
        myscroll: function(options, callback) {


            //Set the default values, use comma to separate the settings, example:
            var defaults = {
                padding: 20,
                mouseOverColor : '#000000',
                mouseOutColor : '#ffffff'
            }

            var options =  $.extend(defaults, options);

            return this.each(function() {
                var o = options;
                var obj = $(this);

                obj.scroll(function() {

                    if ( obj[0].scrollHeight - obj.scrollTop() ==  obj.outerHeight() ) {
                        if(typeof callback == 'function'){
                          callback.call(this, data);
                        }
                    }
                });

            });
        }
    });

})(jQuery);