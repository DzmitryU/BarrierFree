function filterOrganizations(category) {
    var checkedValues = $('input:checkbox:checked').map(function() {
        return this.value;
    }).get();
    $.ajax({
        type : "GET",
        url : "/bfree/filter",
        data : {
            category: category,
            elements: checkedValues
        },
        success : function(response) {
            clearOrganizationList();
            for (var index in response) {
                showOrganizationInList(getOrganization(response[index].id));
            }
        },
        error : function(e) {
            alert('Error: ' + e);
        }
    });
}
