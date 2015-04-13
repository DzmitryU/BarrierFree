var options =
{
    "core" :
    {
        "data" : [],
        "themes" : {
            "icons" : false
        }
    },
    "checkbox" :
    {
        "three_state" : false,
        "whole_node" : false
    },
    "plugins" : [ "wholerow", "search", "checkbox" ]
}

//HTree
function configureHTree(tree_id, data) {
    options.core.data = data;
    $(tree_id).jstree(options);
    bindCheckbox(tree_id);
}

// HSearch
function addSearching(tree_id, search_field) {
    var to = false;
    $(tree_id).keyup(function () {
        if(to) { clearTimeout(to); }
        to = setTimeout(function () {
            var v = $(search_field).val();
            $(tree_id).jstree(true).search(v);
        }, 250);
    });
}

//Checkbox
function bindCheckbox(tree_id) {
    $(tree_id).bind(
        "select_node.jstree", function(evt, data){
            if ($(tree_id).jstree().is_leaf(data.node)) {
                addOrganization(data.node.original.coordinate.lat, data.node.original.coordinate.lng, data.node.text);
                showMarkers();
            } else {
            }
        }
    );
}