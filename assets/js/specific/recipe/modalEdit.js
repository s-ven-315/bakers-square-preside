$("#editStepModal").on("click", ".delete-listitem", function(){
    var text = $(this).parent().children().last().text();
    $(this).parent().remove();
    var avoid = "," + text
    str = str.replace(avoid.trim(), "");
    $(".step-submit").val(str);
})

$("#editIngrModal").on("click", ".delete-listitem", function(){
    var text = $(this).parent().children().last().text();
    $(this).parent().remove();
    var avoid = "," + text
    console.log(text, avoid)
    inputStr = inputStr.replace(avoid.trim(), "");
    $(".ingr-submit").val(inputStr);
})

