// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(function(){
    var url;
    $(".clear").resetDefaultValue();
        
    /* BOX OPCOES USUARIO */
    $("#btConfig").click(function(){
        if( !$(this).hasClass("aberto") ){
            $(this).addClass("aberto");
            $("#escondido").slideDown(500);
        }else{
            $(this).removeClass("aberto");
            $("#escondido").slideUp(500);
        }
    });
    /* / BOX OPCOES USUARIO */
    
    /* MARCANDO O MENU CONFORME A URL */
    try{
        url = location.pathname.split('/')[1];
        $("#menuInternas ul li").each(function(){
            if( $(this).find('a').hasClass(url) ){
                $(this).find('a').addClass('marcado');
            }
        });
    }catch(err){}
    /* / MARCANDO O MENU CONFORME A URL */

    /* PESQUISA AVANCADA */
    $("#btPesquisaAvancada").click(function(){
        if( !$(this).hasClass('pesqAvanc') ){
            $(".escondidoPesquisaAvancada").slideDown(500);
            $(".hidePA").slideUp(500);
            $(this).html("Pesquisa normal").css("paddingLeft","14px").addClass('pesqAvanc');
        }else{
            $(".escondidoPesquisaAvancada").slideUp(500);
            $(".hidePA").slideDown(500);
            $(this).html("Pesquisa avancada").css("paddingLeft","0px").removeClass('pesqAvanc');
        }
    });
    /* / PESQUISA AVANCADA */

    /* REALIZA A PESQUISA */
    $("#btRealizarPesquisa").click(function(){
        $("#guardaResultadoPesquisa").slideDown(500);
        return false;
    });
    /* / REALIZA A PESQUISA */
});

/* PLUGIN resetDefaultValue */
jQuery.fn.resetDefaultValue = function() {
    function _clearDefaultValue() {
        var _$ = $(this);
        if ( _$.val() == this.defaultValue ) {
            _$.val('');
        }
    };
    function _resetDefaultValue() {
        var _$ = $(this);
        if ( _$.val() == '' ) {
            _$.val(this.defaultValue);
        }
    };
    return this.click(_clearDefaultValue).focus(_clearDefaultValue).blur(_resetDefaultValue);
}
/* / PLUGIN resetDefaultValue */