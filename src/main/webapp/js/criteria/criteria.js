function filterOrganizations(category) {
    var checkedValues = $('input:checkbox:checked').map(function() {
        return this.value;
    }).get();
    //$.get("/bfree/map", {category: category, criteria: checkedValues});
    $.ajax({
        type : "GET",
        url : "/bfree/map",
        data : {
            category: category,
            elements: checkedValues
        },
        success : function(response) {
        },
        error : function(e) {
            alert('Error: ' + e);
        }
    });
}
