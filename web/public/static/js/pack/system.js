$(document).ready(function(){

    // language
    $(".a_lang_select").click(function() 
    {
        var data={'lang':$(this).attr('lang')};
        $.get(url_system_lang_select, data, function() {
            location.reload();
        })
    })

});