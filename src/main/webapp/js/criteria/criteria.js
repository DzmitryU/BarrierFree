function filterOrganizations(category) {
    var checkedValues = $('input:checkbox:checked').map(function() {
        return this.value;
    }).get();

}
