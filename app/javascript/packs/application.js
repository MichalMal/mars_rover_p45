// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import 'bootstrap'

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
$(document).on("turbolinks:load", () => {
    let rovers = $('#map').data('rovers');
    let image_path = $('#map').data('image');
    $.each(rovers, function( key, value ) {
        console.log( key + ": " + value.x_coordinate );

        $(`td#x${value.x_coordinate}y${value.y_coordinate}`).html(`<img src=${image_path} alt="${value.name}" width="40" data-toggle="tooltip" data-placement="top" title="${value.name}">`);






      });
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
