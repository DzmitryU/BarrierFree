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
        "whole_node" : false,
        "three_state" : false,
        "keep_selected_style" : false
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
    $(search_field).keyup(function () {
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
                addOrganization(data.node.original.nodeId, data.node.text,
                    data.node.original.coordinate.lat, data.node.original.coordinate.lng);
                showMarkers();
            } else {
            }
        }
    );

    $(tree_id).bind(
        "deselect_node.jstree", function(evt, data){
            if ($(tree_id).jstree().is_leaf(data.node)) {
                removeOrganization(data.node.original.nodeId)
                showMarkers();
            } else {
            }
        }
    );
}