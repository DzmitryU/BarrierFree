var options =
{
    "core" :
    {
        "data" : []
    },
    "plugins" : [ "wholerow", "search" ]
}

//HTree
function configureHTree(tree, data) {
    options.core.data = data;
    $(tree).jstree(options);
}

// HSearch
function addSearching(tree, searchField) {
    var to = false;
    $(searchField).keyup(function () {
        if(to) { clearTimeout(to); }
        to = setTimeout(function () {
            var v = $(searchField).val();
            $(tree).jstree(true).search(v);
        }, 250);
    });
}